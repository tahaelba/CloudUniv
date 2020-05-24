from datetime import datetime
from sqlalchemy import or_,and_
from flask import render_template, url_for, flash, redirect, request, Blueprint,abort,current_app
from flask_login import login_user, current_user, logout_user, login_required
from flaskblog import db, bcrypt
from flaskblog.models import User, Post, Skill,Recommendation
from flaskblog.users.forms import (RegistrationForm_Student,RegistrationForm, RegistrationForm_Professor , RegistrationForm_Entity,
    LoginForm ,UpdateAccountForm,RequestResetForm,ResetPasswordForm,SkillForm,RecommendationForm)
from flaskblog.users.utils import save_picture, send_reset_email
from flaskblog.users.forms import MessageForm
from flaskblog.models import Message

users = Blueprint('users', __name__)


@users.route("/register", methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    return render_template('register.html', title='Register')

@users.route("/register_student", methods=['GET', 'POST'])
def register_student():
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    form = RegistrationForm_Student()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(role = 'Student',firstname = form.firstname.data ,lastname = form.lastname.data,birthday=form.birthday.data,
        location = form.location.data,departement=form.departement.data,year=form.year.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash('Your account has been created! You are now able to log in', 'success')
        return redirect(url_for('users.login'))
    return render_template('register_student.html', title='Register', form=form)

@users.route("/register_professor", methods=['GET', 'POST'])
def register_professor():
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    form = RegistrationForm_Professor()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(role = 'Professor',firstname = form.firstname.data ,lastname = form.lastname.data,birthday=form.birthday.data,
        location = form.location.data,departement=form.departement.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash('Your account has been created! You are now able to log in', 'success')
        return redirect(url_for('users.login'))
    return render_template('register_professor.html', title='Register', form=form)

@users.route("/register_entity", methods=['GET', 'POST'])
def register_entity():
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    form = RegistrationForm_Entity()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(role = 'Entity',firstname = form.firstname.data ,lastname = form.lastname.data,birthday=form.birthday.data,
        company=form.company.data,location = form.location.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash('Your account has been created! You are now able to log in', 'success')
        return redirect(url_for('users.login'))
    return render_template('register_entity.html', title='Register', form=form)



@users.route("/login", methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user and bcrypt.check_password_hash(user.password, form.password.data):
            user.last_login = datetime.now()
            login_user(user, remember=form.remember.data)
            next_page = request.args.get('next')
            
            return redirect(next_page) if next_page else redirect(url_for('main.home'))
        else:
            flash('Login Unsuccessful. Please check email and password', 'danger')
    return render_template('login_v2.html', title='Login', form=form)


@users.route("/logout")
def logout():
    logout_user()
    return redirect(url_for('main.home'))


@users.route('/user_profile/<id>')
@login_required
def profile(id):
    page = request.args.get('page', 1, type=int)
    user = User.query.filter_by(id=id).first_or_404()
    skills = Skill.query.filter_by(user_id=id).all()
    image_file = url_for('static', filename='profile_pics/' + current_user.image_file)
    posts = Post.query.filter_by(user_id=id).order_by(Post.date_posted.desc()).paginate(page=page, per_page=15)
    return render_template('user_posts_v2.html', title='Profile',user=user,image_file=image_file,posts = posts, skills=skills)

@users.route("/add_skill/<id>", methods=['GET', 'POST'])
@login_required
def add_skill(id):
    user = User.query.filter_by(id=id).first_or_404()
    if (user != current_user) :
        abort(403)
    form = SkillForm()
    page = request.args.get('page', 1, type=int)
    image_file = url_for('static', filename='profile_pics/' + current_user.image_file)
    posts = Post.query.filter_by(user_id=id).order_by(Post.date_posted.desc()).paginate(page=page, per_page=15)
    skills = Skill.query.filter_by(user_id=id).all()
    if form.validate_on_submit():
        skill = Skill(skill=form.skill.data, user_id=current_user.id)
        db.session.add(skill)
        db.session.commit()
        flash('Your skill has been added!', 'success')
        return redirect(url_for('users.profile',id=id))
    
    return render_template('add_skill_v2.html',form=form,title = 'Profile', user=current_user,image_file=image_file,posts=posts,skills=skills)
#####
@users.route("//add_skill/<id>/delete", methods=['GET','POST'])
@login_required
def delete_skill(id):
    skill = Skill.query.get_or_404(id)
    if skill.skilled != current_user:
        abort(403)
    db.session.delete(skill)
    db.session.commit()
    flash('Your skill has been deleted!', 'success')
    page = request.args.get('page', 1, type=int)
    skills = Skill.query.filter_by(user_id=current_user.id).all()
    posts = Post.query.filter_by(author=current_user)\
        .order_by(Post.date_posted.desc())\
        .paginate(page=page, per_page=7)
    image_file = url_for('static', filename='profile_pics/' + current_user.image_file)
    return render_template('user_posts_v2.html', title= 'Profile', user=current_user, posts=posts, image_file=image_file,skills = skills)
####

@users.route("/recommendation/<id>", methods=['GET', 'POST'])
@login_required
def recommend(id):
    if current_user.role == 'Student':
        abort(403)
    user = User.query.filter_by(id=id).first_or_404()
    form = RecommendationForm()
    if form.validate_on_submit():
        recommedation = Recommendation(comment =form.comment.data,skill =form.skill.data, recommended = user, recommender=current_user)
        db.session.add(recommedation)
        db.session.commit()
        flash('Your Recommendation has been Saved!', 'success')
        return redirect(url_for('users.user_posts', id = id))
    return render_template('create_recommendation_v2.html', title='New Recommendation',
                           form=form, legend='New Recommendation',user=user)

@users.route('/user/<id>')
@login_required
def user_posts(id): 
    page = request.args.get('page', 1, type=int)
    user = User.query.filter_by(id=id).first_or_404()
    skills = Skill.query.filter_by(user_id=id).all()
    recommendations = Recommendation.query.filter_by(recommended=user).order_by(Post.date_posted.desc())
    posts = Post.query.filter_by(author=user)\
        .order_by(Post.date_posted.desc())\
        .paginate(page=page, per_page=7)
    image_file = url_for('static', filename='profile_pics/' + user.image_file)
    return render_template('user_posts_v2.html', title= 'Profile', user=user, posts=posts, 
                            image_file=image_file,skills = skills,recommendations=recommendations)


@users.route("/settings", methods=['GET', 'POST'])
@login_required
def settings():
    form = UpdateAccountForm()
    if form.validate_on_submit():
        if form.picture.data:
            picture_file = save_picture(form.picture.data)
            current_user.image_file = picture_file
        current_user.firstname = form.firstname.data
        current_user.lastname = form.lastname.data
        current_user.email = form.email.data
        current_user.about = form.about.data
        current_user.location = form.location.data
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        current_user.password = hashed_password
        db.session.commit()
        flash('Your account has been updated!', 'success')
        return redirect(url_for('users.user_posts',id = current_user.id))
    elif request.method == 'GET':
        form.firstname.data = current_user.firstname
        form.lastname.data = current_user.lastname
        form.about.data = current_user.about
        form.email.data = current_user.email
        form.birthday.data = current_user.birthday
        form.location.data = current_user.location
    image_file = url_for('static', filename='profile_pics/' + current_user.image_file)
    return render_template('settings.html', title='Settings',
                           image_file=image_file, form=form)


@users.route("/reset_password", methods=['GET', 'POST'])
def reset_request():
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    form = RequestResetForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        send_reset_email(user)
        flash('An email has been sent with instructions to reset your password.', 'info')
        return redirect(url_for('users.login'))
    return render_template('reset_request_v2.html', title='Reset Password', form=form)


@users.route("/reset_password/<token>", methods=['GET', 'POST'])
def reset_token(token):
    if current_user.is_authenticated:
        return redirect(url_for('main.home'))
    user = User.verify_reset_token(token)
    if user is None:
        flash('That is an invalid or expired token', 'warning')
        return redirect(url_for('users.reset_request'))
    form = ResetPasswordForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user.password = hashed_password
        db.session.commit()
        flash('Your password has been updated! You are now able to log in', 'success')
        return redirect(url_for('users.login'))
    return render_template('reset_token_v2.html', title='Reset Password', form=form)

@users.route('/send_message/<id>', methods=['GET', 'POST'])
@login_required
def send_message(id):
    user = User.query.filter_by(id=id).first_or_404()
    form = MessageForm()
    if form.validate_on_submit():
        msg = Message(author=current_user, recipient=user,
                      body=form.message.data)
        db.session.add(msg)
        db.session.commit()
        flash('Your message has been sent.','success')
        return redirect(url_for('users.user_posts', id=id))
    return render_template('send_message.html', title=('Send Message'),
                           form=form, recipient=user)

@users.route('/messages')
@login_required
def messages():
    current_user.last_message_read_time = datetime.utcnow()
    db.session.commit()
    page = request.args.get('page', 1, type=int)
    messages = db.session.query(Message).filter(and_(or_(Message.sender_id==current_user.id, Message.recipient_id==current_user.id) , or_(Message.sender_id==current_user.id, Message.recipient_id==current_user.id))).order_by(
        Message.timestamp.desc()).paginate(page=page, per_page=15)
    next_url = url_for('users.messages', page=messages.next_num) \
        if messages.has_next else None
    prev_url = url_for('users.messages', page=messages.prev_num) \
        if messages.has_prev else None
    return render_template('messages.html', messages=messages.items,
                           next_url=next_url, prev_url=prev_url)

@users.route('/chatting/<id>', methods=['GET', 'POST'])
@login_required
def chatting(id):
    current_user.last_message_read_time = datetime.utcnow()
    db.session.commit()
    user = User.query.filter_by(id=id).first_or_404()
    form = MessageForm()
    seen = []
    if form.validate_on_submit():
        msg = Message(author=current_user, recipient=user,
                    body=form.message.data)
        db.session.add(msg)
        db.session.commit()
    messages = db.session.query(Message).filter(and_(or_(Message.sender_id==current_user.id, Message.recipient_id==current_user.id) , or_(Message.sender_id==current_user.id, Message.recipient_id==current_user.id))).order_by(
        Message.timestamp.desc())
    if user==current_user:
        messid = messages
    else:
        messid = [message for message in messages if (message.author == current_user and message.recipient == user) or (message.author == user and message.recipient == current_user) ]
    return render_template('chat_room_v2.html', messages=messages, form=form, seen=seen, messid = messid)


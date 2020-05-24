from flask import (render_template, url_for, flash,
                   redirect, request, abort, Blueprint)
from flask_login import current_user, login_required
from flaskblog import db
from flaskblog.models import Post,PostLike,SkillPost
from flaskblog.posts.forms import PostForm,SkillRequiredForm

posts = Blueprint('posts', __name__)


@posts.route("/post/new", methods=['GET', 'POST'])
@login_required
def new_post():
    form = PostForm()
    if form.validate_on_submit():
        post = Post(title=form.title.data, content=form.content.data, author=current_user)
        db.session.add(post)
        db.session.commit()
        return redirect(url_for('posts.add_skills', id = post.id))
    return render_template('create_post_v2.html', title='New Post',
                           form=form, legend='New Post')


@posts.route("/post/skills/<int:id>", methods=['GET', 'POST'])
@login_required
def add_skills(id):
    form = SkillRequiredForm()
    skills = SkillPost.query.filter_by(post_id=id).all()
    post = Post.query.get_or_404(id)
    if post.author != current_user:
        abort(403)
    if form.validate_on_submit():
        skill = SkillPost(skill=form.skill.data, post_id=id)
        db.session.add(skill)
        db.session.commit()
        skills = SkillPost.query.filter_by(post_id=id).all()
        form.skill.data = None
        return render_template('postskills.html',form=form,post=post,title = 'New Post',skills=skills)
    
    return render_template('postskills.html',form=form,post = post , title = 'New Post',skills=skills)    
    
    
@posts.route("/post/<int:post_id>")
def post(post_id):
    post = Post.query.get_or_404(post_id)
    skills = SkillPost.query.filter_by(post_id=post_id).all()
    return render_template('post_v2.html', title=post.title, post=post,skills = skills)


#####################################
@posts.route('/application/<int:post_id>/<action>', methods=['GET', 'POST'])
@login_required
def like_action(post_id,action):
    post = Post.query.filter_by(id=post_id).first_or_404()
    if action == 'apply': 
        current_user.like_post(post)
        db.session.commit()
    if action == 'cancel':
        current_user.unlike_post(post)
        db.session.commit()
    return render_template('post_v2.html', title=post.title, post=post)

##############################################
@posts.route("/post/<int:post_id>/update", methods=['GET', 'POST'])
@login_required
def update_post(post_id):
    post = Post.query.get_or_404(post_id)
    if post.author != current_user:
        abort(403)
    form = PostForm()
    if form.validate_on_submit():
        post.title = form.title.data
        post.content = form.content.data
        db.session.commit()
        flash('Your post has been updated!', 'success')
        return redirect(url_for('posts.post', post_id=post.id))
    elif request.method == 'GET':
        form.title.data = post.title
        form.content.data = post.content 
    return render_template('create_post_v2.html', title='Update Post',
                           form=form, legend='Update Post')


@posts.route("/post/<int:post_id>/delete", methods=['POST'])
@login_required
def delete_post(post_id):
    post = Post.query.get_or_404(post_id)
    if post.author != current_user:
        abort(403)
    db.session.delete(post)
    db.session.commit()
    flash('Your post has been deleted!', 'success')
    return redirect(url_for('main.home'))

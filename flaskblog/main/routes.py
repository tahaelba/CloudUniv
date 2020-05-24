from flask import render_template, request, Blueprint,url_for, redirect
from flask_login import login_user, current_user, login_required
from flaskblog.models import Post,SkillPost

main = Blueprint('main', __name__)


@main.route("/")
@main.route("/home")
def home(): 
    if not current_user.is_authenticated:
        return redirect(url_for('users.login'))
    page = request.args.get('page', 1, type=int)
    posts = Post.query.order_by(Post.date_posted.desc()).paginate(page=page, per_page=7)
    ps = Post.query.order_by(Post.date_posted.desc())
    t={}
    for p in ps :
        t[p.id] = SkillPost.query.filter_by(post_id=p.id).all()
    return render_template('home_v2.html', posts=posts,t = t)

@main.route("/studentsposts")
def studentsposts(): 
    if not current_user.is_authenticated:
        return redirect(url_for('users.login'))
    page = request.args.get('page', 1, type=int)
    posts = Post.query.order_by(Post.date_posted.desc()).paginate(page=page, per_page=7)
    ps = Post.query.order_by(Post.date_posted.desc())
    t={}
    for p in ps :
        t[p.id] = SkillPost.query.filter_by(post_id=p.id).all()
    return render_template('studentposts.html', posts=posts, t=t)

@main.route("/professorsposts")
def professorsposts(): 
    if not current_user.is_authenticated:
        return redirect(url_for('users.login'))
    page = request.args.get('page', 1, type=int)
    posts = Post.query.order_by(Post.date_posted.desc()).paginate(page=page, per_page=7)
    ps = Post.query.order_by(Post.date_posted.desc())
    t={}
    for p in ps :
        t[p.id] = SkillPost.query.filter_by(post_id=p.id).all()
    return render_template('professorposts.html', posts=posts,t=t)

@main.route("/entitiesposts")
def entitiesposts(): 
    if not current_user.is_authenticated:
        return redirect(url_for('users.login'))
    page = request.args.get('page', 1, type=int)
    posts = Post.query.order_by(Post.date_posted.desc()).paginate(page=page, per_page=7)
    ps = Post.query.order_by(Post.date_posted.desc())
    t={}
    for p in ps :
        t[p.id] = SkillPost.query.filter_by(post_id=p.id).all()
    return render_template('entityposts.html', posts=posts,t=t)


@main.route("/about")
def about():
    return render_template('about.html', title='About')

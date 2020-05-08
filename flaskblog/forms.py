from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField, PasswordField, SubmitField, BooleanField,SelectField, TextAreaField,IntegerField
from wtforms.validators import DataRequired, Length, Email, EqualTo,ValidationError,NumberRange
from flaskblog.models import User,Student


class RegistrationForm_Professor(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)])
    firstname = StringField('First name',
                            validators=[DataRequired(), Length(min=4, max=40)])
    lastname = StringField('Last name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    departement = SelectField('Departement', choices=[('GRT', 'GRT'), ('GI', 'GI'),
                                        ('GE', 'GE'), ('GIL', 'GIL')])
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')
    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('That username is taken. Please choose a different one.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('That email is taken. Please choose a different one.')


class RegistrationForm_Student(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=4, max=40)])
    firstname = StringField('First name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    lastname = StringField('Last name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    year = IntegerField('years',validators=[DataRequired(), NumberRange(min=1, max=5)])

    departement = SelectField('Departement',choices=[('GRT','Networs & Telecoms'),
                                         ('GI', 'Computer Science'),
                                        ('GE', 'Electrical Engineering'),
                                        ('GIL','Industrial Engineering')])
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')
    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('That username is taken. Please choose a different one.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('That email is taken. Please choose a different one.')
    

class RegistrationForm_Entity(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)])
    firstname = StringField('First name',
                            validators=[DataRequired(), Length(min=4, max=40)])
    lastname = StringField('Last name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    company = StringField('Company',
                           validators=[DataRequired(), Length(min=4, max=60)])
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')
    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user:
            raise ValidationError('That username is taken. Please choose a different one.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('That email is taken. Please choose a different one.')


class LoginForm(FlaskForm):
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember = BooleanField('Remember Me')
    submit = SubmitField('Login')


class UpdateAccountForm(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)])
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    picture = FileField('Update Profile Picture', validators=[FileAllowed(['jpg', 'png','jpeg'])])
    submit = SubmitField('Update')

    def validate_username(self, username):
        if username.data != current_user.username:
            user = User.query.filter_by(username=username.data).first()
            if user:
                raise ValidationError('That username is taken. Please choose a different one.')

    def validate_email(self, email):
        if email.data != current_user.email:
            user = User.query.filter_by(email=email.data).first()
            if user:
                raise ValidationError('That email is taken. Please choose a different one.')


class PostForm(FlaskForm):
    title = StringField('Title', validators=[DataRequired()])
    content = TextAreaField('Content', validators=[DataRequired()])
    submit = SubmitField('Post')


class RequestResetForm(FlaskForm):
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    submit = SubmitField('Request')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is None:
            raise ValidationError('There is no account with that email. You must register first.')

class ResetPasswordForm(FlaskForm):
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Reset Password')


############################################################################
@posts.route("/post/<int:post_id>")
def post(post_id):
    post = Post.query.get_or_404(post_id)
    return render_template('post.html', title=post.title, post=post)

##############
{% if post.author == current_user %}
          <div>
            <a class="btn btn-secondary btn-sm mt-1 mb-1" href="{{ url_for('posts.update_post', post_id=post.id) }}">Update</a>
            <button type="button" class="btn btn-danger btn-sm m-1" data-toggle="modal" data-target="#deleteModal">Delete</button>
          </div>
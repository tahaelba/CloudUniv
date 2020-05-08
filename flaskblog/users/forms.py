from flask_wtf import FlaskForm
from wtforms_components import DateTimeField,DateRange
from flask_wtf.file import FileField, FileAllowed
from wtforms import StringField, PasswordField, SubmitField, BooleanField,IntegerField,SelectField,DateField, TextAreaField#,DateTimeField
from wtforms.validators import DataRequired, Length, Email, EqualTo, ValidationError,NumberRange#,DateRange, datetime
from flask_login import current_user
from flaskblog.models import User
#from flask_babel import lazy_gettext as _l


class RegistrationForm(FlaskForm):
    username = StringField('Username',
                           validators=[DataRequired(), Length(min=2, max=20)])
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
    firstname = StringField('First name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    lastname = StringField('Last name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    birthday = DateField('The Birth Date',format='%Y-%m-%d',validators=[DataRequired()])#, DateRange(min=datetime(1950, 1, 1),max=datetime(2019, 10, 10))])
    location = TextAreaField('Your Address')
    departement = SelectField('Departement',choices=[('Networks & Telecoms Engineering','Networks & Telecoms Engineering'),
                                         ('Computer Engineering', 'Computer Engineering'),
                                        ('Electrical Engineering', 'Electrical Engineering'),
                                        ('Industrial Engineering','Industrial Engineering')])
    year = SelectField('Year Of Study', choices=[('1st Year','1st Year'),
                                         ('2nd Year', '2nd Year'),
                                        ('3th Year', '3th Year'),
                                        ('4th Year','4th Year'),
                                        ('5th Year','5th Year')])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                    validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('That email is taken. Please choose a different one.')

class RegistrationForm_Professor(FlaskForm):
    firstname = StringField('First name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    lastname = StringField('Last name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    birthday = DateTimeField('The Birth Date ',format='%Y-%m-%d',validators=[DataRequired()])#, DateRange(min=datetime(1950, 1, 1),max=datetime(2019, 10, 10))])
    location = TextAreaField('Your Address')
    departement = SelectField('Departement',choices=[('Networks & Telecoms Engineering','Networks & Telecoms Engineering'),
                                         ('Computer Engineering', 'Computer Engineering'),
                                        ('Electrical Engineering', 'Electrical Engineering'),
                                        ('Industrial Engineering','Industrial Engineering')])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                    validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')
    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user:
            raise ValidationError('That email is taken. Please choose a different one.')

class RegistrationForm_Entity(FlaskForm):
    firstname = StringField('First name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    lastname = StringField('Last name',
                           validators=[DataRequired(), Length(min=4, max=40)])
    birthday = DateTimeField('The Birth Date',format='%Y-%m-%d',validators=[DataRequired()])#, DateRange(min=datetime(1950, 1, 1),max=datetime(2019, 10, 10))])
    company = StringField('Compnay name',
                           validators=[DataRequired()])
    location = TextAreaField('Your Address')
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                    validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')

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
    firstname = StringField('First name',
                        validators=[DataRequired()])
    lastname = StringField('Last name',
                        validators=[DataRequired()])
    birthday = DateTimeField('The Birth Date (YYYY-mm-dd) ',format='%Y-%m-%d')#, DateRange(min=datetime(1950, 1, 1),max=datetime(2019, 10, 10))])
    location = StringField('Your Address')
    about = TextAreaField('About')
    email = StringField('Email',
                        validators=[DataRequired(), Email()])
    picture = FileField('Update Profile Picture', validators=[FileAllowed(['jpg', 'png','jpeg'])])
    password = PasswordField('Password',validators=[DataRequired()])
    confirm_password = PasswordField('Confirm Password',
                                    validators=[ DataRequired(),EqualTo('password')])
    submit = SubmitField('Save')

    def validate_email(self, email):
        if email.data != current_user.email:
            user = User.query.filter_by(email=email.data).first()
            if user:
                raise ValidationError('That email is taken. Please choose a different one.')

class SkillForm(FlaskForm):
    skill = StringField('New Skill', validators=[DataRequired()])
    submit = SubmitField('Add')


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

class MessageForm(FlaskForm):
    message = TextAreaField('Message', validators=[
        DataRequired(), Length(min=0, max=200)])
    submit = SubmitField('Send')

class RecommendationForm(FlaskForm):
    skill = StringField('Skill Recommended', validators=[DataRequired()])
    comment = TextAreaField('Brief Description of Skill Recommended', validators=[DataRequired()])
    submit = SubmitField('Recommend')
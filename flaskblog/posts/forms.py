from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField
from wtforms.validators import DataRequired


class PostForm(FlaskForm):
    title = StringField('Title', validators=[DataRequired()])
    content = TextAreaField('Content', validators=[DataRequired()])
    submit = SubmitField('Next')

class SkillRequiredForm(FlaskForm):
    skill = StringField('Skill Required', validators=[DataRequired()])
    submit = SubmitField('Add')


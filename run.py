from flaskblog import create_app, db
from flaskblog.models import *

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)

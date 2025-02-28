from flask import render_template, Flask

from connect_to_database import connect_to_database_def

app = Flask(__name__)

@app.route("/")
def index():
    
    return render_template("index.html")


@app.route("/" )
def index():
    

if __name__ == "__main__":
    app.run(debug=True)


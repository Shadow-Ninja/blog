import json
import math
import os
from werkzeug.utils import secure_filename
from flask import Flask, redirect, render_template, request, session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail


with open("config.json", "r") as f:
    data = f.read()
    data = json.loads(data)


app = Flask(__name__)
app.secret_key = "sec-key"
app.config["upload_location"] = data["params"]["upload_location"]
app.config.update(
    MAIL_SERVER='smtp.hostinger.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = data["params"]["gmail_user"],
    MAIL_PASSWORD = data["params"]["gmail_password"]
)

if data["params"]["local_server"] == "True":
    app.config['SQLALCHEMY_DATABASE_URI'] = data["params"]["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = data["params"]["production_uri"]
db = SQLAlchemy(app)

params = data

mail = Mail(app)

class Contacts(db.Model):
    """sno, Name, email, phone_num, mes, date"""

    sno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String, unique=False, nullable=False)
    email = db.Column(db.String, nullable=False)
    phone_num = db.Column(db.String, nullable=False)
    mes = db.Column(db.String, nullable=False)
    date = db.Column(db.String, nullable=True)


class Posts(db.Model):
    """sno, title, slug, content, date"""

    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, unique=False, nullable=False)
    tagline = db.Column(db.String, nullable=False)
    slug = db.Column(db.String, nullable=False)
    content = db.Column(db.String, nullable=False)
    date = db.Column(db.String, nullable=True)
    img_file = db.Column(db.String, nullable=True)



@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    # [0:int(data["params"]["no_of_posts"])]
    page = request.args.get("page")
    print(page)

    last = math.ceil(len(posts)/int(data["params"]["no_of_posts"]))
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(data["params"]["no_of_posts"]): (page-1)*int(data["params"]["no_of_posts"])+int(data["params"]["no_of_posts"])]
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page+1)
    elif page == last:
        prev = "/?page=" + str(page-1)
        next = "#"
    else:
        prev = "/?page=" + str(page-1)
        next = "/?page=" + str(page+1)

        
    return render_template("index.html", params=params, posts=posts, next=next, prev=prev)


@app.route('/about')
def about():
    return render_template("about.html", params=params)


@app.route('/dashboard', methods=["POST", "GET"])
def dashboard():

    if "user" in session and session["user"] == data["params"]["admin_user"]:
        posts = Posts.query.all()
        return render_template("dashboard.html", params=params, posts=posts)

    if request.method == "POST":
        username = request.form.get("uname")
        password = request.form.get("password")
        if username == data["params"]["admin_user"] and password == data["params"]["admin_password"]:
            # Session 
            session["user"] = username
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)

    return render_template("login.html", params=params)


@app.route('/logout', methods=["GET", "POST"])
def logout():
    session.pop('user')
    return redirect("/dashboard")


@app.route('/delete/<string:sno>')
def delete(sno):
    if ('user' in session and session['user'] == data['params']['admin_user']):
        post = Posts.query.filter_by(sno=sno).delete()
        db.session.commit()
        return redirect('/dashboard')


@app.route('/uploader', methods=["GET", "POST"])
def uploader():
    if ("user" in session and session["user"] == data ["params"]["admin_user"]):
        if request.method == "POST":
            f = request.files["file1"]
            f.save(os.path.join(app.config['upload_location'], secure_filename(f.filename)))
            return "Uploaded Succesfully"


@app.route('/contact', methods=["GET", "POST"])
def contact():
    if request.method == "POST":
        Name = request.form.get("name")
        email = request.form.get("email")
        phone_num = request.form.get("phone")
        mes = request.form.get("message")
    
        entry = Contacts(Name=Name, email=email, phone_num=phone_num, mes=mes, date = datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            "Test Mail from flask",
            sender=email,
            recipients=[data["params"]["gmail_user"]],
            body=mes+"\n"+phone_num

        )
    return render_template("contact.html", params=params)


@app.route('/post/<string:post_slug>')
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html", params=params, post=post)

@app.route('/edit/<string:sno>', methods = ["GET", "POST"])
def edit(sno):
    if ("user" in session and session['user'] == data['params']['admin_user']):
        if request.method == "POST":
            title = request.form.get("title")
            tagline = request.form.get("tagline")
            slug = request.form.get("slug")
            content = request.form.get("content")
            img_file = request.form.get("img_file")
            date = datetime.now()
        
            if sno == "0":
                post = Posts(title=title, tagline=tagline, slug=slug, content=content, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = title
                post.tagline = tagline
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template("edit.html", params=params, post=post)

app.run(debug=True)

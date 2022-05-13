# app.py
from flask import Flask, Blueprint, request, Response, jsonify
from flask_cors import CORS
from flask_mysqldb import MySQL
from settings import MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB

app = Flask(__name__)

app.config["MYSQL_USER"] = MYSQL_USER
app.config["MYSQL_PASSWORD"] = MYSQL_PASSWORD
app.config["MYSQL_DB"] = MYSQL_DB
app.config["MYSQL_CURSORCLASS"] = "DictCursor"

db = MySQL(app)

from authentication import authentication
from places import places
from detection import detection

app.register_blueprint(authentication, url_prefix="/api/auth")

app.register_blueprint(places, url_prefix="/api/get")

app.register_blueprint(detection, url_prefix="/api/detection")


# app.py
from flask import Flask, Blueprint, request, Response, jsonify
from flask_cors import CORS
from flask_mysqldb import MySQL
import os
import pymysql

app = Flask(__name__)

app.config['MYSQL_HOST'] = "34.101.218.88"
app.config['MYSQL_UNIX_SOCKET'] = "/cloudsql/guideme-bangkitcapstone-01:asia-southeast2:guideme-bangkitcapstone"
app.config['MYSQL_USER'] =  "guideme-bangkitcapstone"
app.config['MYSQL_PASSWORD'] = "guideme1"
app.config['MYSQL_DB'] = "GuideMe"
app.config['MYSQL_CURSORCLASS'] = "DictCursor"

db = MySQL(app)

from authentication import authentication
from places import places
from detection import detection

#TEST
@app.route('/')
def hello():
    return 'Hello World!'

app.register_blueprint(authentication, url_prefix="/api/auth")

app.register_blueprint(places, url_prefix="/api/get")

app.register_blueprint(detection, url_prefix="/api/detection")


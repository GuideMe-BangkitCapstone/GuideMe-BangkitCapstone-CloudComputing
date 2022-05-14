from flask import jsonify, request
from pymysql import NULL
from app import db
import os
import jwt
from settings import JWT_SECRET_KEY
from flask_mysqldb import MySQLdb
from hashlib import pbkdf2_hmac

def db_read(query, params=None):
    cursor = db.connection.cursor()
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)

    entries = cursor.fetchall()
    cursor.close()
    content = []

    for entry in entries:
        content.append(entry)

    return content

def db_write(query, params):
    cursor = db.connection.cursor()
    try:
        cursor.execute(query, params)
        db.connection.commit()
        cursor.close()

        return True

    except MySQLdb._exceptions.IntegrityError:
        cursor.close()
        return False

def generate_salt():
    salt = os.urandom(16)
    return salt.hex()

def generate_hash(plain_password, password_salt):
    password_hash = pbkdf2_hmac(
        "sha256",
        b"%b" % bytes(plain_password, "utf-8"),
        b"%b" % bytes(password_salt, "utf-8"),
        10000,
    )
    return password_hash.hex()

def generate_token(content):
    encoded_content = jwt.encode(content, JWT_SECRET_KEY, algorithm="HS256")
    token = str(encoded_content).split("'")[1]

    return token

def validate_user_input(input_type, **kwargs):
    if input_type == "authentication":
        if len(kwargs["email"]) <= 255 and len(kwargs["password"]) <= 255:
            return True
        else:
            return False

def validate_user(email, password):
    current_user = db_read("""SELECT * FROM users WHERE email = %s""", (email,))

    if len(current_user) == 1:
        saved_password_hash = current_user[0]["password_hash"]
        saved_password_salt = current_user[0]["password_salt"]
        password_hash = generate_hash(password, saved_password_salt)

        if password_hash == saved_password_hash and current_user[0]["email"] == email:
            user_id = current_user[0]["user_id"]
            user_username = current_user[0]["username"]
            token = generate_token({"id": user_id})

            return jsonify({"error": False, "message": "Login Success", "loginResult":{"token": token, "userid": user_id, "username": user_username}})

        elif current_user[0]["email"] == email and password_hash != saved_password_hash:
            return jsonify({"error": True, "message": "Wrong Password"})

        else:
            return jsonify({"error": True, "message": "Login Failed"})

    else:
        return jsonify({"error": True, "message": "Account not found"})

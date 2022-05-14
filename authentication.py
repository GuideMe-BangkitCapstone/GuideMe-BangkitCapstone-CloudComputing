from flask import Blueprint, request, Response, jsonify, request_started
from utils import (
    validate_user_input,
    generate_salt,
    generate_hash,
    db_write,
    validate_user,
)

authentication = Blueprint("authentication", __name__)

@authentication.route("/register", methods=["POST"])
def register_user():

    user = request.form

    if user['password'] == user['confirm_password'] and validate_user_input(
        "authentication", email=user['email'], password=user['password']
    ):
        password_salt = generate_salt()
        password_hash = generate_hash(user['password'], password_salt)

        if db_write(
            """INSERT INTO users (email, username, fullname, password_salt, password_hash) VALUES (%s, %s, %s, %s, %s)""",
            (user['email'], user['username'], user['fullname'], password_salt, password_hash),
        ):
            return jsonify({"error": False, "message": "User Created"})
        else:
            return jsonify({"error": True, "message": "User Not Created"})
    else:
        return Response(status=400)


@authentication.route("/login", methods=["POST"])
def login_user():
    user = request.form

    return validate_user(user['email'], user['password'])


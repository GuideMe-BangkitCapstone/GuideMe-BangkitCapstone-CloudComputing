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

    json_data = request.get_json()
    user_email = json_data['email']
    user_username = json_data['username']
    user_fullname = json_data['fullname']
    user_password = json_data['password']
    user_confirm_password = json_data['confirm_password']

    if user_password == user_confirm_password and validate_user_input(
        "authentication", email=user_email, password=user_password
    ):
        password_salt = generate_salt()
        password_hash = generate_hash(user_password, password_salt)

        if db_write(
            """INSERT INTO users (email, username, fullname, password_salt, password_hash) VALUES (%s, %s, %s, %s, %s)""",
            (user_email, user_username, user_fullname, password_salt, password_hash),
        ):
            return jsonify({"error": False, "message": "User Created"})
        else:
            return jsonify({"error": True, "message": "User Not Created"})
    else:
        return Response(status=400)


@authentication.route("/login", methods=["POST"])
def login_user():
    user_email = request.json["email"]
    user_password = request.json["password"]

    return validate_user(user_email, user_password)


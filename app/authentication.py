from flask import Blueprint, request, jsonify
from app.utils import (
    db_read,
    token_required,
    validate_user_input,
    generate_salt,
    generate_hash,
    db_write,
    validate_user,
)

authentication = Blueprint("authentication", __name__)

@authentication.route("/register", methods=["POST"])
def register_user():
    if(request.content_type == 'application/x-www-form-urlencoded'):
        user = request.form
        if validate_user_input(
            "authentication", email=user['email'], password=user['password']
        ):
            password_salt = generate_salt()
            password_hash = generate_hash(user['password'], password_salt)

            if db_write(
                """INSERT INTO users (email, fullname, password_salt, password_hash) VALUES (%s, %s, %s, %s)""",
                (user['email'], user['fullname'], password_salt, password_hash),
            ):
                return jsonify({"error": False, "message": "User Created"})
            else:
                return jsonify({"error": True, "message": "User Not Created"}), 
        else:
            return jsonify({"error" : True, "message": "Email already taken"})
    else:
        return 'Content-Type not supported!'


@authentication.route("/login", methods=["POST"])
def login_user():
    if(request.content_type == 'application/x-www-form-urlencoded'):
        user = request.form
        return validate_user(user['email'], user['password'])
    else:
        return 'Content-Type not supported!'

@authentication.route("/getdetail", methods=["GET"])
@token_required
def getDetailUser(user_id):
    data = db_read("""SELECT email, fullname, user_id FROM users WHERE user_id = %s""", (user_id,))

    return jsonify(data[0])


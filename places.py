from flask import Blueprint, request, Response, jsonify, request_started
from utils import db_read
from flask_jwt import JWT, jwt_required, current_identity

places = Blueprint("places", __name__)

@places.route("/allplaces", methods=["GET"])
@jwt_required()
def getAllPlaces():
    data = db_read("""SELECT name, photo_url FROM places""")
    
    return jsonify({"error": False, "message": "Places fetched successfully", "listPlaces": data})

@places.route("/place", methods=["GET"])
def getDetailPlaces():

    json_data = request.get_json()
    place_name = json_data['name']

    data = db_read("""SELECT * FROM places WHERE name = %s""", (place_name,))

    return jsonify(data[0])

@places.route("/albums", methods=["GET"])
def getPlacesAlbums():

    json_data = request.get_json()
    place_id = json_data['place_id']

    data = db_read("""SELECT * FROM places_albums WHERE place_id = %s""", (place_id,))

    return jsonify(data)

@places.route("/articles", methods=["GET"])
def getPlacesArticle():

    json_data = request.get_json()
    place_id = json_data['place_id']

    data = db_read("""SELECT * FROM article WHERE id = %s""", (place_id,))

    return jsonify(data)

places.route("/visithistory", methods=["GET"])
def getUserVisitHistory():

    json_data = request.get_json()
    user_id = json_data["user_id"]

    data = db_read("""SELECT * FROM users_visit_history WHERE user_id = %s""", (user_id,))

    return jsonify(data)


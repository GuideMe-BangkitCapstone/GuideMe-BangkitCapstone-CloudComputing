from flask import Blueprint, request, Response, jsonify, request_started
from utils import db_read

places = Blueprint("places", __name__)

@places.route("/allplaces", methods=["GET"])
def getAllPlaces():
    data = db_read("""SELECT name, photo_url FROM places""")
    
    return jsonify({"error": False, "message": "Places fetched successfully", "listPlaces": data})

@places.route("/place", methods=["GET"])
def getDetailPlaces():

    json_data = request.get_json()
    place_name = json_data['name']

    data = db_read("""SELECT * FROM places WHERE name = %s""", (place_name,))

    return jsonify(data[0])

@places.route("/articles", methods=["GET"])
def getPlacesArticle():

    json_data = request.get_json()
    place_id = json_data['place_id']

    data = db_read("""SELECT * FROM article WHERE id = %s""", (place_id,))

    return jsonify(data)

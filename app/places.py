from flask import Blueprint, request, jsonify
from app.utils import db_read, db_write, token_required

places = Blueprint("places", __name__)

@places.route("/allplaces", methods=["GET"])
def getAllPlaces():
    data = None
    data = db_read("""SELECT name, photo_url FROM places""")

    if data != None:
        return jsonify({"error": False, "message": "Places fetched successfully", "listPlaces": data})
    else:
        return jsonify({"error": True, "message": "Failed to fetch", "listPlaces": data})

@places.route("/place", methods=["GET"])
def getDetailPlaces():
    json_data = request.args
    place_name = json_data['name']
    data = db_read("""SELECT * FROM places WHERE name = %s""", (place_name,))

    return jsonify(data[0])

@places.route("/albums", methods=["GET"])
def getPlacesAlbums():
    data = None
    json_data = request.args
    place_id = json_data['place_id']
    data = db_read("""SELECT * FROM places_album WHERE place_id = %s""", (place_id,))

    if data != None:
        return jsonify({"error": False, "message": "Photo fetched successfully", "listPhoto": data})
    else:
        return jsonify({"error": True, "message": "Failed to fetch", "listPhoto": data})

@places.route("/articles", methods=["GET"])
def getPlacesArticle():
    data = None
    json_data = request.args
    place_id = json_data['place_id']
    data = db_read("""SELECT * FROM article WHERE place_id = %s""", (place_id,))

    if data != None:
        return jsonify({"error": False, "message": "Article fetched successfully", "listArticle": data})
    else:
        return jsonify({"error": True, "message": "Failed to fetch", "listArticle": data})

@places.route("/visithistory", methods=["GET"])
@token_required
def getUserVisitHistory(user_id):
    data = None
    data = db_read("""SELECT history_id, user_id, name, created_at FROM users_visit_history INNER JOIN places ON users_visit_history.place_id = places.place_id WHERE user_id = %s""", (user_id,))

    if data != None:
        return jsonify({"error": False, "message": "History fetched successfully", "listHistory": data})
    else:
        return jsonify({"error": True, "message": "Failed to fetch", "listHistory": data})

@places.route("/deletehistory", methods=["DELETE"])
@token_required
def deleteUserVisitHistory(user_id):
    state = db_write("""DELETE FROM users_visit_history WHERE user_id = %s""", (user_id,))

    if state:
        return jsonify({"error": False, "message": "Success"})
    else:
        return jsonify({"error": True, "message": "Error deleting history"})

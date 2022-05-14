from flask import Blueprint, jsonify

from utils import db_write, token_required

detection = Blueprint("detection", __name__)

@detection.route("/", methods=["GET"])
@token_required
def getPlaceNameFromDetection():

    db_write("""INSERT INTO user_visit_history(user_id, place_id)""")
   
    return jsonify({"error": True, "message": "Under Construction"})

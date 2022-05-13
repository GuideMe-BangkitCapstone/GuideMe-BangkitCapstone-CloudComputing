from flask import Blueprint

detection = Blueprint("detection", __name__)

@detection.route("/", methods=["GET"])
def getPlaceNameFromDetection():
   
    return jsonify({"error": True, "message": "Under Construction"})

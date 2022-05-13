from flask import Blueprint, request, Response, jsonify, request_started
from utils import db_read

detection = Blueprint("detection", __name__)

@detection.route("/", methods=["GET"])
def getPlaceNameFromDetection():
   
    return jsonify({"error": True, "message": "Under Construction"})

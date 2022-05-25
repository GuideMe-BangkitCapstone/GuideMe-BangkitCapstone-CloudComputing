import tensorflow as tf
from PIL import Image
import numpy as np
from flask import Blueprint, request, Response, jsonify, request_started
import io
from utils import token_required


def load_model():
	
	global model
	model = tf.keras.applications.ResNet50(weights="imagenet")

def prepare_dataset(image, target):

	if image.mode != "RGB":
		image= image.convert("RGB")

	image = image.resize(target)
	image = tf.keras.preprocessing.image.img_to_array(image)
	image = np.expand_dims(image, axis=0)
	image = tf.keras.applications.imagenet_utils.preprocess_input(image)

	return image

detection = Blueprint("detection", __name__)

@detection.route("/", methods=["GET"])
@token_required
def predict():

	data = {"success":False}

	if request.method == "POST":
		if request.files.get("image"):

			image = request.files["image"].read()
			image = Image.open(io.BytesIO(image))

			image = prepare_dataset(image, target=(224,224))

			preds = model.predict(image)
			results = tf.keras.applications.imagenet_utils.decode_predictions(preds)

			data["predictions"] = []

			for (_, label, prob) in results[0]:
				r = {"label": label, "probablity": float(prob)}
				data["predictions"].append(r)

			data["success"] = True

	return jsonify(data)

@detection.route("/dummy", methods=["GET"])
@token_required
def dummyEndpoint():

	data = {"success":False}

	if request.method == "POST":
		if request.files.get("image"):
			data["success"] = True
    
	return jsonify(data)

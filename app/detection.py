import tensorflow as tf
from keras.models import load_model 
from keras.preprocessing import image
from PIL import Image
import numpy as np
from flask import Blueprint, request, jsonify
from app.utils import db_read, db_write, token_required
import os
import io

detection = Blueprint("detection", __name__)

def prepare_dataset(image, target):

	if image.mode != "RGB":
		image= image.convert("RGB")

	image = image.resize(target)
	image = tf.keras.preprocessing.image.img_to_array(image)
	image = np.expand_dims(image, axis=0)
	image = tf.keras.applications.imagenet_utils.preprocess_input(image)

	return image

path_name = "app/model.h5"
model = load_model(path_name)

@detection.route("/", methods=["POST"])
@token_required
def placeDetection(user_id):

	data = {
		"error":True,
		"place_name": None,
		"message": "Error!"
	}

	labels = ["Monumen Nasional (Monas)", "Candi Prambanan"]
 
	if os.path.isfile(path_name):
		if request.method == "POST":
			if request.files.get("image"):

				image = request.files['image'].read()
				image = Image.open(io.BytesIO(image))
				image = prepare_dataset(image, target=(416,416))
				preds = model.predict(image, batch_size=5)

				if(preds[0][np.argmax(preds[0])]>=0.8):
					data["place_name"] = labels[np.argmax(preds[0])]
					try:
						place = db_read("""SELECT * FROM places WHERE name = %s""", (data["place_name"],))
						place_id = place[0]["place_id"]
						db_write("""INSERT INTO users_visit_history (user_id, place_id) VALUES (%s, %s)""",(user_id, place_id),)
						data["error"] = False
						data["message"] = "Success"
					except:
						data["error"] = True
						data["message"] = "Under Construction! Currently not available in our databases"
				else:
					data["error"] = True
					data["message"] = "Not Detected"
			else:
				data["error"] = True
				data["message"] = "Can't get Image"
		else:
			data["error"] = True
			data["message"] = "Wrong Method"
	else:
		data["error"] = True
		data["message"] = "Model File Is Missing!"

	return jsonify(data)

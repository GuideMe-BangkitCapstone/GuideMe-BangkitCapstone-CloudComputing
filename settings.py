# settings.py
from dotenv import load_dotenv

import os

load_dotenv()

MYSQL_USER = os.getenv("root")
MYSQL_PASSWORD = os.getenv("")
MYSQL_DB = os.getenv("guideme")
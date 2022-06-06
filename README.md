# GuideMe-BangkitCapstone-CloudComputing
GuideMe: Wherever you go, you know

Base Endpoint : https://capstone-project-guideme.et.r.appspot.com/

login_user
Endpoint : /api/auth/login
HTTP Method : POST
Request Body :
{
  "email": "iu@mail.com",
  "password": "123456"
}

Respone Body (Success):
{
"error": false,
    "loginResult": {
        "email": "iu@mail.com",
        "fullname": "Lee Ji Eun",
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6N30.0aPgaQwzL2vmNhtHs7M2qodXIgXMWPiSpwmYe3UDFZI",
        "userid": 7
    },
    "message": "Login Success"
}

Respone Body (Fail):
{
    "error": true,
    "message": "Wrong Password"
}
or
{
    "error": true,
    "message": "Account not found"
}

register_user
Endpoint : /api/auth/register
HTTP Method : POST
Request Body :
{
  "email": "iu@mail.com",
  "password_salt": "123456",
  "password_hash": "123456"
}

Respone Body (Success):
{
    "error": false,
    "message": "User Created"
}

Respone Body (Fail):
{
    "error": true,
    "message": "Email already taken"
}
or
{
    "error": true,
    "message": "User Not Created"
}

getDetailUser
Endpoint : /api/auth/getdetail
HTTP Method : GET
Request Body :
{
-
}

Respone Body (Success):
{
"""SELECT email, fullname, user_id FROM users WHERE user_id = %s""", (user_id,)
}
Respone Body (Fail):
{
-
}

allplaces
Endpoint : /api/get/allplace
HTTP Method : GET
Request Body :
{
-
}
Respone Body (Success):
{
  "error": False,
  "message": "Places fetched successfully",
  "listPlaces": data
}
Respone Body (Fail):
{
-
}

detailplaces
Endpoint : /api/get/place
HTTP Method : GET
Request Body :
{
"name":"Prambanan"
}

Respone Body (Success):
{
"""SELECT * FROM places WHERE name = %s""", (place_name,)
}
Respone Body (Fail):
{
-
}

placesalbum
Endpoint : /api/get/album
HTTP Method : GET
Request Body :
{
"places_id":"1"
}

Respone Body (Success):
{
"error": False, "message": "Photo fetched successfully", "listPhoto": data
}
Respone Body (Fail):
{
-
}

placesarticle
Endpoint : /api/get/article
HTTP Method : GET
Request Body :
{
"places_id":"1"
}

Respone Body (Success):
{
"error": False, "message": "Article fetched successfully", "listArticle": data
}
Respone Body (Fail):
{
-
}

uservisithistory
Endpoint : /api/get/visithistory
HTTP Method : GET
Request Body :
{
"user_id":"1"
}

Respone Body (Success):
{
"error": False, "message": "History fetched successfully", "listHistory": data
}
Respone Body (Fail):
{
-
}

deleteuservisithistory
Endpoint : /api/get/deletehistory
HTTP Method : GET
Request Body :
{
"user_id":"1"
}

Respone Body (Success):
{
"error": False, "message": "Success"
}
Respone Body (Fail):
{
"error": True, "message": "Error deleting history"
}

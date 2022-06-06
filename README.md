# GuideMe-BangkitCapstone-CloudComputing
GuideMe: Wherever you go, you know

Base Endpoint : https://capstone-project-guideme.et.r.appspot.com/

login_user
Endpoint : /api/auth
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
Endpoint : /api/auth
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
{
    "error": true,
    "message": "User Not Created"
}

getDetailUser
Endpoint : /getdetail
HTTP Method : GET
Request Body :
{
  "user_id":"1";
}

Respone Body (Success):
Respone Body (Fail):

allplaces
detailplaces
placesalbum
placesarticle
uservisithistory
deleteuservisithistory

# GuideMe-BangkitCapstone-CloudComputing
- GuideMe: Wherever you go, you know

- Base Endpoint : https://capstone-project-guideme.et.r.appspot.com/

# Login User
- Endpoint : `/api/auth/login`
- HTTP Method : `POST`
- Request Header :
  - Accept : `x-www-form-urlencoded`

- Request Body :

```json
  {
    "email": "iu@mail.com",
    "password": "123456"
  }
```

- Respone Body (Success):

```json
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
  ```

- Respone Body (Fail):

```json
  {
    "error": true,
    "message": "Wrong Password"
  }
```
or

```json
  {
    "error": true,
    "message": "Account not found"
  }
 ```

# Register User

- Endpoint : `/api/auth/register`
- HTTP Method : ``POST``
- Request Header :
  - Accept : `x-www-form-urlencoded`

- Request Body :

```json
  {
    "email": "iu@mail.com",
    "password_salt": "123456",
    "password_hash": "123456"
  }
 ```

- Respone Body (Success):
```json
  {
     "error": false,
    "message": "User Created"
  }
```

- Respone Body (Fail):
```json
  {
    "error": true,
    "message": "Email already taken"
  }
```
or
```json
  {
    "error": true,
    "message": "User Not Created"
  }
```

# Get User Detail 
- Endpoint : `/api/auth/getdetail`
- HTTP Method : `GET`
- Request Header :
  - Authorization : `Bearer {Token}`

- Query Parameter :
```json
  {
  "user_id" : 7
  }
```

- Respone Body (Success):
```json
{
    "email": "iu@mail.com",
    "fullname": "Lee Ji Eun",
    "user_id": 7
}
```
# Get All Places
- Endpoint : `/api/get/allplaces`
- HTTP Method : `GET`

- Respone Body (Success):
```json
{
    "error": false,
    "listPlaces": [
        {
            "name": "Candi Borobudur",
            "photo_url": "https://mmc.tirto.id/image/2017/09/05/Borobudur--ISTOCK.jpg"
        },
        {
            "name": "Monumen Nasional (Monas)",
            "photo_url": "https://upload.wikimedia.org/wikipedia/id/thumb/b/b1/Merdeka_Square_Monas_02.jpg/240px-Merdeka_Square_Monas_02.jpg"
        },
        {
            "name": "Monumen Yogya Kembali",
            "photo_url": "https://upload.wikimedia.org/wikipedia/id/thumb/4/4a/Monumen_Yogya_Kembali.JPG/250px-Monumen_Yogya_Kembali.JPG"
        }
    ],
    "message": "Places fetched successfully"
}
```
- Respone Body (Fail):
```json
{
    "error": true,
    "message": "Failed to get places"
}

```

# Get Detail Place
- Endpoint : `/api/get/place`
- HTTP Method : `GET`

- Query Parameter :
```json
{
    "name": "Prambanan"
}
```

- Respone Body (Success):
```json
{
    "address": "Jl. Badrawati, Kw. Candi Borobudur, Borobudur, Kec. Borobudur, Kabupaten Magelang, Jawa Tengah",
    "description": "Borobudur adalah sebuah candi Buddha yang terletak di Borobudur, Magelang, Jawa Tengah, Indonesia. Candi ini terletak kurang lebih 100 km di sebelah barat daya Semarang, 86 km di sebelah barat Surakarta, dan 40 km di sebelah barat laut Yogyakarta",
    "name": "Candi Borobudur",
    "photo_url": "https://mmc.tirto.id/image/2017/09/05/Borobudur--ISTOCK.jpg",
    "place_id": 1
}
```

# Get Place Albums
- Endpoint : `/api/get/album`
- HTTP Method : `GET`
- Query Parameter :
```json
{
    "places_id":"1"
}
```

- Respone Body (Success):
```json
{
    "error": false,
    "listPhoto": [
        {
            "photo_id": 1,
            "photo_url": "https://lp-cms-production.imgix.net/2019-06/f4024c571e5e09ce5e4049bc181500b1-borobudur-temple.jpg?sharp=10&vib=20&w=1200&auto=compress&fit=crop&fm=auto&h=800",
            "place_id": 1
        },
        {
            "photo_id": 2,
            "photo_url": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/ef/47/1c/borobudur-temple.jpg?w=1200&h=1200&s=1",
            "place_id": 1
        }
    ],
    "message": "Photo fetched successfully"
}
```

# Get Place Articles
- Endpoint : `/api/get/article`
- HTTP Method : `GET`
- Query Parameter :
```json
{
    "places_id":"1"
}
```

- Respone Body (Success):
```json
{
    "error": false,
    "listArticle": [
        {
            "article_id": 1,
            "article_url": "https://katadata.co.id/intan/berita/6155a8764482c/mengenal-sejarah-dan-fungsi-candi-borobudur",
            "description": "Candi Borobudur terletak di desa Borobudur, Kecamatan Borobudur, Kabupaten Magelang, Jawa Tengah. Ca",
            "photo_url": "https://lp-cms-production.imgix.net/2019-06/f4024c571e5e09ce5e4049bc181500b1-borobudur-temple.jpg?sharp=10&vib=20&w=1200&auto=compress&fit=crop&fm=auto&h=800",
            "place_id": 1,
            "title": "Mengenal Sejarah dan Fungsi Candi Borobudur"
        }
    ],
    "message": "Article fetched successfully"
}
```

# Get User Visit History
- Endpoint : `/api/get/visithistory`
- HTTP Method : `GET`
- Request Header :
  - Authorization : `Bearer {Token}`

- Respone Body (Success):
```json
{
  "error": false,
  "listHistory": [],
  "message": "History fetched successfully"
}
```

# Delete User Visit History
- Endpoint : `/api/get/deletehistory`
- HTTP Method : `DELETE`
- Request Header :
  - Authorization : `Bearer {Token}`

- Respone Body (Success):
```json
{
  "error": false,
  "message": "Success"
}
```

- Respone Body (Fail):
```json
{
  "error": true, 
  "message": "Error deleting history"
}
```

# Dummy Detection Endpoint ( For Testing )
### Waiting for ML path to complete the ML Model 

- Endpoint : `/api/dummy/guideme`
- HTTP Method : `POST`
- Request Header :
  - Authorization : `Bearer {Token}`
  
- Request Body :
  * user_id as integer
  * image as file

- Respone Body (Success):
```json
{
  "error": false, 
  "message": "Success", 
  "places_name":"Candi Borobudur"
}
```
- Respone Body (Fail):
```json
{
  "error": true, 
  "message": "Can't get Image"
}
```
or
```json
{
  "error": true, 
  "message": "Wrong Method"
}
```

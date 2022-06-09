# GuideMe-BangkitCapstone-CloudComputing
![Wherever you go, you know](https://user-images.githubusercontent.com/69246482/172912779-65b0304c-1b78-4985-92e0-976572356a86.png)

## App Description
This application was built using Flask using the python programming language and deployed into the Google Compute Engine. This application is used to provide endpoints for the mobile applications that we have built.

- Base Endpoint VM Instance ( Backup ): `http://34.101.245.166/`

## Endpoint List

### Login User
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

### Register User

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

### Get User Detail 
- Endpoint : `/api/auth/getdetail`
- HTTP Method : `GET`
- Request Header :
  - Authorization : `Bearer {Token}`

- Respone Body (Success):
```json
{
    "email": "iu@mail.com",
    "fullname": "Lee Ji Eun",
    "user_id": 7
}
```
### Get All Places
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

### Get Detail Place
- Endpoint : `/api/get/place`
- HTTP Method : `GET`

- Query Parameter :
```json
{
    "name": "Candi Borobudur"
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

### Get Place Albums
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

- Respone Body (Fail):
```json
{
  "error": true, 
  "message": "Failed to fetch", 
  "listPhoto": null
}
```

### Get Place Articles
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

- Respone Body (Fail):
```json
{
  "error": true, 
  "message": "Failed to fetch", 
  "listArticle": null
}
```

### Get User Visit History
- Endpoint : `/api/get/visithistory`
- HTTP Method : `GET`
- Request Header :
  - Authorization : `Bearer {Token}`

- Respone Body (Success):
```json
{
    "error": false,
    "listHistory": [
        {
            "created_at": "Thu, 09 Jun 2022 16:50:24 GMT",
            "history_id": 29,
            "name": "Monumen Nasional (Monas)",
            "photo_url": "https://upload.wikimedia.org/wikipedia/id/thumb/b/b1/Merdeka_Square_Monas_02.jpg/240px-Merdeka_Square_Monas_02.jpg",
            "user_id": 15
        }
    ],
    "message": "History fetched successfully"
}
```
- Respone Body (Fail):
```json
{
  "error": true, 
  "message": "Failed to fetch", 
  "listHistory": null
}
```

### Delete User Visit History
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

### Detection 

- Endpoint : `/api/detection`
- HTTP Method : `POST`
- Request Header :
  - Authorization : `Bearer {Token}`
  
- Request Body :
  - `image` as `file`

- Respone Body (Success):
```json
{
    "error": false,
    "message": null,
    "place_name": "Monumen Nasional (Monas)"
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
or
```json
{
  "error": true, 
  "message": "Not Detected"
}
```

## Development

### Requirements
* A Mac or Windows or Linux computer.
* Python 3.7.1

### Library
```Requirements
Flask==2.1.2
Flask-Cors==3.0.10
Flask-JWT==0.3.2
Flask-MySQL==1.5.2
Flask-MySQLdb==1.0.1
PyJWT==1.4.2
keras==2.9.0
Keras-Preprocessing==1.1.2
mysqlclient==2.1.0
tensorboard==2.9.0
tensorboard-data-server==0.6.1
tensorboard-plugin-wit==1.8.1
tensorflow==2.9.1
tensorflow-estimator==2.9.0
tensorflow-io-gcs-filesystem==0.26.0
```

### Clone this App

**Clone**
```bash
$ git clone https://github.com/GuideMe-BangkitCapstone/GuideMe-BangkitCapstone-CloudComputing.git
```

**Run this app**
```bash
$ cd GuideMe-BangkitCapstone-CloudComputing
```
```bash
$ pip install -r requirements.txt
```
```bash
$ flask run
```


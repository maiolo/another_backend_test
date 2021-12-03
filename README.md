# README

This is a simple API that checks if a password is strong.

The password is considered strong if:
* it has at least 9 characters
* it has at least one lower case letter
* it has at least one upper case letter
* it has at least one number
* it has at least one of these special characters: *!@#$%^&\*()-+*

## To Execute

You'll need to have docker and docker-compose installed to use this api.

### Steps to run
1. clone this repository
2. run `docker-compose build`
3. run `docker-compose up`

Then all you'll need to make a post request to `localhost:3000/api/v1/password_checker` 
```
h- Content-Type: application/json
b- {
    "password": "t@a13A566536d"
   }
```
you can use Postman to do it.

## Running Tests
if you want to run the automated tests, you'll just need to change the line `dockerfile: Dockerfile` to `dockerfile: Dockerfile.development` and rebuild the image, but this time, after runing `docker-compose up` use another window to run `docker-compose run web bash`, after that just execute in the prompt the following command:
`bundle exec rspec`

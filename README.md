Lima Weekend System 
===================


Installation
============


pip install django-jwt-auth
pip install django-cors-headers


curl -X POST -H "Content-Type: application/json" -d '{"username":"root","password":"123"}' http://localhost:8000/api-token-auth/

curl -X POST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJvb3QiLCJ1c2VyX2lkIjoxLCJlbWFpbCI6IiIsImV4cCI6MTQ2MDE3NzQ2OH0.FGwBvWH3BCst8bOLQm8m6mc2poslgMihJudGINJun2Y" http://localhost:8000/jwt/



mkdir myapp
cd vistas
jitsu install http-server

node bin/http-server


killall -9 python
killall -9 node
cd http-server
node bin/http-server &
cd ../secret
python manage.py runserver &

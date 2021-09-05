from flask import Flask
from flask_mysqldb import MySQL
import redis
from datetime import timedelta

redis_cache = redis.Redis(host='172.28.1.102',port=6379,db=0)

app=Flask(__name__)

app.config['MYSQL_HOST']='172.28.1.102'
app.config['MYSQL_USER']='aa-1'
app.config['MYSQL_PASSWORD']='Amir@mi4'
app.config['MYSQL_DB']='dev_test'

mysql = MySQL(app)

@app.route('/<id>')
def my_app(id=1):
    if redis_cache.exists(id):
        value= redis_cache.get(id)
        print("retrive from     :    redis-cache")
    else:
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM tutorial WHERE id=%s',id)
        result = cur.fetchone()
        if result == None:
            value = 'not exist'
        else:
            value = result[1]
            print("retrive from     :    mysql-database")
            redis_cache.setex(id,timedelta(seconds=20),result[1])
    return value

if __name__=="__main__":
    app.run(debug=True, port=5000, host="0.0.0.0")

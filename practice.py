import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="e-commerce"
)

mycursor = mydb.cursor()
sql="SELECT image,firstName,secondName From users WHERE Id='1'"
mycursor.execute(sql)
userData= mycursor.fetchall()
print(userData[0][0])
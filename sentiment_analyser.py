import mysql.connector
from textblob import TextBlob
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="e-commerce"
)

def return_reviewList(id):
    mydata = []
    mycursor = mydb.cursor()
    sql = "SELECT * FROM `productreview` WHERE product_id_fk="+ id
    mycursor.execute(sql)
    myresult = mycursor.fetchall()

    for i in myresult:
        mycursor.execute("SELECT `firstName`,`secondName`,`image` FROM `users` WHERE Id="+ str(i[1]))
        myresult2 = mycursor.fetchall()
        mydata.append((myresult2[0][0],myresult2[0][1],myresult2[0][2],i[3],i[4],i[5]))
        
    
    return mydata


def analyser(id):
    mycursor = mydb.cursor()
    mycursor.execute("SELECT `review_text` FROM `productreview` WHERE `product_id_fk` ="+ id)
    myyreviews = mycursor.fetchall()

    analysisList = []
    reviewsList = []
    for i in myyreviews:
        reviewsList.append(i[0])

    for review in reviewsList:
        analysisList.append(TextBlob(review).sentiment.polarity)

    percentageDic={
        'great' :0,
        'very_good':0,
        'satisfactory':0,
        'bad':0,
        'worst':0
    }
    
    for i in analysisList:
        if i < 0 and i> -0.5:
            percentageDic['bad'] +=1;
        elif i>0 and i<0.5:
            percentageDic['satisfactory'] +=1;
        elif i>0.5 and i<1:
            percentageDic['very_good'] +=1;
        elif i == 1:
            percentageDic['great'] +=1;
        elif i< -0.5:
            percentageDic['worst'] +=1;
        else:
            percentageDic['satisfactory'] +=1;

    return percentageDic

#[-0.59375, 0.3, 1.0, 0.0, -0.09340659340659341, 0.45, 0.46875, 0.10000000000000003, 0.4166666666666667, 0.75]
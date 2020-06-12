#Tayyab Orignal app.py file

from flask import Flask, render_template, redirect, url_for, request, flash
import mysql.connector
import datetime

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="",
    database="e-commerce"
)


app = Flask(__name__)
print(mydb)
userexist=0
HowManyProducts=0
orderId=0
@app.route('/')
@app.route('/home')
def home():

    mycursor = mydb.cursor()
    sql = "SELECT * FROM products WHERE favourite =1"
    mycursor.execute(sql)
    favouritProducts = mycursor.fetchall()
    # for x in favouritProducts:
        # print("ID", x[0])
        # print("Name", x[1])
        # print("Price", x[2])
        # print("Price", x[6])
        # print("Price", x[7])
        # print("Price", x[8])
    print(favouritProducts)

    reviewRows=list()
    reviewRow=list()

    sql = "SELECT * FROM reviews"
    mycursor.execute(sql)
    reviews = mycursor.fetchall()
    for i in reviews:

        sql="SELECT image,firstName,secondName From users WHERE Id='{}'".format(i[4])
        mycursor.execute(sql)
        userData= mycursor.fetchall()
        reviewRow.append(i[1])
        reviewRow.append(i[2])
        reviewRow.append(i[3])
        reviewRow.append(userData[0][0])
        reviewRow.append(userData[0][1])
        reviewRow.append(userData[0][2])
        reviewRows.append(reviewRow)
        reviewRow=[]
   
    print(reviewRows[0],"*******************************first")
    print(reviewRows[1],"*******************************first")
    print(reviewRows[2],"*******************************first")    

    # for x in reviews:
    #     sql="SELECT image From users WHERE Id='{}'".format(x[4])
    #     mycursor.execute(sql)
    #     # image= mycursor.fetchall()
    #     # reviewRow.append(x[0][0])
    #     # reviewRow.append(x[1][1])
    #     # reviewRow.append(x[2][2])
    #     # reviewRow.append(x[3][3])
    #     # reviewRow.append(x[4][]4)
    #     # reviewRow.append(image)
    #     # reviewRows.append(reviewRow)
    #     # reviewRow.clear()

    # for review in reviewRows:
    #     print("\n",review)
    print("***************************** ",userexist," ************************************************")
    return render_template('home.html', FavouritProduct=favouritProducts,reviews=reviewRows)


@app.route('/layout')
def layout():

    return render_template('layout.html')


@app.route('/cd')
def CustomerDashboard():
    mycursor = mydb.cursor()
    sql = "SELECT * FROM products WHERE favourite =1"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    for x in myresult:
        print("ID", x[0])
        print("Name", x[1])
        print("Price", x[2])
        print("Price", x[6])
        print("Price", x[7])
        print("Price", x[8])
    print("***************************** ",userexist," ************************************************")
    return render_template('CustomerDashboard.html', FavouritProduct=myresult)


@app.route('/pd/<string:id>' , methods=["POST", "GET"])
def productDetail(id):
    global userexist,HowManyProducts
    if request.method == "POST":
        if userexist !=0:
            #check user order exist or not 
            mycursor = mydb.cursor()
            sql = "SELECT Id FROM userorder WHERE userID ={} AND status='NotConfirmed'".format(userexist)
            mycursor.execute(sql)
            orderID = mycursor.fetchall()
            if not orderID:
                # create userorder if not exist
                mycursor = mydb.cursor()
                now = datetime.datetime.now()
                sql = """INSERT INTO userorder (date, userID, status, comment)  VALUES ( %s, %s, %s, %s)"""
                val = (now.strftime("%Y-%m-%d"), userexist , "NotConfirmed","Noconfirm yet")
                mycursor.execute(sql, val)
                mydb.commit()
                # Fetch  userorder id if exist
                mycursor = mydb.cursor()
                sql = "SELECT Id FROM userorder WHERE userID ={} AND status='NotConfirmed'".format(userexist)
                mycursor.execute(sql)
                orderID = mycursor.fetchall()
                # Add to card product in orderdetail table 
                req = request.form
                productID =id
                color = req.get('color')
                size = req.get('size')
                quantity = req.get('quantity')
                mycursor = mydb.cursor()
                sql = """INSERT INTO orderdetail (productID, color, size, quantity,UserOrderID)  VALUES ( %s, %s, %s, %s, %s)"""
                values=(productID,color,size,quantity,orderID[0][0])
                mycursor.execute(sql,values)
                mydb.commit()
                # count how many item in cart
                mycursor = mydb.cursor()
                sql = "SELECT COUNT(*) FROM orderdetail WHERE UserOrderID ={}".format(orderID[0][0])
                mycursor.execute(sql)
                HowManyProducts = mycursor.fetchall()
                
            else:
                req = request.form
                productID =id
                color = req.get('color')
                size = req.get('size')
                quantity = req.get('quantity')
                mycursor = mydb.cursor()
                sql = """INSERT INTO orderdetail (productID, color, size, quantity,UserOrderID)  VALUES ( %s, %s, %s, %s, %s)"""
                values=(productID,color,size,quantity,orderID[0][0])
                mycursor.execute(sql,values)
                mydb.commit()



                mycursor = mydb.cursor()
                sql = "SELECT COUNT(*) FROM orderdetail WHERE UserOrderID ={} ".format(orderID[0][0])
                mycursor.execute(sql)
                HowManyProducts = mycursor.fetchall()

            mycursor = mydb.cursor()
            sql = "SELECT * FROM products WHERE Id =%s"        #productDetail
            value = (id,)
            mycursor.execute(sql, value)
            myresult = mycursor.fetchall()
            HowManyProducts=HowManyProducts[0][0]               # global veriable
            relatedProductsID=myresult[0][10]
                                                                                    # Fatching Realted Products  <<----------
            mycursor = mydb.cursor()
            sql = "SELECT * FROM products WHERE categoryID =%s"        #productDetail
            value = (relatedProductsID,)
            mycursor.execute(sql, value)
            relatedProducts = mycursor.fetchall()
            print(relatedProducts,"<-----------------------------------")
            return render_template('productDetail.html', data=myresult[0],message="You product has been added to cart successfully,if you don't want to continue shoping then vist your cart to confirm order.",HowManyProductsInCart=HowManyProducts,relatedProducts=relatedProducts)
        else:
            return render_template('login.html',message="Kindly Login yourself to confirm your order!")
    else:
        mycursor = mydb.cursor()
        sql = "SELECT * FROM products WHERE Id =%s"        #productDetail
        value = (id,)
        mycursor.execute(sql, value)
        myresult = mycursor.fetchall()
        relatedProductsID=myresult[0][10]
                                                                                 # Fatching Realted Products  <<----------
        mycursor = mydb.cursor()
        sql = "SELECT * FROM products WHERE categoryID =%s"        #productDetail
        value = (relatedProductsID,)
        mycursor.execute(sql, value)
        relatedProducts = mycursor.fetchall()
        print(relatedProducts[0][7],"<-----------------------------------")
        print("***************************** ",userexist," ************************************************")
        return render_template('productDetail.html', data=myresult[0],HowManyProductsInCart=HowManyProducts,relatedProducts=relatedProducts)

@app.route('/contact')
def contact():
    return render_template('contact.html')


@app.route('/login', methods=["POST", "GET"])
def login():
    global userexist
    if request.method == "POST":
        req = request.form
        username = req.get('Username')
        Password = req.get('Password')
        mycursor = mydb.cursor()
        sql = "SELECT * FROM users WHERE Email ='{}' AND password='{}'".format(
            username, Password)
        try:
            mycursor.execute(sql)
            user = mycursor.fetchall()
            userexist = user[0][0]
            print("*****************************",userexist," ************************************************")
            return render_template('CustomerDashboard.html',Name=user[0][1])
        except:
            print("*****************************", userexist ," ************************************************")
            return render_template('login.html',error="Email or password is incorrect.")
    else:
        print("***************************** ",userexist," ************************************************")
        return render_template('login.html')


@app.route('/register', methods=["POST", "GET"])
def register():
    global userexist
    if request.method == "POST":
        req = request.form
        FirstName = req.get('Firstname')
        SecondName = req.get('Lastname')
        Email = req.get('Email')
        Password = req.get('password')
        PasswordConfirm = req.get('passwordConfirm')
        Age = req.get('age')
        mobile = req.get('mobile')
        Country = req.get('country')
        city = req.get('city')
        sex = req.get('sex')
        occupation = req.get('ocupation')

        
        # sql = "INSERT INTO users (firstName, secondName, UserName, password,Email, Address, phoneNo, Age,country, city, sex, Role)  VALUES ( NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)"
        # val(FirstName, SecondName, Email, Password, Email, Email, mobile, age, Country, city, sex, "Customer")

        mycursor = mydb.cursor()
        # sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
        sql = """INSERT INTO users (firstName, secondName,  password,Email, Address, phoneNo, Age,country, city, sex, Role)  VALUES ( %s, %s,  %s, %s, %s, %s, %s, %s, %s, %s, %s)"""

        # val = ("John", "Highway 21")
        val = (FirstName, SecondName, Password, Email,
               Email, mobile, Age, Country, city, sex, "Customer")
        try:
            mycursor.execute(sql, val)
            mydb.commit()
            print(mycursor.rowcount, "record inserted.")
            print("***************************** ",userexist," ************************************************")
            return render_template('login.html')
        except:
            print("***************************** ",userexist," ************************************************")
            return render_template('register.html', error="User allready exise!")

    else:
        print("***************************** ",userexist," ************************************************")
        return render_template('register.html')


@app.route('/cart', methods=["POST", "GET"])
def cart():
    global userexist,orderId
    carditems=list()
    carditem=list()
    

    if(userexist):
        if request.method == "POST":
            req = request.form
            FirstName = req.get('firstName')
            lastName = req.get('lastName')
            number = req.get('number')
            Provence = req.get('provence')
            city = req.get('city')
            Area = req.get('area')
            Address = req.get('address')
            Ocupation = req.get('deliverTo')
            Confirm = req.get('remove')
            now = datetime.datetime.now()
            mycursor = mydb.cursor()
            sql = "UPDATE userorder SET  status = 'Confirm',firstName='{}',lastName='{}',phoneNo={},provence='{}',city='{}',area='{}',address='{}',occupation='{}' WHERE Id={}".format(FirstName,lastName,number,Provence,city,Area,Address,Ocupation,orderId)
            mycursor.execute(sql)
            mydb.commit()
            return render_template('CustomerDashboard.html')
        else:
            # //Fatching orderId of existing user
            # if(id !='0'):
            #     mycursor = mydb.cursor()
            #     sql = "DELETE FROM orderdetail WHERE productID ={} AND Id={}".format(id,orderId)
            #     mycursor.execute(sql)
                

            mycursor = mydb.cursor()
            sql = "SELECT Id FROM userorder WHERE userID ={} AND status='NotConfirmed'".format(userexist)
            mycursor.execute(sql)
            orderID = mycursor.fetchall()
            total=0.0
            discount=0.0
            subTotal=0.0
            if(len(orderID)!=0):
                # Factching card products
                orderId=orderID[0][0] 
                mycursor = mydb.cursor()
                sql = "SELECT * FROM orderdetail WHERE UserOrderID ={} ".format(orderID[0][0])
                mycursor.execute(sql)
                cartProducts= mycursor.fetchall()
                # Fatching Products Details of Add to cart Items
                for i in cartProducts:
                    mycursor = mydb.cursor()
                    sql = "SELECT id,name,price,discount,description,img1 FROM products WHERE Id ={}".format(i[1])        #productDetail
                    mycursor.execute(sql)
                    products= mycursor.fetchall()
                    for j in products:
                        carditem.append(j[0])
                        carditem.append(j[1])
                        carditem.append(j[2])
                        carditem.append(j[3])
                        carditem.append(j[4])
                        carditem.append(j[5])
                        # order product color,size,quantity 
                        carditem.append(i[2])
                        carditem.append(i[3])
                        carditem.append(i[4])
                        carditems.append(carditem)
                        carditem=[]
                        productPurchase=j[2] * i[4]
                        total=total+productPurchase
                        discount=discount+j[3]
                subTotal=total-discount+100
                return render_template('cart.html',carditems=carditems,total=total,discount=discount,subTotal=subTotal)
            else:
                carditems=[]
                return render_template('cart.html',carditems=carditems,cardItemNotExist="There is not item in your Card!")
    return render_template('login.html',message="Kindly Login yourself to confirm your order!")

# @app.route('/shop', methods=["POST"])
# def shopSelected():
#     if request.method == "POST":
#          # mycursor = mydb.cursor()
#          # sqlCategories = "SELECT * FROM categories"
#          # mycursor.execute(sql)
#         # Categories = mycursor.fetchall()
#         # sqlCategories = "SELECT * FROM categories"
#         req = request.form
#         Category = req.get('Category')
#         Product = req.get('Products')
#         MinRange = req.get('minRange')
#         MaxRange = req.get('maxRange')
#         ProductSize = req.get('size')
#         Brand = req.get('brand')
#         print(Category,"----------------------------------------------------------------------->>>>>>>>>>>>>>>>")
#         print(Product)
#         print(MinRange,MaxRange,ProductSize,Brand)
#         return render_template('shop.html')
#     else:
#         return render_template('shop.html')
    
@app.route('/shop/<string:id>', methods=["POST", "GET"])
def shop(id):
    global HowManyProducts
    if request.method == "POST":
        # mycursor = mydb.cursor()
        # sqlCategories = "SELECT * FROM categories"
        # mycursor.execute(sql)
        # Categories = mycursor.fetchall()
        # sqlCategories = "SELECT * FROM categories"
        req = request.form
        Category = req.get('Category')
        Product = req.get('Products')
        MinRange = req.get('minRange')
        MaxRange = req.get('maxRange')
        ProductSize = req.get('size')
        Brand = req.get('brand')
        print(Category,"----------------------------------------------------------------------->>>>>>>>>>>>>>>>")
        print(Product)
        print(MinRange,MaxRange,ProductSize,Brand)
        print("***************************** ",userexist,HowManyProducts," ************************************************")
        return render_template('shop.html',HowManyProductsInCart=HowManyProducts)
    else:
        if(id!='0'):
            mycursor = mydb.cursor()
            sql = "SELECT id,name,price,quantity,img1 FROM products WHERE categoryID='{}'".format(id)
            mycursor.execute(sql)
            myresult = mycursor.fetchall()

            for x in myresult:
                print("Id = ", x[0], )
                print("Product Name = ", x[1])
                print("Price  = ", x[2])
                print("Quantity  = ", x[3], "\n")
                print("img1  = ", x[3], "\n")
                print("***************************** ",userexist,HowManyProducts," ************************************************")
            return render_template('shop.html',products=myresult,HowManyProductsInCart=HowManyProducts)
        elif(id=='0'):
            mycursor = mydb.cursor()
            sql = "SELECT id,name,price,quantity,img1 FROM products"
            mycursor.execute(sql)
            myresult = mycursor.fetchall()

            for x in myresult:
                print("Id = ", x[0], )
                print("Product Name = ", x[1])
                print("Price  = ", x[2])
                print("Quantity  = ", x[3], "\n")
                print("img1  = ", x[3], "\n")
            print("***************************** ",userexist,HowManyProducts," ************************************************")
            return render_template('shop.html',products=myresult,HowManyProductsInCart=HowManyProducts)
        else:
            print("***************************** ",userexist," ************************************************")
            return render_template('shop.html',HowManyProductsInCart=HowManyProducts)

@app.route('/search')
def search():
    return render_template('search.html')


@app.route('/wr')
def write_review():
    return render_template('write_review.html')

@app.route('/admin')
def admin():
    return render_template('admin/layout.htm')



app.run(debug=True)

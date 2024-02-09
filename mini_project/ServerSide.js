var exp = require('express')
var bp = require('body-parser')
var mysql = require('mysql2')
var cors = require('cors')

var app = exp();
app.use(cors())
app.use(bp.json())


app.listen(9000, function () {
    console.log("Express Server Started")
})

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "electro_mart"
})

con.connect(function (err) {
    if (!err)
        console.log("Databse connected")
    else
        console.log("Error to connect database")
})


// Fresh Registration 
app.post('/reg', function (req, res) {
    var name = req.body.name;
    var address = req.body.address;
    var email_id = req.body.email_id;
    var date_of_birth = req.body.date_of_birth;
    var gender = req.body.gender;
    var mobile_num = req.body.mobile_num;
    var role = req.body.role;
    var password = req.body.password;
    
    var query = "INSERT INTO User (name, address, email_id, date_of_birth, gender, mobile_num, role, password) VALUES (?,?,?,?,?,?,?,?)"


    con.query(query,[name, address, email_id, date_of_birth, gender, mobile_num, role, password],function(err){
        if(!err)  
        {
            res.send("true");
            console.log("Successfully Created User ")
            
        }

        else
        {
            console.log("Failed to Create New User");
            console.log(err);
        }
    })
})



//Making Component for Login Page
app.post('/login', function (req, res) {
    
    var email_id = req.body.email_id;
    var password = req.body.password;
    var query = "Select password from user where email_id = (?)"

    
    con.query(query,[email_id],function(err,result){
        if(!err)  
        { 
            if(password == result[0].password)
            {
                
                res.send("true");
                console.log("Login Success")
            }
            else
            {
                res.send("Failure");
                console.log("Invalid Password");
            }
        }
        else
        {
           console.log("Invalid Email");
        }
    })
})

//Updating Password
app.post('/update', function(req,res){
    var email_id = req.body.email_id;
    var password_new = req.body.password_new;

    console.log(email_id);
    console.log(password_new);
    var query = "UPDATE user SET password = (?) WHERE email_id  = (?)"

    con.query(query,[password_new,email_id],function(err){     
        if(!err)
        {
         
            res.send("true");
            console.log("Success")
        }
        else
        {
            console.log("Failed")
        }
    })
})
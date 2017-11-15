var express=require("express");
var app=express();
var bodyParser=require("body-parser");//勇于做Post请求
var server=require("http").createServer(app);
var mysql = require('mysql');


//创建数据库连接
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'lifefamily',
    port: 3306
});
conn.connect();

//增删改查语句;
var insertSQL = 'INSERT INTO `userlist`(`username`, `password`, `pic`) VALUES';
var selectSQL = 'select * from `testit`';
var deleteSQL = 'delete from t_user';
var updateSQL = 'INSERT INTO `testit`(`id`, `title`) VALUES ([value-1],"[value-2]")';


//指定静态资源文件目录，网页位置
app.use(express.static("src"));

//创建Post请求处理中间件
// create application/json parser
var jsonParser = bodyParser.json();

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({ extended: false });


//注册时获取客户端用户名和密码操作
// app.post("/submit",urlencodedParser,function(req,res){
// 	if (!req.body) return res.sendStatus(400);
// 	var user={
// 		id:"",
// 		username:"",
// 		password:"",
// 		pic:"img/icon1.png",
// 		sexy:"",
// 		age:"",
// 		rooms:[]
// 	};
// 	user.username=req.body.username;
// 	user.password=req.body.password;
// 	//查找验证
// 	var sql="select * from `userlist` where username='"+user.username+"'";
// 	conn.query(sql, function (err2, rows) {
// 	  if (err2) console.log(err2);
// 	  if(rows!=""){
// 	  	 res.send({msg:0});
// 	  }
// 	  else{
// 	  	var num=0;
// 	  	insertSQL+='("'+user.username+'","'+user.password+'","'+user.pic+'")';
// 		num=insert(insertSQL);
// 		res.send({msg:1});
// 	  }
// 	});

	
// })
//获取个人信息页的数据
app.get("/banner",function(req,res){
	const cid=req.query.cid,
		selectSQL = "select * from `banner` where cid="+cid;
		conn.query(selectSQL,function(err,row){
			if(err)console.log(err);
			if(row!=""){
				console.log(row)
				res.send({msg:1,list:row});
			}else{
				res.send({msg:0});
			}
		});
});
//开启服务器
server.listen(3000,function(){
	console.log("server start at 3000");
});
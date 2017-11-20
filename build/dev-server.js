'use strict'
require('./check-versions')()
const config = require('../config')
if (!process.env.NODE_ENV) {
  process.env.NODE_ENV = JSON.parse(config.dev.env.NODE_ENV)
}

const opn = require('opn')
const path = require('path')
const express = require('express')
const webpack = require('webpack')
const proxyMiddleware = require('http-proxy-middleware')
const webpackConfig = (process.env.NODE_ENV === 'testing' || process.env.NODE_ENV === 'production')
  ? require('./webpack.prod.conf')
  : require('./webpack.dev.conf')

// default port where dev server listens for incoming traffic
const port = process.env.PORT || config.dev.port
// automatically open browser, if not set will be false
const autoOpenBrowser = !!config.dev.autoOpenBrowser
// Define HTTP proxies to your custom API backend
// https://github.com/chimurai/http-proxy-middleware
const proxyTable = config.dev.proxyTable

const app = express()
const compiler = webpack(webpackConfig)

const devMiddleware = require('webpack-dev-middleware')(compiler, {
  publicPath: webpackConfig.output.publicPath,
  quiet: true
})

const hotMiddleware = require('webpack-hot-middleware')(compiler, {
  log: false,
  heartbeat: 2000
})
// force page reload when html-webpack-plugin template changes
// currently disabled until this is resolved:
// https://github.com/jantimon/html-webpack-plugin/issues/680
// compiler.plugin('compilation', function (compilation) {
//   compilation.plugin('html-webpack-plugin-after-emit', function (data, cb) {
//     hotMiddleware.publish({ action: 'reload' })
//     cb()
//   })
// })

// enable hot-reload and state-preserving
// compilation error display
app.use(hotMiddleware)

// proxy api requests
Object.keys(proxyTable).forEach(function (context) {
  const options = proxyTable[context]
  if (typeof options === 'string') {
    options = { target: options }
  }
  app.use(proxyMiddleware(options.filter || context, options))
})

// handle fallback for HTML5 history API
app.use(require('connect-history-api-fallback')())

// serve webpack bundle output
app.use(devMiddleware)

// serve pure static assets
const staticPath = path.posix.join(config.dev.assetsPublicPath, config.dev.assetsSubDirectory)
app.use(staticPath, express.static('./static'))

const uri = 'http://localhost:' + port

var _resolve
var _reject
var readyPromise = new Promise((resolve, reject) => {
  _resolve = resolve
  _reject = reject
})

var server
var portfinder = require('portfinder')
portfinder.basePort = port

console.log('> Starting dev server...')

const bodyParser = require("body-parser")//勇于做Post请求
const mysql = require('mysql')
const MD5 = require('md5.js')
const fs = require('fs')
const multiparty = require('multiparty')
const util = require('util')
const os = require('os')
const host = "http://10.161.18.113:3000/";//定义全局服务器域名地址
const imgpath = "assets/headpic/";

//创建数据库连接
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'lifefamily',
    port: 3306
});
conn.connect();

const jsonParser = bodyParser.json();
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const session = require('express-session');
//服务器部分

//开启session记录状态
app.use(session({
  name: 'skey',
  secret: 'keyboard cat',
  cookie: {maxAge: 3600*1000},
  resave: false,
  saveUninitialized: false
}))

//登陆接口
app.post("/login",urlencodedParser,function(req,res){
  if (!req.body) return res.sendStatus(400)
  let username = req.body.username;
  let psw      = req.body.psw;
  let sess = req.session;
  const md5    = new MD5();
  const psd    = md5.update(psw).digest('hex');
  const select = "select * from `users` where username = '"+username+"' and `psd`= '"+psd+"'";
  conn.query(select,(err,row) =>{
    if(row.length){
      sess.username=username;
      res.send({status:1,msg:"登陆成功"});
    }else{
      res.send({status:0,msg:"用户名或密码错误"});
    }
  });
});
//登陆状态判判断
app.get('/sigin',(req,res) =>{
  let sess = req.session,
      username = sess.username;
      res.send({username:username})
})
//登出接口
app.get('/logout',(req,res)=>{
  let sess = req.session;
  sess.destroy(err =>{
    if(err){ res.send({status:0,msg:"服务器繁忙"})}
    else{
      sess.username = null;
      res.clearCookie('skey');
      res.send({status:1,msg:"已退出登陆"})
    }
  });
});
//注册用户
app.post("/register",urlencodedParser,function(req,res){
    if (!req.body) return res.sendStatus(400)
    let username = req.body.username;
    let psw      = req.body.psw;
    const md5    = new MD5();
    const select = "select * from `users` where username = "+username;
    conn.query(select,(err,row) =>{
      if(row.length){
        res.send({status:0,msg:"该用户已被注册"});
      }else{
        insert();
      }
    })
    const insert =() =>{
      let   pd        = md5.update(psw).digest('hex');
      const insertSQL = 'INSERT INTO `users`(name, pay, pic, psd, type, username) VALUES("", "", "", "' + pd + '", 0, "' + username +'")';
      conn.query(insertSQL,function(err,row){
        if(err){throw err}
        else{res.send({status:1,msg:"注册成功"})}
      })
    }
})

//获取个人信息页的数据
app.get("/banner",function(req,res){
  var cid=req.query.cid,
   selectSQL="select * from `banner` where cid="+cid;
    conn.query(selectSQL,function(err,row){
      if(err)console.log(err);
      if(row!=""){
        res.send({msg:1,list:row});
      }else{
        res.send({msg:0});
      }
    });
});

//获取列表页中的导航
app.get("/nav",function(req,res){
  var cid=req.query.cid,
      selectSQL="select * from `nav` where cid = "+cid;
      conn.query(selectSQL,function(err,row){
        if(err)console.log(err);
        if(row!=""){
          res.send({msg:1,list:row});
        }else{
          res.send({msg:0});
        }
      });      
})

//获取列表页中的列表内容
app.get("/menu",function(req,res){
  var id=req.query.id,
      selectSQL="select * from `menu` where pid = "+id;
      conn.query(selectSQL,function(err,row){
        if(err)console.log(err);
        if(row!=""){
          res.send({msg:1,list:row});
        }else{
          res.send({msg:0});
        }
      });      
})

//获取列房地产详细页中的列表内容
app.get("/pdetail",function(req,res){
  var code=req.query.code,
      selectSQL="select * from `pdetail` where code = "+code;
      conn.query(selectSQL,function(err,row){
        if(err)console.log(err);
        if(row!=""){
          res.send({msg:1,list:row});
        }else{
          res.send({msg:0});
        }
      });      
})

//获取食品中的详细内容
app.get("/fdetail",function(req,res){
  var code=req.query.code,
      selectSQL="select * from `fdetail` where code = "+code;
      conn.query(selectSQL,function(err,row){
        if(err)console.log(err);
        if(row!=""){
          res.send({msg:1,list:row});
        }else{
          res.send({msg:0});
        }
      });      
})

//获取列表页中的列表内容
app.get("/evaluate",function(req,res){
  var code=req.query.code,
      selectSQL="select * from `evaluate` where code = "+code+ " order by time DESC";
      conn.query(selectSQL,function(err,row){
        if(err)console.log(err);
        if(row!=""){
          res.send({msg:1,list:row});
        }else{
          res.send({msg:0});
        }
      });      
})

//头像上传
app.post('/headupload', (req,res)=>{
  //生成multiparty对象，并配置上传目标路径
  let form = new multiparty.Form({uploadDir: './src/assets/headPic'});
  //上传完成后处理
  form.parse(req, (err,fields,files) =>{
    // let filesTmp = JSON.stringify(files,null,2);
    if(err){
      console.log(err)
    }else{
      // console.log('parse files: ' + filesTmp)
      let inputFile = files.file[0];
      let outputFile = files.upfile[0];
      let uploadedPath = outputFile.path;
      let picname = inputFile.path.split('\\')[3];
      let dstPath = './src/assets/tmp' + inputFile.originalFilename;  
      fs.rename(uploadedPath, dstPath, function(err,res) {
        if(err){
            console.log('rename error: ' + err);
        } else {
          //删除文件
          fs.unlink(dstPath, err => {
            if(err) throw err;
          });
        }        
      });
      //更改数据库
      const username = req.session.username
      const upsertSQL = 'UPDATE `users` SET `pic` = "'+ picname +'" WHERE username = "' + username +'"';
      conn.query(upsertSQL,function(err,row){
        if(err){throw err; res.send({status:0,msg:"上传失败"})}
        else{res.send({status:1,msg:"上传头像成功"})}
      })            
    }
  })
})
//获取用户信息
app.get('/getInfo', (req,res)=>{
  let username = req.session.username;
  let selectSql = 'select * from `users` where username = "'+username+'"';
  conn.query(selectSql,function(err,row){
    if(err)console.log(err);
    if(row!=""){
      row[0].pic = host + imgpath + row[0].pic
      res.send({status:1,list:row});
    }else{
      res.send({status:0});
    }
  });   
});


//服务器部分

devMiddleware.waitUntilValid(() => {
  portfinder.getPort((err, port) => {
    if (err) {
      _reject(err)
    }
    process.env.PORT = port
    var uri = 'http://localhost:' + port
    console.log('> Listening at ' + uri + '\n')
    // when env is testing, don't need open it
    if (autoOpenBrowser && process.env.NODE_ENV !== 'testing') {
      opn(uri)
    }
    server = app.listen(port)
    _resolve()
  })
})

module.exports = {
  ready: readyPromise,
  close: () => {
    server.close()
  }
}

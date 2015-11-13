// server.js
// load the things we need
var express = require('express');
var session = require('express-session');
var app = express();

app.use(session({secret: 'ssshhhhh'}));
var sess;
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  database: 'node',
  user     : 'root',
  password : 'contrivesolf00bar12'
});
connection.connect();
// set the view engine to ejs
app.set('view engine', 'ejs');
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true })); 
var moment = require('moment');
moment().format();

// use res.render to load up an ejs view file

// index page 
app.get('/', function(req, res) {
    sess=req.session;
    res.render('pages/index',{session: sess});
});

app.get('/channel', function(req, res) 
{ 
    sess=req.session;
    if(sess.email)
    {
         res.render('pages/createchannel',{session: sess});
    }
    else
    {
        res.render('pages/index',{session: sess});
    }
});
app.get('/signup', function(req, res) 
{
    sess=req.session;
    res.render('pages/signup',{session: sess});
});
app.get('/login', function(req, res) 
{
    sess=req.session;
    res.render('pages/login',{session: sess});
});
app.get('/subscribe', function(req, res) 
{
  sess=req.session;
  if(sess.email)
  {
     connection.query('SELECT * from channels', function(err, rows, fields) 
     {
        if (err) throw err;
        res.render('pages/subscribe',{channels: rows,session: sess});
     });
  }
    else
    {
        res.render('pages/index',{session: sess});
    } 
});
app.get('/notifications', function(req, res) 
{
    sess=req.session;
    if(sess.email)
    {
        res.render('pages/notifications',{session: sess});
    }
    else
    {
        res.render('pages/index',{session: sess});
    } 
});
app.get('/post', function(req, res) 
{
    sess=req.session;
    if(sess.email)
    {
        connection.query('SELECT * from channels', function(err, rows, fields) 
         {

             if(err) 
             {
                  res.render('pages/error',{error: err},{session: sess});
             }else{    
                res.render('pages/post',{channels: rows,session: sess});
              }
         });
    }
    else
    {
        res.render('pages/index',{session: sess});
    } 
});
app.post('/createchannel', function(req, res) 
{
    sess=req.session;
       var ChannelName = req.body.name;
       var ChannelExpiration = req.body.exp;
       var d=moment();
       var post  = {name:ChannelName,expiration:ChannelExpiration,created_at:d};
    //  connection.connect();
           connection.query('INSERT INTO channels SET ?', post, function(err, rows, fields) 
           {
               if(err) {
                  res.render('pages/error',{error: err},{session: sess});
                }
                else{    res.redirect('/channel');
                }
           });

 //   connection.release();
 
});
app.post('/createuser', function(req, res) 
{
    sess=req.session;
     var fname    = req.body.fname;
     var lname    = req.body.lname;
     var email    = req.body.email;
     var password = req.body.password;
     var d=moment();

     var post  = {fname:fname,lname:lname,email:email,password:password,created_at:d};
     connection.query('INSERT INTO users SET ?', post, function(err, rows, fields) 
         {
            if (err) {
               res.render('pages/error',{error: err,session: sess});
            }else{
                   res.redirect('/');
            }
         });
});
app.post('/createsubscribtion', function(req, res) 
{
    sess=req.session;
     var channel    = req.body.channel;
     // var userid    = req.body.userid;
     // var d=moment();

     // var post  = {channel_id:channel,user_id:userid,created_at:d};
     // connection.query('INSERT INTO subscriptions SET ?', post, function(err, rows, fields) 
     //     {
     //        if (err) {
     //           res.render('pages/error',{error: err,session: sess});
     //        }else{
     //               res.redirect('/');
     //        }
     //     });


     var query='SELECT * FROM channels WHERE id ='+ channel;
     connection.query(query, function(err, rows, fields) 
         {
            if (err) {
               res.render('pages/error',{error: err,session: sess});
            }else{



                  if(rows.length>0)
                  {
                    // console.log(rows[0].created_at);
                    // var date1 = moment(rows[0].created_at);
                    // date1.utc();
                    // date1.add(rows[0].expiration,'hours');
                    // console.log(date1);
                             var query='SELECT * FROM posts WHERE channel_id ='+ channel;
                             connection.query(query, function(err, crows, fields) 
                             {
                                  if (err) 
                                  {
                                     res.render('pages/error',{error: err,session: sess});
                                  }
                                  else
                                  {
                                     res.render('pages/notifications',{session: sess,channels: rows,posts: crows});
                                  }
                             });

                  }else
                  {
                    res.render('pages/error',{error: "no user found",session: sess});
                  }

            }
         });



});
app.post('/authenticateuser', function(req, res) 
{
     sess=req.session;
     var email    = req.body.email;
     var password = req.body.password;
     var post  = {email:email,password:password};
     var query='SELECT * FROM users WHERE email ="'+ email+'" and  password = "'+password+'"';
     connection.query(query, function(err, rows, fields) 
         {
            if (err) {
               res.render('pages/error',{error: err});
            }else{
                  if(rows.length>0)
                  {
                     sess.userid=rows[0].id;
                     sess.email=rows[0].email;
                     sess.fname=rows[0].fname;
                     sess.lname=rows[0].lname;
                     res.redirect('/');
                  }else
                  {
                    res.render('pages/error',{error: "no user found",session: sess});
                  }

            }
         });
});


app.listen(3001);



var server      = require('http').Server(app);
var io          = require('socket.io')(server);
var redis       = require("redis");
var redisClient = redis.createClient();
 redisClient.subscribe('message');

 var pub = redis.createClient();

var connectedClients = new Object();
server.listen(4000);
io.on('connection', function (socket) 
{
  redisClient.on('message', function(channel, message)
  {

    var message=JSON.parse(message);
    var channelid=message.channelid;

      for (var i in connectedClients ) 
      {
        if(channelid==connectedClients[i].channelid)
        {
            var index = connectedClients[i].messageIds.indexOf(message['messageid']);
            if (index == -1)
            { 
                connectedClients[i].socket.emit(channel, message);
                connectedClients[i].messageIds.push(message['messageid']);
            }
        }     
      };

  });
  socket.on('join', function(data) 
  {
   
        var user = new Object();
        user.socket=socket;
        user.socketid=socket.id;
        user.userid=data.id;
        user.channelid=data.channelid;
        user.messageIds=[];
        connectedClients[data.id] = user;
      
  });


});

app.post('/createpost', function(req, res) 
{
    sess=req.session;
       var ChannelID = req.body.channel;
       var Comment = req.body.comment;
       var d=moment();
       var post  = {channel_id:ChannelID,comment:Comment,created_at:d};
    //  connection.connect();
           connection.query('INSERT INTO posts SET ?', post, function(err, rows, fields) 
           {
               if(err) {
                  res.render('pages/error',{error: err,session: sess});
                }
                else{   
                  var messageID=rows.insertId;
                  var data = '{"messageid":'+messageID+',"channelid":'+ChannelID+',"message":"'+Comment+'"}';
                  pub.publish("message",data);
                 res.redirect('/post');
                }
           });

 //   connection.release();
 
});
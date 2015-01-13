var express = require('express');
var session = require('express-session');
var path = require('path');
var fs = require('fs');
var hbs = require('hbs');
var mongoose = require('mongoose');
var expressMongoose = require('express-mongoose');

var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var favicon = require('serve-favicon');

var helpers = require('./app/hbs-helpers');
var routes = require('./app/routes');

var app = express();

// Configure server
var port = process.env.NODE_PORT || 3000;

console.log(port);

// connect to Mongo when the app initializes
mongoose.connect('mongodb://localhost/rr');

app.set('port', port);
app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(cookieParser());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({extended: false}));

// parse application/json
app.use(bodyParser.json());


app.use(session({
    secret:            'test secret',
    resave:            true,
    saveUninitialized: true
}));


var clientDir, viewsDir;
/**
 * Development Settings
 */
if (app.get('env') === 'development') {
    clientDir = '/public';
    viewsDir = '/views';

    app.use(express.static(path.join(__dirname, '.tmp')));
    app.use(express.static(path.join(__dirname, 'public')));

    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error:   err
        });
    });
}

/**
 * Production Settings
 */
if (app.get('env') === 'production') {
    clientDir = '/dist';
    viewsDir = '/dist/views';

    app.use(express.static(path.join(__dirname, 'dist')));

    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error:   {}
        });
    });
}


app.set('view engine', 'hbs');
app.set('views', __dirname + viewsDir);
app.set('public', __dirname + clientDir);

helpers.initialize(hbs);
hbs.registerPartials(__dirname + viewsDir + '/partials');


app.use(function (req, res, next) {
    if (req.url.substr(-1) == '/' && req.url.length > 1) {
        res.redirect(301, req.url.slice(0, -1));
    } else {
        next();
    }
});

//routes list:
//routes.initialize(app);


app.get('/:path', function(req, res, next) {
    console.log(req.app.get('public') + '/' + req.param('path', 'index') + '.html');
    res.sendfile(path.join(req.app.get('public') + '/' + req.param('path', 'index') + '.html'));
});

var server = app.listen(port, function () {

    var host = server.address().address;
    var port = server.address().port;

    console.log('Example app listening at http://%s:%s', host, port)

});

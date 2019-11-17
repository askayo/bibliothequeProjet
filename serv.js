var http=require('http');
var express=require('express');
var mysql = require('mysql');
var port=3300;
var app=express();

var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.set('view engine', 'ejs');
//app.use('/css', express.static(__dirname + '/css'));

var connect1=mysql.createConnection({
    "host":"localhost",
    "user":"root",
    "password":"",
    "database":"library",
    "port":"3306"
});
connect1.connect(function(error){
    if (error) {
        console.log("Problem with MySQL : "+error);
    } else {
        console.log("Connection to database OK...");
    }
});

app.get('/', function (req, res) {
    res.render('index')
}).get('/livres', function (req, res) {
    connect1.query("SELECT * FROM livres",
        function (error, rows) {
            if (error) {
                console.log("Problem with MySQL : " + error);
                connect1.end();
            } else {
               res.send(JSON.stringify(rows));
            }
        })
}).get('/liste', function (req, res) {
    res.render('listeLivres')

}).get('/admin', function (req, res) {
    res.render('admin')
}).get('/admin/nouveauLivre', function (req, res) {
    res.render('admin/nouveauLivre')
});

app.post('/admin/nouveauLivre', function (req, res) {
    let titre = req.body.titre;
    let auteur = req.body.auteur;
    let editeur = req.body.editeur;
    let nbPage = req.body.nbPage;
    let resume = req.body.resume;
    connect1.query("INSERT INTO livres (livre_titre, livre_auteur,livre_editeur,livre_nbpage,livre_resume) VALUES ('"+titre+"','"+auteur+"','"+editeur+"','"+nbPage+"','"+resume+"')",function (err,result) {
        if (err) throw err;
        console.log(result);
        if(result){
            res.redirect("http://localhost:3300/liste")
        }
    });


});



app.listen(port, function () {
    console.log("Listening on port "+port);
})

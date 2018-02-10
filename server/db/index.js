var mysql = require('mysql');

// Create a database connection and export it from this file.
// You will need to connect with the user "root", no password,
// and to the database "chat".

var connection = mysql.createConnection({
  // host: '127.0.0.1',
  user: 'student',
  password: 'student',
  database: 'chat'
});
  

exports.connection = connection;

// connection.connect(function(err) {
//   if (err) throw err;
//   console.log('connected yo!');
// });

// exports.connection(pp)

// supp

// query and connect methods
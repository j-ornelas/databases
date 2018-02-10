var db = require('../db');
var Promise = require('bluebird');
db.connection.connect();

module.exports = { //acct for user, roomname, msg
  messages: {
    get: function () {
      var promise = new Promise((resolve, reject) => {
        db.query('SELECT * FROM messages', (err, rows, fields) => {
          if (err) {
            console.log('this is err: ', err);
            reject(err);
          } else {
            console.log('this is rows: ', rows);
            // console.log('this is fields: ', fields);
          }
        });
      });
      // db.query('SELECT * FROM messages', (err, result) =>)
    }, // a function which produces all the messages
    post: function () {} // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function () {
      return new Promise((resolve, reject) =>{
        db.connection.query('SELECT * FROM users', (err, rows) => {
          if (err) {
            console.log('err in models.users.post: ' + err); 
          } else {
            console.log('result', rows);
            resolve(rows);
          }
        });
      });
    },
    post: function (username) { // TAKES IN USER NAME
      // db.conn.connect();
      return new Promise((resolve, reject) =>{
        db.connection.query('INSERT INTO users (username Values (' + JSON.stringify(username.username) + ')', (err, result) => {
          if (err) {
            console.log('err in models.users.post: ' + err); 
          } else {
            resolve(result);
          }
        });
      });

    }
  }
};


// db.conn.connect();
// return new Promise((resolve, reject) => {
//   db.connection.query('INSERT INTO users (username) VALUES (' + JSON.stringify(username.username) + ')', (err, result) => {
//   if (err) {
//     console.log('err in models.users.post: ' + err);
//     reject(err);
//   } else {
//     resolve(result);
//   }
// }

module.exports.users.get();
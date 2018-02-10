var models = require('../models');

var defaultCorsHeaders = {
  'access-control-allow-origin': '*',
  'access-control-allow-methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'access-control-allow-headers': 'content-type, accept',
  'access-control-max-age': 10 // Seconds.
};
var headers = defaultCorsHeaders;
headers['Content-Type'] = 'application/json';

module.exports = {
  messages: {
    get: function (req, res) {
      models.messages.get((result) => {
        console.log('MESSAGES GET RESULT', result);
        res.writeHead(200, headers);
        res.send(result);
      });
      // res.writeHead(200, );
    }, // a function which handles a get request for all messages
    post: function (req, res) {
      models.messages.post((result) => {
        console.log('MESSAGES POST RESULT', result);
        res.send(result);
      });
    } // a function which handles posting a message to the database
  },

  users: { 
    // Ditto as above
    get: function (req, res) {
      console.log('USERS GET PREFUNC');
      debugger
      models.users.get((result) => {
        console.log('USERS GET RESULT', result);
        res.send(result);
      });

    },
    post: function (req, res) { // e.g. the first alert message
    
      // console.log('REQ body', req.body);
      console.log('USERS POST PREFUNC');
      models.users.post(req.body, (results) => {
        console.log('POST foo');
        res.send(results);
      });
    }
  }
};

module.exports.users.get();
/**
 * Created by zhentingwan on 10/17/16.
 */
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '8552312j',
  database : 'test'
});

connection.connect();

connection.query('SELECT * from test.Login', function(err, rows, fields) {
  if (!err)
    console.log('The solution is: ', rows);
  else
    console.log('Error while performing Query.');
});

connection.end();

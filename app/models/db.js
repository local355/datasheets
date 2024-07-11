var  mysql = require('mysql2/promise');



// Create the connection pool. The pool-specific settings are the defaults
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'b',
  database: 'lembain_tech',
  waitForConnections: true,
  connectionLimit: 10,
  maxIdle: 10, // max idle connections, the default value is the same as `connectionLimit`
  idleTimeout: 60000, // idle connections timeout, in milliseconds, the default value 60000
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
});


// (async function() {
// 	try {
//     // execute will internally call prepare and query
//   const [results, fields] = await pool.execute(
//     'SELECT * FROM `fet_channel`'
//   );

//   console.log(results); // results contains rows returned by server
//   console.log(fields); // fields contains extra meta data about results, if available
// } catch (err) {
//   console.log(err);
// }
// })()

//insert
async function datasheet(datasheet){
	try{
		// execute will internally call prepare and query
		const sql = 'INSERT INTO `datasheets`(`Datasheet_name`) VALUES (?)';
		const values = [datasheet];
		console.log(values)
  		const [results, fields] = await pool.execute(
  			sql,values
  			);
		  console.log(results); // results contains rows returned by server
		  console.log(fields); // fields contains extra meta data about results, if available
	}catch(err){
		console.log(err)
	}
}
//update
//delete
//create


module.exports = {datasheet}

//component_name('componrnt test')
console.log('model db')
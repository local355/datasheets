var insert = require('../models/db')
module.exports = {
	inserts: {
		datasheet: (req, res, next)=>{
			insert.datasheet(req.body.Name)
			console.log(req.body)
			res.setHeader('Content-Type' , 'application/json')
			res.send({'json':'inserok'})
			console.log('inserok')
		}
	}
}
//console.log(insert.datasheet('test'))

// insert: (component_name)=>{
// 		component_name = 'test'
// 		db.component_name(component_name);
// 	}
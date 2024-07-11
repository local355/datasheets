var fs = require('fs')
let baseDir = process.env.raw
console.log("fileman : "+baseDir)
//console.log(fs.readdirSync(baseDir))
module.exports = {
	home:  (req, res, next) => {
		res.render('fileman', { title: 'Fileman', srcs: '' });
	},
	api: (req, res, next) => {
		console.log("api")
		res.setHeader('Content-Type' , 'application/json')
		res.json(fs.readdirSync(baseDir, function(err){
			if(err){
				return console.error(err)
			}
		}))
		// res.json(fs.readdirSync(baseDir), function (){
		// console.log("ok")
		// })
	},
	rename: (req, res, next) => {
		res.setHeader('Content-Type' , 'application/json')
		//console.log(req.headers)
		console.log(req.body)
		console.log(baseDir+req.body.oldName)

		fs.rename(baseDir+req.body.oldName, baseDir+req.body.newName, function (err) {
			if (err){
				return console.error(err)
			}
			console.log('rename ok')
		})

		res.send({'newName':req.body.newName})
	},
	move: (req, res, next) => {
		res.setHeader('Content-Type' , 'application/json')
		//console.log(req.headers)
		console.log(req.body)
		console.log(baseDir+req.body.fileName)
		console.log(process.env.DATASHEETS_DIR+req.body.destination+req.body.fileName)

		fs.rename(baseDir+req.body.fileName, process.env.DATASHEETS_DIR+req.body.destination+req.body.fileName, function (err) {
			if (err){
				return console.error(err)
			}
			console.log('MOVE ok')
		})

		res.send({'MSG':'MOVE ok'})
	}
}



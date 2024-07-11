var fs = require('fs')
require('dotenv').config()

file = fs.readdir(process.env.DATASHEETS_DIR,{withFileType:true, recursive:true},function(r, files){
    if(r){
        console.log(r)
    }else{
        console.log(files) 
    }
})
console.log(file)
//console.log(typeof(file[60]))

// console.log(file[60].split('\\')[1])


length = 20

// for (let i = 0; i < length; i++) {
//     console.log(i)
    
// }
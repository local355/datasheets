let baseURL = "http://127.0.0.1:3000"
let baseDir = baseURL
let pointer = 0
let data = "";

 async function rename(){
  let newName = document.getElementById('rename').value
   await fetch(
    baseURL+"/fileman/rename",
    {
      method: 'POST',
      mode:'cors',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(
        {
          newName:newName,
          oldName:data[pointer]
        }
      )
    }
  ).then((response) => response.json())
    .then((val) => {
      console.log(val.newName)
      data[pointer] = val.newName
      console.log(data[pointer])
      document.getElementsByTagName('p')[0].textContent = data[pointer]
    })
}

async function Move(des){
  let fileName = document.getElementById('rename').value
   await fetch(
    baseURL+"/fileman/move", 
    {
      method: 'POST',
      mode:'cors',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(
        {
          fileName: fileName,
          destination:des
        }
      )
    }
  ).then((response) => response.json())
    .then((val) => {
      console.log(val)
      //document.getElementsByTagName('p')[0].textContent = val[1]
    })
}



function viewer(){
  document.getElementById('ifviewer').src = baseDir +"/"+ encodeURI(data[pointer])
}


function Name() {
  document.getElementById('filename').textContent = pointer +" : "+data[pointer]
  document.getElementById('rename').value = data[pointer]
}


function next() {
  pointer = pointer + 1
  viewer()
  Name()
  console.log("next")
  console.log(data[pointer])
}


function prevs() {
  pointer = pointer - 1
  viewer()
  Name()
  console.log("prevs")
  console.log(data[pointer])
}

(async function () {
  await fetch(baseURL+'/fileman/api')
    .then((response) => response.json())
    .then((val) => {
      data =  val
      viewer()
      Name()
      console.log(val)
    });
})()

// document.getElementById('next').onclick = next()
// document.getElementById('prevs').onclick = prevs()
console.log("pointer val = " + pointer)



async function Insert(fileName){
  await fetch(
    baseURL+"/fileman/insert",
    {
      method: 'POST',
      mode:'cors',
      headers: {
        'Content-Type': 'application/json'
      },
      body:JSON.stringify(
        {
          Name : fileName
        }
      )
    }
  ).then((response) => response.json())
    .then((val) => {
       console.log(val)
      //document.getElementsByTagName('p')[0].textContent = val[1]
    })
}

async function partNumber(){
  let getComponentName = document.getElementById('component_name').value
   
}
async function datasheet(){
  let getDatasheetName = document.getElementById('datasheet').value
  console.log(getDatasheetName)
}

//Insert('test inserr')
dummydata = ['1','2','3','4','5','6','7','8','9','0','9','8','7','6','5','4','3','3','2','2','1']

function bulk(){
  for (var i = dummydata.length -1; i >= 0; i--) {
    Insert(dummydata[i])
    x//console.log(i +' : '+data[i])
  }
}


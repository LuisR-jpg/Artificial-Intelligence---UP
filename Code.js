//requiring path and fs modules
const path = require('path');
const fs = require('fs');
//joining path of directory 
const directoryPath = path.join('C:', 'Users', 'lalor', 'Documents', 'Git', 'School', 'Web');
//passsing directoryPath and callback function
fs.readdir(directoryPath, {withFileTypes: true}, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    } 
    //listing all files using forEach
    files.forEach(function (file) {
        // Do whatever you want to do with the file
      try{
      if(fs.existsSync('./Web/' + file.name + '/index.html'))
	console.log(file.name);
      }
      catch(err){
	console.error(err);
      }
    });
});

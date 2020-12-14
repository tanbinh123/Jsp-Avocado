
function getNowPageFileName(){ 
  //현재 파일명+확장자 얻기		
  var thisfilefullname = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.length);
}

function getNowPageFolderName(){ 
  //현재 파일이름의 폴더명 얻기		
  var thisfilefoldername = thisfilefullname.substring(thisfilefullname.lastIndexOf('.'), 0);
}
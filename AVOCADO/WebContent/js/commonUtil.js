
function getNowPageFileName(){ 
  //현재 파일명+확장자 얻기		
  var thisfilefullname = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.length);
}

function getNowPageFolderName(){ 
  //현재 파일이름의 폴더명 얻기		
  var thisfilefoldername = thisfilefullname.substring(thisfilefullname.lastIndexOf('.'), 0);
}

/*
공백체크
*/
function checkEmpty(obj, alertString ){
   var errorMesg =  alertString ;
   if(trim(obj.value) == "" ) {
		alert(errorMesg);
		obj.focus();
		return false;
   } else {
		return true;   
   }	
}

/*
문자열 앞뒤에있는 공백없에기
*/
function trim( arg )
{
   var st = 0;
   var len = arg.length;

   //문자열앞에 공백문자가 들어 있는 Index 추출
   while( (st < len) && (arg.charCodeAt(st) == 32) )
   {
      st++;
   }
   //문자열뒤에 공백문자가 들어 있는 Index 추출
   while( (st < len) && (arg.charCodeAt(len-1) == 32) )
   {
      len--;
   }
   return ((st > 0) || (len < arg.length)) ? arg.substring(st, len) : arg;
}

var httpRequest=null;
function createHttpRequest(){
   if(window.ActiveXObject){
      return new ActiveXObject("Msxml2.XMLHTTP");
      //IE 8.0이하 => Microsoft.XMLHTTP
   }else if(window.XMLHttpRequest){
      return new XMLHttpRequest();//Chrome, Firefox
   }else{//나머지는 실행이 안됨
      return null;
   }
}
//자동으로 실행하는 함수 => callback함수! 대표적으로 main이 있음
function sendMessage(method, url, callback){
   httpRequest=createHttpRequest();
   //서버와 연결시킴
   httpRequest.open(method, url, true);
   //true => 비동기화
   httpRequest.onreadystatechange=callback;//상태가 변경되면 자동으로 호출됨
   //전송하는 데이터가 있을 때
   httpRequest.send(null);
   //여기는 get방식이기 때문에 parameter를 주지 않고 일단 null을 채워넣음
}

function sawonAllData(){
   /*
      0 open 전 상태
      1 open() 서버 연결
      2 open() 완료
      3 send() 데이터 전송 중
      4 send() 데이터 전송 완료
   */
   if(httpRequest.readyState==4){
      if(httpRequest.status==200){
         // 서버가 정상 수행하고 있을 때
         var div=document.getElementById("print");
         div.innerHTML=httpRequest.responseText;
         //읽어온 모든 문장들을 집어넣기
      }
   }
}

function listBtnClick(){
   sendMessage("GET","result.jsp", sawonAllData)
}
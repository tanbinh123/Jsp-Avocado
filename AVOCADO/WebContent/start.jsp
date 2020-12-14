<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
	<!-- header end-->
	<main>
	<section class="start-section-top">
            <div class="start-main-content">
            <div id="map"></div>
              
    </div>
        </div>
    </section>
    <script>
        var mapOptions = {//지도 초기화면 값
            center: new naver.maps.LatLng(36.326688, 127.407852),//지도의 초기 중심 좌표
            zoom: 16, //지도 초기 줌 레벨
            mapTypeId: "normal", //지도 종류
            minZoom: 8, //지도의 최소 줌 레벨
            zoomControl: true, //줌 컨트롤의 표시 여부
            //줌 컨트롤의 옵션
            zoomControlOptions: {       
              position: naver.maps.Position.TOP_RIGHT,
              style: naver.maps.ZoomControlStyle.SMALL,
            },
            logoControl: false, //로고 컨트롤
            mapDataControl: false, //일반 위성 컨트롤
            mapTypeControl: false, //
        };

        var map = new naver.maps.Map('map', mapOptions);
        
        var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.326688, 127.407852),
        map: map
        });
        
        
        //카카오 검색 api
      let ps = new kakao.maps.services.Places();
      let search_arr = []

      $("#map_search_input").on("keydown",function(e){
        if(e.keyCode === 13){
          let content = $(this).val();
          ps.keywordSearch(content,placeSearchCB);
        }
      })

      $("#map_search_button").on("click",function(e){
        let content = $("#map_search_input").val()
        ps.keywordSearch(content,placeSearchCB);
      })

      function placeSearchCB(data,status,pagination){
        if(status === kakao.maps.services.Status.OK){
          let target = data[0];
          const lat = target.y;
          const lng = target.x;
          const latlng = new naver.maps.LatLng(lat, lng);
          marker = new naver.maps.Marker({
            position: latlng,
            map : map
          })
          if (search_arr.length == 0){
            search_arr.push(marker)
          }else{
            search_arr.push(marker)
            let pre_marker = search_arr.splice(0,1);
            pre_marker[0].setMap(null);
          }
          map.setZoom(17,true);
          map.panTo(latlng);
        }else if($("#map_search_input").val() == ""){
            alert("검색 지역을 입력해주세요!")
            $("#map_search_input").focus();
        }else{
          alert("검색 결과가 없습니다")
        }
      }
        
        
        
        //현재위치 찾기

        let currentUse = true;
      //제이쿼리 클릭 이벤트
      $("#my_location").click(() => {
        //alert("클릭 이벤트");
        if ("geolocation" in navigator) {
          navigator.geolocation.getCurrentPosition(function (position) {
            const lat = position.coords.latitude;
            const lng = position.coords.longitude;
            const latlng = new naver.maps.LatLng(lat, lng);
            if (currentUse) {
              marker = new naver.maps.Marker({
                map: map,
                position: latlng,
                icon: {
                  content: '<img class = "pulse" draggable="false" unselectable="on" src="https://myfirstmap.s3.ap-northeast-2.amazonaws.com/circle.png"></img>',
                  anchor: new naver.maps.Point(11, 11),
                },
              });
              currentUse = false;
            }
            map.setZoom(17, true); //줌레벨 , 이동 애니메이션
            map.panTo(latlng);
          });
        } else {
          alert("위치정보 사용 불가능");
        }
      });
        
        
</script>
		</main>
	<!-- footer start-->
		<%@ include file="/common/footer.jsp" %>
	<!-- footer end-->
</body>

</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BanAreaDao, dto.BanAreaDto, common.*"%>
	<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
	<!-- header end-->
<main>
	<section class="start-section-top">
        <div class="start-main-content">
            <div id="map">
                <div class="map-infoPanel">
                    
                    <div class="map-infoPanel-rent">
                        <p class="map-infoPanel-rent-text"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO"></i>&nbsp;기기 번호 : AVOCADO1684</p>
                        <p class="map-infoPanel-rent-text"><i class="em em-herb" aria-role="presentation" aria-label="HERB"></i>&nbsp;기기 종류 : 나노휠 프리미엄</p>
                        <p class="map-infoPanel-rent-text"><i class="em em-battery" aria-role="presentation" aria-label="BATTERY"></i>&nbsp;배터리 : 85%</p>
                        <div class="map-infoPanel-rent-cost">
                            <div class="map-infoPanel-rent-cost-firstCost"><i class="em em-moneybag" aria-role="presentation" aria-label="MONEY BAG"></i>&nbsp;기본 10분 <span class="map-infoPanel-rent-cost-text">1,000원</span></div>
                            <div class="map-infoPanel-rent-cost-usetCost"><i class="em em-heavy_plus_sign" aria-role="presentation" aria-label="HEAVY PLUS SIGN"></i>&nbsp;추가 1분당 <span class="map-infoPanel-rent-cost-text">100원</span></div>
                        </div>
                        <button class="map-infoPanel-rent-button"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>대여하기</button>
                    </div>
                    
                    <div class="map-infoPanel-using">
                        <p class="map-infoPanel-using-text"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO"></i>&nbsp;곽두팔님 안전 주행하세요 :) </p>
                        <p class="map-infoPanel-using-text"><i class="em em-first_place_medal" aria-role="presentation" aria-label="FIRST PLACE MEDAL"></i>&nbsp;등급 : 골드</p>
                        <p class="map-infoPanel-using-text"><i class="em em-clock7" aria-role="presentation" aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;현재 이용 시간 : 12분</p>
                        <p class="map-infoPanel-using-text"><i class="em em-moneybag" aria-role="presentation" aria-label="MONEY BAG"></i>&nbsp;현재 이용 요금 : 8,400원</p>
                        <button class="map-infoPanel-using-button"><i class="em em-arrow_right_hook" aria-role="presentation" aria-label="RIGHTWARDS ARROW WITH HOOK"></i>반납하기</button>
                    </div>
                    <div class="map-infoPanel-used">
                        <p class="map-infoPanel-used-text"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO"></i>&nbsp;곽두팔님 이용해주셔서 감사합니다 :) </p>
                        <p class="map-infoPanel-used-text"><i class="em em-first_place_medal" aria-role="presentation" aria-label="FIRST PLACE MEDAL"></i>&nbsp;등급 : 골드</p>
                        <p class="map-infoPanel-used-text"><i class="em em-clock7" aria-role="presentation" aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;총 이용 시간 : 27분</p>
                        <p class="map-infoPanel-used-text"><i class="em em-moneybag" aria-role="presentation" aria-label="MONEY BAG"></i>&nbsp;총 이용 요금 : 12,400원</p>
                        <button class="map-infoPanel-used-button"><i class="em em-white_check_mark" aria-role="presentation" aria-label="WHITE HEAVY CHECK MARK"></i>창닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        
        var mapOptions = {//지도 초기화면 값
            center: new naver.maps.LatLng(36.3275885300226, 127.41819483000722),//지도의 초기 중심 좌표
            zoom: 15, //지도 초기 줌 레벨
            mapTypeId: "normal", //지도 종류
            minZoom: 9, //지도의 최소 줌 레벨
            zoomControl: true, //줌 컨트롤의 표시 여부
            //줌 컨트롤의 옵션
            zoomControlOptions: {       
              position: naver.maps.Position.TOP_RIGHT,
              style: naver.maps.ZoomControlStyle.SMALL,
            },
            logoControl: false, //로고 컨트롤
            mapDataControl: false, //일반 위성 컨트롤
            mapTypeControl: false, //
            //maxBounds: daejeon,//지도 제한
        };

        var map = new naver.maps.Map('map', mapOptions);
        
        
        //폴리곤 구역
        var outerPolygon = [  
            new naver.maps.LatLng(38.82214590593081, 123.7558742921809),//nw
            new naver.maps.LatLng(38.80551250104758, 132.1559724348318),//ne
            new naver.maps.LatLng(32.317768013875614, 131.97452178525225),//sw
            new naver.maps.LatLng(32.03771111359428, 123.777221437659)//se
        ];

        var innerPolygon = [  
            new naver.maps.LatLng(36.32749573187026, 127.40125805181044),
            new naver.maps.LatLng(36.31984317651015, 127.40368571021637),
            new naver.maps.LatLng(36.32238477449114, 127.41251360625775),
            new naver.maps.LatLng(36.31824479732489, 127.41773350140741),
            new naver.maps.LatLng(36.31703329850712, 127.42569359964605),
            new naver.maps.LatLng(36.32204545587888, 127.43946162194452),
            new naver.maps.LatLng(36.33228736488274, 127.4357914931074),
            new naver.maps.LatLng(36.33817243809767, 127.42985054012236),
            new naver.maps.LatLng(36.34240670656781, 127.4235286508229),
            new naver.maps.LatLng(36.3339408990059, 127.41252722705583),
            new naver.maps.LatLng(36.329477248044945, 127.40816495799514)
        ];
        


        
        
        <% BanAreaDao banAreaDao = new BanAreaDao();
        String samsungAPT = banAreaDao.getBanAreaLocationValue("samsungAPT");
        String miruAPT = banAreaDao.getBanAreaLocationValue("miruAPT");
        String centralXiAPT = banAreaDao.getBanAreaLocationValue("centralXiAPT");
        String hanbatXiAPT = banAreaDao.getBanAreaLocationValue("hanbatXiAPT");
        String sunwhaHyeondaeAPT = banAreaDao.getBanAreaLocationValue("sunwhaHyeondaeAPT");
        String daeheongHyeondaeAPT = banAreaDao.getBanAreaLocationValue("daeheongHyeondaeAPT");
        String theShopAPT = banAreaDao.getBanAreaLocationValue("theShopAPT");
        String daeheongHyeondae2APT = banAreaDao.getBanAreaLocationValue("daeheongHyeondae2APT");
        String hanoulAPT = banAreaDao.getBanAreaLocationValue("hanoulAPT");
        %>
         
         var samsungAPT = [  
             <%=samsungAPT%>
         ];
         
        var miruAPT = [  
            <%=miruAPT%>
        ];
        
        var centralXiAPT = [  
            <%=centralXiAPT%>
        ];
        
        var hanbatXiAPT = [  
        	<%=hanbatXiAPT%>
        ];
        
        var sunwhaHyeondaeAPT = [  
        	<%=sunwhaHyeondaeAPT%>
        ];
        
        var daeheongHyeondaeAPT = [  
        	<%=daeheongHyeondaeAPT%>
        ];
        
        var theShopAPT = [  
        	<%=theShopAPT%>
        ];
        
        var daeheongHyeondae2APT = [  
        	<%=daeheongHyeondae2APT%>
        ];
        
        var hanoulAPT = [  
        	<%=hanoulAPT%>
        ];
        
        var serviceArea = new naver.maps.Polygon({  
            map: map,
            paths: [outerPolygon, innerPolygon],
            fillColor: '#558203',
            fillOpacity: 0.2,
            strokeColor: '#558203',
            strokeOpacity: 0.6,
            strokeWeight: 2
        });
        var banArea = new naver.maps.Polygon({  
            map: map,
            paths: [samsungAPT, miruAPT, centralXiAPT, hanbatXiAPT,sunwhaHyeondaeAPT,daeheongHyeondaeAPT, theShopAPT, daeheongHyeondae2APT, hanoulAPT],
            fillColor: '#ff0000',
            fillOpacity: 0.1,
            strokeColor: '#ff0000',
            strokeOpacity: 0.6,
            strokeWeight: 1
        });

        var markerOptions = {
            position: new naver.maps.LatLng(36.32546368731953, 127.4090509851486),
            map: map,
            icon: {
                content: "<div class='pin'></div>",
                size: new naver.maps.Size(50,50),
                anchor: new naver.maps.Point(25, 26)
            }
        };

        //마커        
        var markerOption1 = {
            map: map,
            position: new naver.maps.LatLng(36.32546368731953, 127.4090509851486),
            icon: {
              //content: "<div class='pin' ></div>",
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },
          }
        
        var marker1 = new naver.maps.Marker(markerOption1);
        
        
        var markerOption2 = {
            map: map,
            position: new naver.maps.LatLng(36.32214160019321, 127.41202950748722),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },
          }
        
        var marker2 = new naver.maps.Marker(markerOption2);
        
        var markerOption3 = {
            map: map,
            position: new naver.maps.LatLng(36.324778856980835, 127.41969293719585),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },
          }
        
        var marker3 = new naver.maps.Marker(markerOption3);
        
        var markerOption4 = {
       		map: map,
            position: new naver.maps.LatLng(36.32681744540576, 127.41184899217201),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }
        
        var marker4 = new naver.maps.Marker(markerOption4);
        
        var markerOption5 = {
       		map: map,
            position: new naver.maps.LatLng(36.3316003310822, 127.43356337490906),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }
        
        var marker5 = new naver.maps.Marker(markerOption5);
        
        var markerOption6 = {
       		map: map,
            position: new naver.maps.LatLng(36.32902286253786, 127.42535708396257),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }        
        
        var marker6 = new naver.maps.Marker(markerOption6);
        
        var markerOption7 = {
      		map: map,
            position: new naver.maps.LatLng(36.32797532866398, 127.42631036172708),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }
        
        var marker7 = new naver.maps.Marker(markerOption7);
        
        var markerOption8 = {
      		map: map,
            position: new naver.maps.LatLng(36.32268476176774, 127.42316431981536),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }       
        
        var marker8 = new naver.maps.Marker(markerOption8);
        
        var markerOption9 = {
      		map: map,
            position: new naver.maps.LatLng(36.31918738050652, 127.42141766619166),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }   
        
        var marker9 = new naver.maps.Marker(markerOption9);
        
        var markerOption10 = {
      		map: map,
            position: new naver.maps.LatLng(36.32671786041655, 127.42910668774793),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        } 
        
        var marker10 = new naver.maps.Marker(markerOption10);
        
        var markerOption11 = {
      		map: map,
            position: new naver.maps.LatLng(36.33062294327649, 127.43292468092797),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        }         
        
        var marker11 = new naver.maps.Marker(markerOption11);
        
        var markerOption12 = {
      		map: map,
            position: new naver.maps.LatLng(36.33062294327649, 127.43292468092797),
            icon: {
              content: "<img src='img/pinimg.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },	
        } 
        
        var marker = new naver.maps.Marker(markerOption12);
        

		//우클릭 이벤트
        var menuLayer = $('<div style="position:absolute;z-index:10000;background-color:#fff;border:solid 1px #333;padding:10px;display:none;"></div>');
        map.getPanes().floatPane.appendChild(menuLayer[0]);

        naver.maps.Event.addListener(map, 'rightclick', function(e) {
            var coordHtml =
                'Coord: '+ '(우 클릭 지점 위/경도 좌표)' + '<br />' +
                'Point: ' + e.point + '<br />' +
                'Offset: ' + e.offset;

            menuLayer.show().css({
                left: e.offset.x,
                top: e.offset.y
            }).html(coordHtml);

            console.log('Coord: ' + e.coord.toString());
        });

      //좌클릭 정보창 이벤트
        var contentString = [
            '<div class="map-infoPanel-rent">',
            '<p class="map-infoPanel-rent-text"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO"></i>&nbsp;기기 번호 : AVOCADO1684</p>',
            '<p class="map-infoPanel-rent-text"><i class="em em-herb" aria-role="presentation" aria-label="HERB"></i>&nbsp;기기 종류 : 나노휠 프리미엄</p>',
            '<p class="map-infoPanel-rent-text"><i class="em em-battery" aria-role="presentation" aria-label="BATTERY"></i>&nbsp;배터리 : 85%</p>',
            '<div class="map-infoPanel-rent-cost">',
              '  <div class="map-infoPanel-rent-cost-firstCost"><i class="em em-moneybag" aria-role="presentation" aria-label="MONEY BAG"></i>&nbsp;기본 10분 <span class="map-infoPanel-rent-cost-text">1,000원</span></div>',
                '<div class="map-infoPanel-rent-cost-usetCost"><i class="em em-heavy_plus_sign" aria-role="presentation" aria-label="HEAVY PLUS SIGN"></i>&nbsp;추가 1분당 <span class="map-infoPanel-rent-cost-text">100원</span></div>',
            '</div>',
            '<button class="map-infoPanel-rent-button"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>대여하기</button>',
        '</div>'
        ].join('');
        
        var infowindow = new naver.maps.InfoWindow({
            content: contentString,
            borderWidth: 0,
            anchorSize: new naver.maps.Size(10, 10),
            anchorSkew: false,
            pixelOffset: new naver.maps.Point(10, -5)
        });
        
        naver.maps.Event.addListener(marker, 'click', function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
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
              markerNow = new naver.maps.Marker({
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
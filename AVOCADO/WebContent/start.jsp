<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
         var samsungAPT = [  
            new naver.maps.LatLng(36.32512143126316, 127.40385954562106),
            new naver.maps.LatLng(36.32610345901512, 127.4072256430737),
            new naver.maps.LatLng(36.32401887120531, 127.40983158970138),
            new naver.maps.LatLng(36.32315631852501, 127.41003020222638),
            new naver.maps.LatLng(36.32214015105258, 127.40623608228485),
            new naver.maps.LatLng(36.324525184339414, 127.40406801374063)
        ];
        
        var miruAPT = [  
            new naver.maps.LatLng(36.32688203812006, 127.41258305152587),
            new naver.maps.LatLng(36.32672634573307, 127.41211188848413),
            new naver.maps.LatLng(36.32657029168145, 127.41194919184431),
            new naver.maps.LatLng(36.325851785620046, 127.41179441215512),
            new naver.maps.LatLng(36.32400637538311, 127.41390260927521),
            new naver.maps.LatLng(36.323768845635236, 127.413957887735),
            new naver.maps.LatLng(36.32387573410989, 127.41518506957023),
            new naver.maps.LatLng(36.32297014654566, 127.4153472197386),
            new naver.maps.LatLng(36.32312157339384, 127.41685447910953),
            new naver.maps.LatLng(36.324050912119944, 127.41842438737784),
            new naver.maps.LatLng(36.32498023977609, 127.41778684246944),
            new naver.maps.LatLng(36.324021220969826, 127.41567889051626),
            new naver.maps.LatLng(36.325953591353674, 127.41425772518069),
            new naver.maps.LatLng(36.32564777931441, 127.41358701319173),
            new naver.maps.LatLng(36.326378163378486, 127.41286839317537),
            new naver.maps.LatLng(36.32665131338005, 127.41286470794192)
        ];
        
        var centralXiAPT = [  
            new naver.maps.LatLng(36.323218915851236, 127.42541672285103),
            new naver.maps.LatLng(36.32128370977881, 127.42647687141941),
            new naver.maps.LatLng(36.32149725210788, 127.42710081303402),
            new naver.maps.LatLng(36.32081658385979, 127.42748732554098),
            new naver.maps.LatLng(36.32146166175611, 127.42923767500022),
            new naver.maps.LatLng(36.32239590304414, 127.4287572951926),
            new naver.maps.LatLng(36.32261833979364, 127.4293094559053),
            new naver.maps.LatLng(36.323379068682506, 127.42885668412545),
            new naver.maps.LatLng(36.32321001846518, 127.42828243698324),
            new naver.maps.LatLng(36.32348138837957, 127.42781862198458),
            new naver.maps.LatLng(36.32296089115601, 127.42623944234057),
            new naver.maps.LatLng(36.32332123576104, 127.42577562732512)
        ];
        
        var hanbatXiAPT = [  
            new naver.maps.LatLng(36.341658642541404, 127.42267704001154),
            new naver.maps.LatLng(36.340893644443454, 127.4234666298307),
            new naver.maps.LatLng(36.340288756906745, 127.42304698768908),
            new naver.maps.LatLng(36.340026340996054, 127.42335619769763),
            new naver.maps.LatLng(36.340182011554, 127.42384209912954),
            new naver.maps.LatLng(36.33951484982003, 127.42454886484178),
            new naver.maps.LatLng(36.33941255118216, 127.42473107787697),
            new naver.maps.LatLng(36.33995072946674, 127.42645934090768),
            new naver.maps.LatLng(36.34039550210189, 127.42622743340837),
            new naver.maps.LatLng(36.34194773870323, 127.42390283680142),
            new naver.maps.LatLng(36.34193884346306, 127.42321815750347)
        ];
        
        var sunwhaHyeondaeAPT = [  
            new naver.maps.LatLng(36.33381602128855, 127.4184804451158),
            new naver.maps.LatLng(36.33328114476974, 127.41922798415777),
            new naver.maps.LatLng(36.33255550222328, 127.41870331389852),
            new naver.maps.LatLng(36.332634051484945, 127.41851758991292),
            new naver.maps.LatLng(36.3325480213371, 127.4183504383259),
            new naver.maps.LatLng(36.3330941241414, 127.41758896998503)
        ];
        
        var daeheongHyeondaeAPT = [  
            new naver.maps.LatLng(36.32451779374241, 127.43106402520613),
            new naver.maps.LatLng(36.32478339213383, 127.43207622092754),
            new naver.maps.LatLng(36.323586321805635, 127.43266125148625),
            new naver.maps.LatLng(36.323530208682875, 127.43247552750067),
            new naver.maps.LatLng(36.32337683260791, 127.43255446019454),
            new naver.maps.LatLng(36.323092524938886, 127.43157940927027),
            new naver.maps.LatLng(36.32421478601992, 127.43099902181531)
        ];
        
        var theShopAPT = [  
            new naver.maps.LatLng(36.334534388689605, 127.41332117104297),
            new naver.maps.LatLng(36.332881899989495, 127.4155889189193),
            new naver.maps.LatLng(36.3321289558598, 127.41585455532736),
            new naver.maps.LatLng(36.33169700041398, 127.41395082771453),
            new naver.maps.LatLng(36.33066821595493, 127.41357222657793),
            new naver.maps.LatLng(36.32985580547241, 127.41375423670246),
            new naver.maps.LatLng(36.32976465645184, 127.41330659016262),
            new naver.maps.LatLng(36.32918209278452, 127.41339513563558),
            new naver.maps.LatLng(36.328195291355236, 127.41380834782755),
            new naver.maps.LatLng(36.32815566051481, 127.41280975170025),
            new naver.maps.LatLng(36.32954669095672, 127.41273596379675),
            new naver.maps.LatLng(36.32960217313717, 127.4128589436154),
            new naver.maps.LatLng(36.331682726425804, 127.4129278122977),
            new naver.maps.LatLng(36.33179765061316, 127.41088634726863),
            new naver.maps.LatLng(36.333830591710324, 127.41259822636265)
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
            paths: [samsungAPT, miruAPT, centralXiAPT, hanbatXiAPT,sunwhaHyeondaeAPT,daeheongHyeondaeAPT, theShopAPT],
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
              content: "<img src='img/pin4.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },
          }
        
        var marker1 = new naver.maps.Marker(markerOption1);
        
        
        var markerOption2 = {
            map: map,
            position: new naver.maps.LatLng(36.32214160019321, 127.41202950748722),
            icon: {
              content: "<img src='img/pin4.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },
          }
        
        var marker2 = new naver.maps.Marker(markerOption2);
        
        var markerOption3 = {
            map: map,
            position: new naver.maps.LatLng(36.324778856980835, 127.41969293719585),
            icon: {
              content: "<img src='img/pin4.png' class = 'pin'>",
              anchor: new naver.maps.Point(15, 30),
            },
          }
        
        var marker3 = new naver.maps.Marker(markerOption3);
        
        
        
        var marker4 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.32681744540576, 127.41184899217201),
        map: map
        });
        
        var marker5 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.3316003310822, 127.43356337490906),
        map: map
        });
        
        var marker6 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.32902286253786, 127.42535708396257),
        map: map
        });
        
        var marker7 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.32797532866398, 127.42631036172708),
        map: map
        });
        
        var marker8 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.32268476176774, 127.42316431981536),
        map: map
        });
        
        var marker9 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.31918738050652, 127.42141766619166),
        map: map
        });
        
        var marker10 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.32671786041655, 127.42910668774793),
        map: map
        });
        
        var marker11 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.33062294327649, 127.43292468092797),
        map: map
        });
        
        var marker12 = new naver.maps.Marker({
        position: new naver.maps.LatLng(36.32177670413975, 127.41337669401027),
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
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp"%>
<!-- header end-->
<main>
	<section class="start-section-top">
		<div class="start-main-content">
			<% KickboardDao KickboardDao = new KickboardDao();
			        RentDao RentDao = new RentDao();
			        MemberDao MemberDao = new MemberDao();
			        String memberNo = RentDao.getMemberNo(sessionEmail);
			        MemberDto memberDto = RentDao.getUser(memberNo);%>
			<% if (!sessionEmail.equals("")) {
			%>

			<div id="map">
				<div class="lds-ellipsis">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<!-- 	<div class="map-infoPanel">

					<div class="map-infoPanel-rent">
						<p class="map-infoPanel-rent-text">
							<i class="em em-avocado" aria-role="presentation"
								aria-label="AVOCADO"></i>&nbsp;기기 번호 : AVOCADO1684
						</p>
						<p class="map-infoPanel-rent-text">
							<i class="em em-herb" aria-role="presentation" aria-label="HERB"></i>&nbsp;기기
							종류 : 나노휠 프리미엄
						</p>
						<p class="map-infoPanel-rent-text">
							<i class="em em-battery" aria-role="presentation"
								aria-label="BATTERY"></i>&nbsp;배터리 : 85%
						</p>
						<div class="map-infoPanel-rent-cost">
							<div class="map-infoPanel-rent-cost-firstCost">
								<i class="em em-moneybag" aria-role="presentation"
									aria-label="MONEY BAG"></i>&nbsp;기본 10분 <span
									class="map-infoPanel-rent-cost-text">1,000원</span>
							</div>
							<div class="map-infoPanel-rent-cost-usetCost">
								<i class="em em-heavy_plus_sign" aria-role="presentation"
									aria-label="HEAVY PLUS SIGN"></i>&nbsp;추가 1분당 <span
									class="map-infoPanel-rent-cost-text">100원</span>
							</div>
						</div>
						<button class="map-infoPanel-rent-button">
							<i class="em em-rocket" aria-role="presentation"
								aria-label="ROCKET"></i>대여하기
						</button>
					</div>

					<div class="map-infoPanel-using">
						<p class="map-infoPanel-using-text">
							<i class="em em-avocado" aria-role="presentation"
								aria-label="AVOCADO"></i>&nbsp;곽두팔님 안전 주행하세요 :)
						</p>
						<p class="map-infoPanel-using-text">
							<i class="em em-first_place_medal" aria-role="presentation"
								aria-label="FIRST PLACE MEDAL"></i>&nbsp;등급 : 골드
						</p>
						<p class="map-infoPanel-using-text">
							<i class="em em-clock7" aria-role="presentation"
								aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;현재 이용 시간 : 12분
						</p>
						<p class="map-infoPanel-using-text">
							<i class="em em-moneybag" aria-role="presentation"
								aria-label="MONEY BAG"></i>&nbsp;현재 이용 요금 : 8,400원
						</p>
						<button class="map-infoPanel-using-button">
							<i class="em em-arrow_right_hook" aria-role="presentation"
								aria-label="RIGHTWARDS ARROW WITH HOOK"></i>반납하기
						</button>
					</div>
					<div class="map-infoPanel-used">
						<p class="map-infoPanel-used-text">
							<i class="em em-avocado" aria-role="presentation"
								aria-label="AVOCADO"></i>&nbsp;곽두팔님 이용해주셔서 감사합니다 :)
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-first_place_medal" aria-role="presentation"
								aria-label="FIRST PLACE MEDAL"></i>&nbsp;등급 : 골드
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-clock7" aria-role="presentation"
								aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;총 이용 시간 : 27분
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-moneybag" aria-role="presentation"
								aria-label="MONEY BAG"></i>&nbsp;총 이용 요금 : 12,400원
						</p>
						<button class="map-infoPanel-used-button">
							<i class="em em-white_check_mark" aria-role="presentation"
								aria-label="WHITE HEAVY CHECK MARK"></i>창닫기
						</button>
					</div>
				</div> -->
				<!-- The Modal -->


				<%
					
			        
			        if (request.getParameter("t_rent_no") != null) {
			          
			        String resultRentNo = request.getParameter("t_rent_no"); 
					RentDto resultDto = RentDao.getRentResult(resultRentNo);
					
					int usedDate = resultDto.getRent_useddate();
					String usedDateStr = (usedDate/60) + "분 " + (usedDate % 60) + "초";
					%>
				<div id="myModal" class="modal">

					<!-- Modal content -->
					<div class="map-infoPanel-used">
						<p class="map-infoPanel-used-text">
							<i class="em em-avocado" aria-role="presentation"
								aria-label="AVOCADO"></i>&nbsp;<%=memberDto.getMember_name() %>님
							이용해주셔서 감사합니다 :)
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-medal" aria-role="presentation" aria-label=""></i>&nbsp;등급
							:
							<%=memberDto.getMember_rank()%>
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-clock7" aria-role="presentation"
								aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;총 이용 시간 :
							<%=usedDateStr%>
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-moneybag" aria-role="presentation"
								aria-label="MONEY BAG"></i>&nbsp;총 이용 요금 :
							<%=resultDto.getRent_cost()%>원
						</p>
						<button class="map-infoPanel-used-button" onClick="closeResult()">
							<i class="em em-white_check_mark" aria-role="presentation"
								aria-label="WHITE HEAVY CHECK MARK"></i>창닫기
						</button>
					</div>

				</div>
				<!--End Modal-->


				<script type="text/javascript">
				    	var resultRentNo = "<%=request.getParameter("t_rent_no") %>";
				    	
				        jQuery(document).ready(function() {
				        	if(resultRentNo != null) {
				        		$('#myModal').show();
				        	} else {
				        		$('#myModal').hide();
				        	}
				        });
				      	//팝업 Open 기능
				        function openResult(flag) {
				             $('#myModal').show();
				        };
				        //팝업 Close 기능
				        function closeResult(flag) {
				             $('#myModal').hide();
				        };
				        
				      </script>

			</div>
			<% }} else {%>
			<h1>401 ERROR</h1>
			<h1>로그인이 필요한 페이지입니다.</h1>
			<% }%>
		</div>
	</section>
	<script>
        
        var mapOptions = {//지도 초기화면 값
            center: new naver.maps.LatLng(36.32862698995557, 127.42592490508953),//지도의 초기 중심 좌표
            zoom: 16, //지도 초기 줌 레벨
            mapTypeId: "normal", //지도 종류
            minZoom: 12, //지도의 최소 줌 레벨
            zoomControl: true, //줌 컨트롤의 표시 여부
            //줌 컨트롤의 옵션
            zoomControlOptions: {       
              position: naver.maps.Position.TOP_RIGHT,
              style: naver.maps.ZoomControlStyle.Large,
            },
            logoControl: false, //로고 컨트롤
            mapDataControl: false, //
            mapTypeControl: true, //일반 위성 컨트롤
            //maxBounds: daejeon,//지도 제한
        };

        var map = new naver.maps.Map('map', mapOptions);
        
        
        //서비스 구역
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
        

        var serviceArea = new naver.maps.Polygon({  
            map: map,
            paths: [outerPolygon, innerPolygon],
            fillColor: '#558203',
            fillOpacity: 0.2,
            strokeColor: '#558203',
            strokeOpacity: 0.6,
            strokeWeight: 2
        });
        
        //banArea좌표 가져오기
<%--         <% BanAreaDao banAreaDao = new BanAreaDao();
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
        ]; --%>
        
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
       
       var daeheongHyeondae2APT = [  
      	 	new naver.maps.LatLng(36.31864425529103, 127.4256256176393),
			new naver.maps.LatLng(36.318314395519465, 127.42571715546826),
			new naver.maps.LatLng(36.31824400946458, 127.42585870696108),
			new naver.maps.LatLng(36.31837800141418, 127.42600354624392),
			new naver.maps.LatLng(36.318339100549316, 127.42626640272019),
			new naver.maps.LatLng(36.31832829475008, 127.42640051316725),
			new naver.maps.LatLng(36.318319824331965, 127.42664495517359),
			new naver.maps.LatLng(36.318288983520354, 127.42693521805168),
			new naver.maps.LatLng(36.318576830624146, 127.42768479802741),
			new naver.maps.LatLng(36.3191191111165, 127.42730203379082),
			new naver.maps.LatLng(36.31924504301794, 127.42704685762178),
			new naver.maps.LatLng(36.31864622218181, 127.42562106082723)
	       ];
       
       var hanoulAPT = [  
      	 	new naver.maps.LatLng(36.324026499385354, 127.43458819202093),
			new naver.maps.LatLng(36.32360781004883, 127.43492578826826),
			new naver.maps.LatLng(36.32388286169126, 127.43572615689958),
			new naver.maps.LatLng(36.32431377397926, 127.43549856392384)
       ];
        
        
        var banArea = new naver.maps.Polygon({  
            map: map,
            paths: [samsungAPT, miruAPT, centralXiAPT, hanbatXiAPT,sunwhaHyeondaeAPT,daeheongHyeondaeAPT, theShopAPT, daeheongHyeondae2APT, hanoulAPT],
            fillColor: '#ff0000',
            fillOpacity: 0.1,
            strokeColor: '#ff0000',
            strokeOpacity: 0.6,
            strokeWeight: 1
        });

        
        
        var kickboardMarkerList = [];
        var infowindowList = [];
        
        <% 
        
      	ArrayList<KickboardDto> KickboardValueArray = KickboardDao.getKickboardValue(); 
      	
      	
      	for (int i = 0; i < KickboardValueArray.size(); i++) {
      	String nowUsingMember = RentDao.getUsingServiceWho(KickboardValueArray.get(i).getKickboard_no());
      	int rentStats = RentDao.getUsingServiceStats(memberNo);
      	%>
      	
      	var visible = false;
      	<%-- 
      	<%	if (KickboardValueArray.get(i).getKickboard_rentstats() == 1 && rentStats == 0){%>
	    		visible = true,
	    <%	} else if (KickboardValueArray.get(i).getKickboard_rentstats() != 0) {%>
	    		visible = false,
	     <% } else if (rentStats == -1) {%>
	     		visible = true,
	     <% } else {%>
	     		visible = false,
	     <% }%>
	      --%>
	      <%
	      if (KickboardValueArray.get(i).getKickboard_rentstats() == 1 && rentStats == 1 && nowUsingMember.equals(memberNo)){%>
	  			visible = true,
	  	<%}else if (rentStats != 1) {%>
	      		visible = true,
	     <%}%>
	      
	      	 //킥보드 마커
	        kickboardMarkerOptionList = { 
	        	visible: visible,
		      	map: map,
	            position: <%=KickboardValueArray.get(i).getKickboard_location()%>,
	            icon: {
		              //content: "<div class='pin' ></div>",
		              content: "<img src='img/pinimg.png' class = 'pin'>",
		              anchor: new naver.maps.Point(15, 30),
		            },      
	      	 }
		      	
	        
	      	
	      	kickboardMarker = new naver.maps.Marker(kickboardMarkerOptionList);
	      	 

      	
       
        //좌클릭 정보창 이벤트
        
        var content = [
        	'<form name = serviceStart>',
        	'<input type="hidden" name="t_sessionEmail" value="<%=sessionEmail %>"/>',
        	'<input type="hidden" name="t_kickboardNo" value="<%=KickboardValueArray.get(i).getKickboard_no()%>"/>',
            '<div class="map-infoPanel-rent">',
            '<p class="map-infoPanel-rent-text"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO"></i>&nbsp;기기 번호 : <%=KickboardValueArray.get(i).getKickboard_no()%></p>',
            '<p class="map-infoPanel-rent-text"><i class="em em-herb" aria-role="presentation" aria-label="HERB"></i>&nbsp;기기 종류 : <%=KickboardValueArray.get(i).getKickboard_type()%></p>',
            '<p class="map-infoPanel-rent-text"><i class="em em-battery" aria-role="presentation" aria-label="BATTERY"></i>&nbsp;배터리 : <%=KickboardValueArray.get(i).getKickboard_battery()%>%</p>',
            '<div class="map-infoPanel-rent-cost">',
              '  <div class="map-infoPanel-rent-cost-firstCost"><i class="em em-moneybag" aria-role="presentation" aria-label="MONEY BAG"></i>&nbsp;기본 요금 &nbsp;<span class="map-infoPanel-rent-cost-text">1,000원</span></div>',
                '<div class="map-infoPanel-rent-cost-usetCost"><i class="em em-heavy_plus_sign" aria-role="presentation" aria-label="HEAVY PLUS SIGN"></i>&nbsp;1분마다 &nbsp;<span class="map-infoPanel-rent-cost-text">100원</span></div>',
            '</div>',
            '<button class="map-infoPanel-rent-button" onClick="goServiceStart()"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>대여하기</button>',
        '</div>',
        '<form>'
        ].join('');
        
        <% if (KickboardValueArray.get(i).getKickboard_rentstats() != 0) { %>
        	var content = "다른 사람이 이용 중입니다."
        <% } %>
        
        
      //현재 대여중 일 때
			<% if (KickboardValueArray.get(i).getKickboard_rentstats() == 1 && RentDao.getUsingServiceStats(memberNo) == 1) {%>
            var content = [
            '<form name = serviceEnd>',
            '<input type="hidden" name="t_kickboardNo" value="<%=KickboardValueArray.get(i).getKickboard_no()%>"/>',
            	'<div class="map-infoPanel-using">',
                '<p class="map-infoPanel-using-text"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO"></i>&nbsp;<%=memberDto.getMember_name()%>님 안전한 주행하세요 :) </p>',
                '<p class="map-infoPanel-using-text">',
                '<i class="em em-medal" aria-role="presentation" aria-label=""></i>',
                '&nbsp;등급 : <%=memberDto.getMember_rank()%></p>',
                '<p class="map-infoPanel-using-text"><i class="em em-clock7" aria-role="presentation" aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;현재 이용 시간 :&nbsp;<span id="timeArea"> 0분 0초</span></p>',
                '<p class="map-infoPanel-using-text"><i class="em em-moneybag" aria-role="presentation" aria-label="MONEY BAG"></i>&nbsp;현재 이용 요금 :&nbsp;<span id="cost"> 1,000 </span>원</p>',
                '<button class="map-infoPanel-using-button" onClick="goServiceEnd()"><i class="em em-arrow_right_hook" aria-role="presentation" aria-label="RIGHTWARDS ARROW WITH HOOK"></i>반납하기</button>',
            '</div>',
            '<form>'
            ].join('');
            

            var startTime  = "<%=RentDao.getUsingTimes(RentDao.getRentNo(KickboardValueArray.get(i).getKickboard_no()))%>";	// 최초 설정 시간(기본 : 초)
   		 // 시작일시
   		   var startDate = new Date(parseInt(startTime.substring(0,4), 10),
   		             parseInt(startTime.substring(4,6), 10)-1,
   		             parseInt(startTime.substring(6,8), 10),
   		             parseInt(startTime.substring(8,10), 10),
   		             parseInt(startTime.substring(10,12), 10),
   		             parseInt(startTime.substring(12,14), 10)
   		            );
   		           
   		   // 종료일시
   		   var now = new Date();
   		   var endDate = new Date(parseInt(now.getFullYear().toString()),
   					parseInt(now.getMonth().toString(), 10),
   					parseInt(now.getDate().toString(), 10),
						parseInt(now.getHours().toString(), 10), 
						parseInt(now.getMinutes().toString(), 10), 
						parseInt(now.getSeconds().toString()), 10);
   		   // 두 일자(startTime, endTime) 사이의 차이를 구한다.
   		   var dateGap = endDate.getTime() - startDate.getTime();
   		   var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - startDate); 
   		   
   		   // 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
   		   var diffDay  = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수       
   		   var diffHour = timeGap.getHours();       // 시간
   		   var diffMin  = timeGap.getMinutes();      // 분
   		   var diffSec  = timeGap.getSeconds();      // 초
   		   var changeTimeToSec = Math.floor(dateGap / (1000)); //모든 시간 초 로 변환
   		   
   		   
   		   function msg_time() {	// 1초씩 카운트
   			var msg = Math.floor(changeTimeToSec / 60) + "분 " + (changeTimeToSec % 60) + "초";	// 남은 시간 계산
   			
   			var cost = 1000; //기본요금
   			cost += Math.floor(changeTimeToSec / 60)*100; //1분마다 100원씩 증가
   			
   			document.getElementById("timeArea").innerHTML = msg;		// span 영역에 보여줌 
   			document.getElementById("cost").innerHTML = cost;
   			changeTimeToSec++;					// 1초씩 증가
   		}
   		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
        		
            <%} //else {%>
            	//var content = "이미 이용 중인 킥보드가 있습니다."
            <%//}%>
            
            
            
   		
   		
        //시작 전 정보 박스
        var infowindow = new naver.maps.InfoWindow({
            content: content,
            borderWidth: 3,
            borderColor: "#558203",
            anchorSize: new naver.maps.Size(10, 10),
            anchorSkew: false,
            pixelOffset: new naver.maps.Point(10, -5)
        });
        
        kickboardMarkerList.push(kickboardMarker);
        infowindowList.push(infowindow);
        
        
        <%}%>
        
      	
        for (var i = 0, ii = kickboardMarkerList.length; i < ii; i++) {
            naver.maps.Event.addListener(map, "click", ClickMap(i));
            naver.maps.Event.addListener(kickboardMarkerList[i], "click", getClickHandler(i));
          }
        
        //지도 클릭할 때 정보창 사라지기
        function ClickMap(i) {
          return function () {
            var infowindow = infowindowList[i];
            infowindow.close();
          };
        }
        
        
      //마커 클릭할때
        function getClickHandler(i) {
          return function () {
            var kickboardMarker = kickboardMarkerList[i];
            var infowindow = infowindowList[i];
            if (infowindow.getMap()) {
              infowindow.close();
            } else {
              infowindow.open(map, kickboardMarker);
            }
          };
        }
        


  		//대여하기 눌렀을 때
  		function goServiceStart() {
  			serviceStart.action = "/service/DBServiceStart.jsp";
  			serviceStart.method = "post";
  			serviceStart.submit();
		}
  		//반납하기 눌렀을 때
  		function goServiceEnd() {
  			serviceEnd.action = "/service/DBServiceEnd.jsp";
  			serviceEnd.method = "post";
  			serviceEnd.submit();
		}
  		
  		
  		
        
		//우클릭 이벤트
		/*
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
        */

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
<%@ include file="/common/footer.jsp"%>
<!-- footer end-->
</body>

</html>
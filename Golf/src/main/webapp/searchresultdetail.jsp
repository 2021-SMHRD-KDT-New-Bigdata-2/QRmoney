<%@page import="java.util.ArrayList"%>
<%@page import="com.model.GameDAO"%>
<%@page import="com.model.GroupDAO"%>
<%@page import="com.model.GameVO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>single advisor profile - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae9179ab2df613f93734a86b287b83c5&libraries=services"></script>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

</head>

<body>
	<% 
	int id = Integer.parseInt(request.getParameter("id")); 
	ArrayList<GameVO> gameList = (ArrayList<GameVO>)session.getAttribute("searchResult");
	
	
	GameDAO gamedao = new GameDAO();
	GroupDAO groupdao = new GroupDAO();
    GameVO gamevo = new GameVO();
    gamevo = gameList.get(id);
    ArrayList<MemberVO> members = new ArrayList<MemberVO>();
    members = groupdao.getGroupMemberVO(gamevo.getGame_id());
    
	%>
    
    <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-sm-8 col-lg-6">
            <!-- Section Heading-->
            <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
              <h3> <%= gamevo.getGame_name() %> <span> <%= gamevo.getGame_type() %> </span></h3>
              <p> <%= gamevo.getGame_date() %> <%= gamevo.getLocation_name() %> &amp; <%= groupdao.getGroupMemberCnt(gamevo.getGame_id()) %>/<%= gamevo.getTotal_member() %> �� </p>
              <div class="line"></div>
            </div>
          </div>
        </div>
        <div class="row">
          <!-- �׷� ��� ���� -->
          <% for(MemberVO vo : members) {%>
          <div class="col-12 col-sm-6 col-lg-3">
            <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
              <!-- Team Thumb-->
              <div class="advisor_thumb"><img class="img-auto" src="assets/profile_pic/<%= vo.getProfilePic() %>" alt="assets/profile_pic/default.jpg">
                <!-- Social Info-->
                <div class="social-info"><a href="#"><i class="fa fa-instagram"></i></a></div>
              </div>
              <!-- Team Details-->
              <div class="single_advisor_details_info">
                <h6> <%= vo.getNickname() %> </h6>
                <p class="designation"> <%= vo.getAddress() %> &amp; <%= vo.getAge() %> </p>
              </div>
            </div>
          </div>
          <% } %>
        </div>
      </div>



      <div class="row justify-content-center">
        <div class="line">
        <%= gamevo.getLocation_address() %> 
        
        <div id="map" style="width:900px;height:700px;"></div>
        </div>
      </div>
      
      
      <script>
      // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
      var infowindow = new kakao.maps.InfoWindow({zIndex:1});
      
      var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
          mapOption = {
              center: new kakao.maps.LatLng(36.2, 127.9786567), // ������ �߽���ǥ
              level: 12 // ������ Ȯ�� ����
          };  
      
      // �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
      var geocoder = new kakao.maps.services.Geocoder();


      
      // ������ �����մϴ�    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // ��� �˻� ��ü�� �����մϴ�
      var ps = new kakao.maps.services.Places(); 
      
      // Ű����� ��Ҹ� �˻��մϴ�
      ps.keywordSearch('���� ���׸���', placesSearchCB); 
      
      // ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
      searchAddrFromCoords(map.getCenter(), displayCenterInfo);


      // Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
      function placesSearchCB (data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {
      
              // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
              // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
              var bounds = new kakao.maps.LatLngBounds();
      
              for (var i=0; i<data.length; i++) {
                  displayMarker(data[i]);    
                  bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
              }       
      
              // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
              map.setBounds(bounds);
              map.setLevel(6);
          }
          
      }

      
      // ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
      function displayMarker(place) {
          
          // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
          var marker = new kakao.maps.Marker({
              map: map,
              position: new kakao.maps.LatLng(place.y, place.x) 
          });
      
          // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
          kakao.maps.event.addListener(marker, 'click', function() {
              // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
              infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
              infowindow.open(map, marker);
          });
      }

      function searchAddrFromCoords(coords, callback) {
      // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
      geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
      }

      function searchDetailAddrFromCoords(coords, callback) {
      // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
      geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
      }

      // ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
      function displayCenterInfo(result, status) {
          if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

          for(var i = 0; i < result.length; i++) {
            // �������� region_type ���� 'H' �̹Ƿ�
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
          }
          }    
      }



        </script>


<style type="text/css">
body{margin-top:20px;
background:#eee;
}
.single_advisor_profile {
    position: relative;
    margin-bottom: 50px;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    z-index: 1;
    border-radius: 15px;
    -webkit-box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
    box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
}
.single_advisor_profile .advisor_thumb {
    position: relative;
    z-index: 1;
    border-radius: 15px 15px 0 0;
    margin: 0 auto;
    padding: 1px 1px 0 1px;
    background-color: #ffffff;
    overflow: hidden;
}
.single_advisor_profile .advisor_thumb::after {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: absolute;
    width: 150%;
    height: 80px;
    bottom: -45px;
    left: -25%;
    content: "";
    background-color: #ffffff;
    -webkit-transform: rotate(-15deg);
    transform: rotate(-15deg);
}
@media only screen and (max-width: 575px) {
    .single_advisor_profile .advisor_thumb::after {
        height: 160px;
        bottom: -90px;
    }
}
.single_advisor_profile .advisor_thumb .social-info {
    position: absolute;
    z-index: 1;
    width: 100%;
    bottom: 0;
    right: 30px;
    text-align: right;
}
.single_advisor_profile .advisor_thumb .social-info a {
    font-size: 14px;
    color: #020710;
    padding: 0 5px;
}
.single_advisor_profile .advisor_thumb .social-info a:hover,
.single_advisor_profile .advisor_thumb .social-info a:focus {
    color: #3f43fd;
}
.single_advisor_profile .advisor_thumb .social-info a:last-child {
    padding-right: 0;
}
.single_advisor_profile .single_advisor_details_info {
    position: relative;
    z-index: 1;
    padding: 30px;
    text-align: right;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    border-radius: 0 0 15px 15px;
    background-color: #ffffff;
}
.single_advisor_profile .single_advisor_details_info::after {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: absolute;
    z-index: 1;
    width: 50px;
    height: 3px;
    background-color: #3f43fd;
    content: "";
    top: 12px;
    right: 30px;
}
.single_advisor_profile .single_advisor_details_info h6 {
    margin-bottom: 0.25rem;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
    .single_advisor_profile .single_advisor_details_info h6 {
        font-size: 14px;
    }
}
.single_advisor_profile .single_advisor_details_info p {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    margin-bottom: 0;
    font-size: 14px;
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
    .single_advisor_profile .single_advisor_details_info p {
        font-size: 12px;
    }
}
.single_advisor_profile:hover .advisor_thumb::after,
.single_advisor_profile:focus .advisor_thumb::after {
    background-color: #070a57;
}
.single_advisor_profile:hover .advisor_thumb .social-info a,
.single_advisor_profile:focus .advisor_thumb .social-info a {
    color: #ffffff;
}
.single_advisor_profile:hover .advisor_thumb .social-info a:hover,
.single_advisor_profile:hover .advisor_thumb .social-info a:focus,
.single_advisor_profile:focus .advisor_thumb .social-info a:hover,
.single_advisor_profile:focus .advisor_thumb .social-info a:focus {
    color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info,
.single_advisor_profile:focus .single_advisor_details_info {
    background-color: #070a57;
}
.single_advisor_profile:hover .single_advisor_details_info::after,
.single_advisor_profile:focus .single_advisor_details_info::after {
    background-color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info h6,
.single_advisor_profile:focus .single_advisor_details_info h6 {
    color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info p,
.single_advisor_profile:focus .single_advisor_details_info p {
    color: #ffffff;
}

.img-auto {
	width: 300px;
	height: 500px;
	object-fit: cover;
	object-position: 50% 50%; 
}

</style>




</body>
</html>
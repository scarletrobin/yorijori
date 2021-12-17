<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 - 우승자발표</title>
<link rel="stylesheet" href="resources/css/mainpage/common.css">
<link rel="stylesheet" href="resources/css/recipecontest/ContestList.css">
<!-- 페이지 전용 CSS -->
<link rel="stylesheet" href="resources/css/recipecontest/ContestResult.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="resources/summernote/jquery-3.3.1.js"></script>
<main id="main">
		<div class="christmas-lights">
	      		<ul class="lightrope">
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				  <li></li>
				 </ul>
	    </div>
		<div class="contest-result-banner">
	      	<div class="contest-banner-content-r">
	      		<h2 style="color: #FFF;"><span class="thisyr" style="color:rgb(255, 84, 67);"></span>년 <span class="thismonth" style="color:rgb(255, 84, 67);"></span>월</h2>
	      		<h2 style="color: #FFF;">레시피경연대회 우승자 발표</h2><br>
	      		<h5><span style="color:black;font-weight: bolder;">발표일: 매월</span> 20일</h5>
	      		<h5 style="color:#FFF;">우승을 진심으로 축하드립니다.</h5>
	      	</div>
	      	<div class="contest-info">
	      		<a href="/contestWinner.do">
	      			<button class="btn-main btn-announce">역대 우승자 명단</button>
	      		</a>
	      	</div>
	    </div>
      <div class="container">
      	<div class="contest-result">
      		<div class="trophy row">
      			<ul>
      				<li>
	      				<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
						<lord-icon
						    src="https://cdn.lordicon.com/lupuorrc.json"
						    trigger="loop"
						    colors="primary:#121331,secondary:#a39cf4"
						    style="width:100px;height:100px;">
						</lord-icon>
							<h3>1등</h3>
					</li>
      				<li>
      					<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
						<lord-icon
						    src="https://cdn.lordicon.com/rcopausw.json"
						    trigger="loop"
						    colors="primary:#121331,secondary:#e5d1fa"
						    style="width:100px;height:100px;">
						</lord-icon>
      					<h3>2등</h3>
      				</li>
      				<li>
      					<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
						<lord-icon
						    src="https://cdn.lordicon.com/kdruzgxz.json"
						    trigger="loop"
						    colors="primary:#121331,secondary:#e5d1fa"
						    style="width:100px;height:100px">
						</lord-icon>
      					<h3>3등</h3>
      				</li>
      				<li>
      					<script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
						<lord-icon
						    src="https://cdn.lordicon.com/qjvxqdov.json"
						    trigger="loop"
						    colors="primary:#eeca66,secondary:#a39cf4"
						    style="width:100px;height:100px">
						</lord-icon>
      					<h3>참가상</h3>
      				</li>
      			</ul>
      		</div>
      	</div>
      	<div class="row">
      		<div class="winners-profile col-sm-9">
      			<ul>
      				<li>
      					<a href="#">
      						<div><img src="#" style="width:250px;height:200px;"></div>
      						<div><h4>레시피 제목</h4></div>
      					</a>
      					<a href="#">
      						<div><img src="#" style="width: 100px;height:100px;"></div>
      						<div><h4>아이디</h4></div>
      					</a>
      					<div class="total-vote"><h5>110 </h5><img src="resources/img/recipecontest/vote-before.png" style="width:30px;height:30px;"></div>
      				</li>
      				<li>
      					<a href="#">
      						<div><img src="#" style="width:250px;height:200px;"></div>
      						<div><h4>레시피 제목</h4></div>
      					</a>
      					<a href="#">
      						<div><img src="#" style="width: 100px;height:100px;"></div>
      						<div><h4>아이디</h4></div>
      					</a>
      					<div class="total-vote">
      						<h5>110</h5>
      						<img src="resources/img/recipecontest/vote-before.png" style="width:30px;height:30px;">
      					</div>
      				</li>
      				<li>
      					<a href="#">
      						<div><img src="#" style="width:250px;height:200px;"></div>
      						<div><h4>레시피 제목</h4></div>
      					</a>
      					<a href="#">
      						<div><img src="#" style="width: 100px;height:100px;"></div>
      						<div><h4>아이디</h4></div>
      					</a>
      					<div class="total-vote"><h5>110</h5><img src="resources/img/recipecontest/vote-before.png" style="width:30px;height:30px;"></div>
      				</li>
      			</ul>
      		</div>
      		<div class="special-winners col-sm-3">
      			<ul class="winners">
				  <li>Branding</li>
				  <li>Identity Design</li>
				  <li>Web Development</li>
				  <li>Social Media Setup</li>
				  <li>Email Marketing</li>
				  <li>Brochure Development</li>
				  <li>Logo Design</li>
				</ul>
      		</div>
      	</div>
      	<div class="prize-tower row">
      			<ul>
      				<li><h4><span class="points">20</span>만 포인트 지급<br>+<br>밀키트 상품<br>제작 및 판매 지원</h4></li>
      				<li><h4><span class="points">20</span>만 포인트 지급</h4></li>
      				<li><h4><span class="points">10</span>만 포인트 지급</h4></li>
      				<li><img src="https://img.icons8.com/external-icongeek26-outline-gradient-icongeek26/64/000000/external-gift-essentials-icongeek26-outline-gradient-icongeek26.png"/><h4>투표수 <span class="points">30</span> 이상 <br>전원<br> <span class="points">1</span>만 포인트 지급</h4></li>
      			</ul>
      	</div>
      </div>	
  </main><!-- End #main -->
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script>
  	var x = 0,
    container = $('.winners'),
    items = container.find('li'),
    containerHeight = 0,
    numberVisible = 5,
    intervalSec = 2000;
  	
  	//세로로 움직이는 사이클
	function vertCycle() {
	  	  var firstItem = container.find('li.first').html();
	  	    
	  	  container.append('<li>'+firstItem+'</li>');
	  	  firstItem = '';
	  	  container.find('li.first').animate({ marginTop: "-50px" }, 600, function(){  $(this).remove(); container.find('li:first').addClass("first"); });
	  	}
	
	
	
  	$(function(){

  	if(!container.find('li:first').hasClass("first")){
  	  container.find('li:first').addClass("first");
  	}

  	items.each(function(){
  	  if(x < numberVisible){
  	    containerHeight = containerHeight + $(this).outerHeight();
  	    x++;
  	  }
  	});

  	container.css({ height: containerHeight, overflow: "hidden" });

  	if(intervalSec < 700){
  	  intervalSec = 700;
  	}

  	var init = setInterval("vertCycle();",intervalSec);

  	container.hover(function(){
  	  clearInterval(init);
  	}, function(){
  	  init = setInterval("vertCycle();",intervalSec);
  	});
  		
  		
  		//현재 날짜 가져오기 (년/월)
  		var today = new Date();
  		var year = today.getFullYear();
  		var month = today.getMonth()+1;
  		var voted = false; //투표여부 확인
  		$(".thisyr").html(year);
  		$(".thismonth").html(month);
  		//정렬 default
  		var orderIndex = $("#orderIndex").val();
  		$(".order-by").eq(orderIndex).addClass("active");
  		
  		//정렬기준
  		$(".order-by").on("click", function(){
  			var index = $(".order-by").index(this);
  			var reqPage = 1;
  			var body = $(".contest-content").children("ul");
  			var totalCount = $("#totalCount");
  			console.log(index);
  			location.href="contestList.do?reqPage="+reqPage+"&orderIndex="+index;
  		});
  		
  		//접속자 투표여부 확인
  		var memberNo = $(".memberNo").val();
  		if(memberNo != null){
  	 		$.ajax({
				url: "/voteCheck.do",
				type: "get",
				data: {memberNo:memberNo},
				success: function(data){
					if(data > 0){
						var contestNo = data;
						var vote = $('.contestNo[value='+contestNo+']').parent('div');
						console.log(vote);
						console.log(img);
						var img = vote.children('img');
						var label = vote.children("label[for='vote']");
						img.attr("src", "");
						img.attr("src", "resources/img/recipecontest/vote-after.png");
						label.html("");
						label.html("투표완료");
						label.css("color", "#8E44AD").css("font-weight", "bolder");
						voted= true;
				}
				}
		
  			});
  		}
  		
  		
  		//투표 or 투표 취소
  		$(".vote").on("click", function(){
  			var voteRecipe_ans = confirm("투표하시겠습니까?");
  			var memberNo = $(".memberNo").val();
  			var contestNo = $(this).children(".contestNo").val();
  			console.log(contestNo);
  			if(voteRecipe_ans == true){
  				if (voted == false){
  					location.href="/insertVote.do?contestNo="+contestNo+"&memberNo="+memberNo;
  					voted = true;
  				} else {
  					alert("이미 투표하셨습니다.");
  				}
  			}else {
  				return false;
  			}
  		});
  		
  		});
  		
  	//게시글 삭제 확인
  	function delCheck(){
  		var delNotice_ans = confirm("게시글을 삭제하시겠습니까?");
  		var noticeNo = $("#noticeNo").val();
  		if(delNotice_ans == true){
			location.href="/deleteNotice.do?noticeNo="+noticeNo;
		} else {
			return false;
		}
  	}
  </script>
</body>
</html>
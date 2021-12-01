<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.allmember{
text-align: center;}
.pagenation *{
text-align: center;
margin:0 auto;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/sidenavi.jsp" />
    <div class="container">
        <h2>전체 회원 조회</h2>
    
    
    <div style="background-color: #F7F7E5; ">
        <div style="padding: 15px;">
            
        <label>회원검색</label>
        <select name="" id="">
            <option value="1">아이디</option>
            <option value="2">닉네임</option>
            <option value="3">전화번호</option>
            
        </select>
        <input type="text" >
        <button>검색</button>
        <button class="detailbtn">상세검색</button>
        </div>
		
        <div class="detail" style="padding: 15px; display: none;">

            <input type="radio" value="1" id="postspace" name="searchdetail"><label for="postspace">게시글 수</label>
            <input type="radio" value="2" id="receipespace" name="searchdetail"><label for="postspace">레시피 수</label>
            <input type="radio" value="3" id="commentspace" name="searchdetail"><label for="commentspace">댓글 수</label>
            <input type="radio" value="4" id="visitspace" name="searchdetail"><label for="visitspace">방문 수</label>
            <input type="radio" value="5" id="signdate" name="searchdetail"><label for="signdate">가입일</label>
            <hr>
            <div class="detail1">
            <select class="period">
                <option value="1">전체기간</option>
                <option value="2">최근 1개월</option>
            </select>
            <span id="recentonemonth"></span>
            <span>동안</span>
            <span id="space">게시글 수</span>
            <input type="text" placeholder="0" style="width: 70px;">
            <span>개</span>
            <select>
                <option value="1">이상</option>
                <option value="2">이하</option>
                
            </select>
            <span>인 회원</span>
            <button>검색</button>
            </div>
            <div class="detail2" style="display:none;">
            <input type="date"> 부터
            <input type="date"> 까지
            가입한 회원
            <button>검색</button>
            </div>
                
            


        </div>
        </div>
        
    
    <span>전체 회원 수</span> <span>${list.size() }</span>
    <hr>
    
   	<div>
   	
    <div style="float: left;">
        <span>선택 회원을</span>
        <button>블랙리스트 추가</button>
        <button>강제 탈퇴</button>
        <button>쪽지</button>
    </div>
    
    <div style="float: right;">
    <select>
        <option value="0">전체회원</option>
        <option value="1">요리꾼</option>
        <option value="2">조리꾼</option>
    </select>
    <select>
        <option value="0">30명 정렬</option>
        <option value="1">50명 정렬</option>
        <option value="2">100명 정렬</option>
    </select>
    
    </div>
    
    </div>
    <br><br>
    
    <div style="">
    <table class="table table-hover allmember">
    <tr>
    <th><input type="checkbox"></th>
    <th style="width: 300px;">별명(아이디)</th>
    <th>상세보기</th>
    <th>구분(요리꾼/조리꾼)</th>
    <th>가입일</th>
    <th>레시피 수</th>
    <th>게시글 수</th>
    
    </tr>
    <c:forEach items="${list }" var="m" varStatus="i">
    <tr>
    <td><input type="checkbox"></td>
    <td>${m.memberNickname }(${m.memberId })</td>
    <td><button>상세보기</button></td>
    <td>
    <c:choose >
    <c:when test="${m.memberLevel eq 1}">
   	요리꾼
    
    </c:when>
    <c:otherwise>
    조리꾼
    </c:otherwise>
    </c:choose>
    </td>
    <td>${m.enrollDate }</td>
    <td>${m.recipeCount }</td>
    <td>${m.boardCount }</td>
    </tr>
    </c:forEach>
    
    </table>
    
    </div>
    
    <div class="pagenation" style="">
    ${pageNavi }
    </div>
    </div>
    
    <script>
    $(function(){
    	$(".detailbtn").click(function(){
    		$(".detail").slideToggle();
    	});
    	
    	$("input[name=searchdetail]").change(function(){
    		$(".detail1").show();
    		$(".detail2").hide();
    		$("#space").html($(this).next().html());
    		if($(this).val()==4){
    			$(".detail2").show();
        		$(".detail1").hide();	
    		}
    	});
    	
    	$(".period").change(function(){
    		if($(this).val()==2){
    			var date = new Date();
    			var year = date.getFullYear();
    			var month = date.getMonth();
    			
    			$("#recentonemonth").html(year+"."+month+"."+"01.~"+year+"."+month+"."+"31.")
    		}else{
    			$("#recentonemonth").html("");
    		}
    	});
    });
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
</body>
</html>
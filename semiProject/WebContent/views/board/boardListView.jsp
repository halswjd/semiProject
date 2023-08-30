<%@page import="board.model.vo.Category"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOUNTAINEER - 자유게시판</title>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<style>
.outer {
	width: 1200px;
	margin: auto;
	margin-top: 50px;
	box-sizing: border-box;
	/* border: 1px solid black; */
}

.wrap {
	width: 1000px;
	/* border: 1px solid red; */
	margin: auto;
	font-family: 'NanumBarunGothic';
}

/* 헤더부분 */
#filter {
	height: 40px;
	width: 500px;
}

#search {
	height: 40px;
	/* border: 1px solid black; */
}

#search>form {
	height: 100%;
}

#header {
	display: inline-block;
}

#header>div {
	float: left;
}

select {
	border: 1px solid gray;
	border-radius: 3px;
	width: 130px;
	height: 100%;
	font-size: 14px;
	margin-right: 5px;
	cursor: pointer;
	padding-left: 5px;
}

#box-search {
	border: 1px solid gray;
	border-radius: 3px;
	height: 100%;
	width: 250px;
}

form>* {
	float: left;
}

input[type=text] {
	margin-left: 10px;
	width: 190px;
	height: 30px;
	margin-top: 4px;
	border: none;
	font-size: 15px;
}

.btn-secondary {
	width: 100px;
	height: 100%;
	margin-left: 5px;
}

button>img {
	width: 25px;
	height: 25px;
}

.img-button {
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

.list {
	width: 100%;
	/*height: 300px;*/
	/* border: 1px solid blue; */
}

.list>table {
	margin-top: 20px;
	margin-bottom: 30px;
	width: 100%;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.list tr {
	height: 50px;
	border-bottom: 1px solid lightgray;
}

.list-area>tbody>tr:hover {
	background-color: rgb(242, 242, 242);
	font-weight: bolder;
}

.paging-area>button {
	border: none;
	background-color: white;
	width: 35px;
	height: 35px;
}

#title {
	color: rgb(149, 193, 31);
	font-weight: bolder;
	margin: 70px;
	letter-spacing: 5px;
}

#filter select, #search select {
	font-size: 14px;
}

#search-option {
	margin-right: 5px;
}

.list-area>tbody span {
	margin-left: 8px;
	color: red;
	font-size: 13px;
	font-weight: bolder;
	border: 1px solid lightgray;
	border-radius: 45%;
	display: inline-block;
	width: 25px;
	height: 23px;
	text-align: center;
	line-height: 1.8;
}
ul {
    text-align: center;
    display: inline-block;
    border: 1px solid #ccc;
    border-right: 0;
	padding-left :0;
}
ul li {
    text-align: center;
    float: left;
	list-style:none;

}

ul li a {
    display: block;
    font-size: 14px;
	color: black;
    padding: 9px 12px;
    border-right: solid 1px #ccc;
    box-sizing: border-box;
	text-decoration-line:none;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

	<div class="outer">
		<div class="wrap">
			<h1 align="center" id="title">자유게시판</h1>
			<div id="header">
				<div id="filter">
					<select name="subject">

					</select> <select name="test" id="boardLimit">
						<option value="10">10개씩</option>
						<option value="15">15개씩</option>
						<option value="20">20개씩</option>
					</select>
				</div>


				<div id="search">
					<form action="">
						<select name="" id="search-option">
							<option value="">제목+내용</option>
							<option value="">글제목</option>
							<option value="">글쓴이</option>
							<option value="">댓글내용</option>
						</select>

						<div id="box-search">
							<input type="text" placeholder=" 검색어를 입력하세요">
							<!-- <button type="submit">검색</button> -->
							<button type="submit" class="img-button">
								<img src="/semi/resources/image/search.png" alt="">
							</button>
						</div>
					</form>
				</div>

				<%
				if (loginMember == null) {
				%>
				<button type="button" class="btn btn-secondary"
					onclick="loginAlert();">글쓰기</button>
				<%
				} else {
				%>
				<button type="button" class="btn btn-secondary">글쓰기</button>
				<%
				}
				%>

			</div>
			<!-- db 가져와서 아래 div 부분 계속 생성되게 -->
			<div class="list">
				<table align="center" class="list-area">
					<thead>
						<tr align="center">
							<th colspan="3" width="200">제목</th>
							<th width="140">글쓴이</th>
							<th width="110">작성일</th>
							<th width="70">추천</th>
							<th width="70">조회수</th>
						</tr>
					</thead>
					<tbody>
						<!-- 
                        <tr align="center">
                            <td>공지</td>
                            <td colspan="3"></td>
                            <td>작성일</td>
                            <td>추천</td>
                            <td>조회수</td>
                        </tr>
                     -->
						<tr align="center">
							<td width="80" style="color: gray;">글번호</td>
							<td width="60">[카테고리]</td>
							<td align="left" style="padding-left: 10px;">제목</td>
							<!-- <td align="left" style="padding-left: 10px;">제목 <span>댓글수</span></td> -->
							<td>작성자</td>
							<td>작성일</td>
							<td>좋아요수</td>
							<td>조회수</td>
						</tr>

					</tbody>
				</table>
			</div>

			<script>
            	// 게시글 상세이동 함수
            	$(".list-area").children("tbody").children("tr").click(function(){
            		
            		location.href="<%=contextPath%>
				/detail.bo?bno="
									+ $(this).children().eq(0).text();
						});
			</script>

			<ul id="paging-area">

			</ul>






		</div>

	</div>
	<script>
		function loginAlert() {
			alert('로그인 후 이용가능합니다 ~!');
		}

		let listCount; // 총 게시글 수
		let boardLimit; // 한 페이지내에 보여질 게시글 최대 개수
		let pageLimit = 5; // 페이징 최대개수
		let globalCurrentPage = 1; // 현재 페이지
		let dataList; // 데이터 리스트
		
		//let maxPage;
		//let selectedPage;

		$(function() {

			// boardLimit 설정
			boardLimit = $("#boardLimit").val();
			console.log(boardLimit);

			$.ajax({
				url : "/semi/list.bo",
				success : function(list) {
					console.log("length" + list.length);
					listCount = list.length;
					dataList = list;

					// 글 목록 불러오기 호출
					displayData(1, boardLimit);
				},
				error : function() {
					console.log("실패@");
				}

			});

			// 페이징 표시 호출
			paging(listCount, boardLimit, pageLimit, 1);

		})

		function displayData(currentPage, boardLimit) {

			let charHtml = "";

			currentPage = Number(currentPage);
			boardLimit = Number(boardLimit);

			let start = (currentPage - 1) * boardLimit;
			let end = (currentPage - 1) * boardLimit + boardLimit;

			for (let i = start; i < end; i++) {
				charHtml += '<tr align="center">'
						+ '<td width="80" style="color: gray;">'
						+ dataList[i].boardNo + '</td>' + '<td width="60">['
						+ dataList[i].category + ']</td>'
						+ '<td align="left" style="padding-left : 10px;">'
						+ dataList[i].boardTitle + '</td>' + '<td>'
						+ dataList[i].boardWriter + '</td>' + '<td>'
						+ dataList[i].createDate + '</td>' + '<td>'
						+ dataList[i].likeCount + '</td>' + '<td>'
						+ dataList[i].count + '</td>' + '</tr>';

			}

			$(".list-area").children("tbody").html(charHtml);
		}
		
		function paging(listCount, boardLimit, pageLimit, currentPage){
			
			
			maxPage = Math.ceil(listCount/boardLimit); // 총 페이징 수
			
			if(maxPage < pageLimit){
				pageLimit = maxPage;
			}
			
			let pageGroup = Math.ceil(currentPage/pageLimit);
			
			console.log("페이징총개수: " + pageGroup)
			let last = pageGroup * pageLimit;
			
			if(last > maxPage){
				last = maxPage;
			}
			
			let first = last - (pageLimit -1); // 화면에 보여질 첫번째 페이지 번호
			let next = last + 1;
			let prev = first -1;
			
			let pageHtml = "";
			
			if(prev > 0){
				console.log("prev");
				pageHtml += "<li><a id='prev'>이전</a></li>";			
			}
			
			for(let i=first; i<=last; i++){
				if(currentPage == i){
					pageHtml += "<li><a id='"+ i +"'>" + i + "</a></li>";
				}else{
					pageHtml += "<li><a id='"+ i +"'>" + i + "</a></li>";
				}
			}
			
			if(last < maxPage){
				console.log("last");
				pageHtml += "<li><a id='next'>다음</a></li>";	
			}
			
			$("#paging-area").html(pageHtml);
			
			// 페이징 번호 클릭 이벤트
			$("#paging-area").children("li").children("a").click(function(){
				
				let $id = $(this).attr("id");
				selectedPage = $(this).text();
				console.log("페이지번호 : " + selectedPage);
				
				if($id == "next"){
					selectedPage = next;
				}
				if($id == "prev"){
					selectedPage = prev;
				}
				
				globalCurrentPage = selectedPage;
				
				paging(listCount, boardLimit, pageLimit, selectedPage);
				
				displayData(selectedPage, boardLimit);
			});
			
		}
		
		$("#boardLimit").change(function(){
			boardLimit = $("#boardLimit").val();
			
			paging(listCount, boardLimit, pageLimit, globalCurrentPage);
			displayData(globalCurrentPage, boardLimit);
		});
	</script>


</body>
</html>
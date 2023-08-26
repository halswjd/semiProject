<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOUNTAINEER - 자유게시판</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .outer{
            width: 1200px;
            
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }
        .wrap{
            width: 1000px;
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
        }

        /* 헤더부분 */
        #filter{height: 40px; width: 500px;}
        #search{
            height: 40px; 
            /* border: 1px solid black; */
        }
        #search>form{height: 100%;}
        #header{display: inline-block;}
        #header>div{float: left;}
        select{
            border: 1px solid gray;
            border-radius: 3px;
            width: 130px;
            height: 100%;
            font-size: 14px;
            margin-right: 5px;
            cursor: pointer;
            padding-left: 5px;
        }
        #box-search{
            border: 1px solid gray;
            border-radius: 3px;
            height: 100%;
            width: 250px;
        }
        form>*{float: left;}
        input[type=text]{
            margin-left: 10px;
            width: 190px;
            margin-top: 10px; 
            border: none; 
            font-size: 13px;
        }
        .btn-secondary{
            width: 100px;
            height: 100%;
            margin-left: 5px;
        }
        button>img{
            width: 25px;
            height: 25px;
        }
        .img-button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
        }

        .list{
            width: 100%;
            height: 300px;
            /* border: 1px solid blue; */
        }

        .list>table{
            margin-top: 20px;
            margin-bottom: 30px;
            width: 100%;
            border-top: 1px solid gray;
            border-bottom: 1px solid gray;
        }
        .list tr{
            height: 50px;
            border-bottom: 1px solid lightgray;
        }
        .list-area>tbody>tr:hover{
            background-color: rgb(242, 242, 242);
            font-weight: bolder;
        }
        .paging-area>button{
            border: none;
            background-color: white;
            width: 35px;
            height: 35px;

        }
        

    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div class="wrap">
            <div id="header">
                <div id="filter">
                    <select name="subject" id="">
                        <option value="">선택안함</option>
                        <option value="">일상</option>
                        <option value="">유머</option>
                        <option value="">제품추천</option>
                        <option value="">사담</option>
                    </select>
                    <select name="order" id="">
                        <option value="">최신글순</option>
                        <option value="">추천순</option>
                        <option value="">댓글순</option>
                        <option value="">조회순</option>
                    </select>
                </div>
    
                <div id="search">
                    <form action="">
                        <select name="" id="">
                            <option value="">제목+내용</option>
                            <option value="">글제목</option>
                            <option value="">글쓴이</option>
                            <option value="">댓글내용</option>
                        </select>
                     
                        <div id="box-search">
                            <input type="text" placeholder=" 검색어를 입력하세요">
                            <!-- <button type="submit">검색</button> -->
                            <button type="submit" class="img-button">
                                <img src="resources/search.png" alt="">
                            </button>
                        </div>
                    </form>
                </div>
                <button type="button" class="btn btn-secondary">글쓰기</button>
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
                    <% for(Board b : list){ %>
                        <tr align="center">
                            <td width="80"><%= b.getBoardNo() %></td>
                            <td width="60">[ <%= b.getCategory()%> ]</td>
                            <td align="left" style="padding-left: 10px;"><%= b.getBoardTitle() %></td>
                            <td><%= b.getBoardWriter() %></td>
                            <td><%= b.getCreateDate() %></td>
                            <td>추천수</td>
                            <td><%= b.getCount() %></td>
                        </tr>
                     <%} %>
                            
                    </tbody>
                </table>
            </div>

            <div class="paging-area" align="center">
            
            	<% if(currentPage != 1){ %>
            		<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage -1 %>'"> &lt; </button>
            	<%} %>
            	
            	<% for(int p = startPage; p <= endPage; p++){ %>
	            	<% if(p == currentPage){ %>
	            		<button disabled style="border: 1px solid lightgray; font-weight: bolder;"><%= p %></button>
	            	<%}else{ %>
	            		<button onclick="location.href='<%= contextPath%>/list.bo?cpage=<%= p %>';"><%= p %></button>
	            	<%} %>
            	<%} %>
            	
            	<% if(currentPage != maxPage){ %>
	            	<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage +1 %>'"> &gt; </button>
	            <%} %>
            	
            	<!-- 
                <button disabled> &lt; </button>
                <button style="border: 1px solid lightgray; font-weight: bolder;">1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button> &gt; </button>
                 -->
            </div>
            
            <!-- 
            <script>
            	
            	let listCount; // 총 게시글 개수
            	let currentPage; // 사용자 요청 페이지
            	let pageLimit; // 페이징바 페이지 최대개수(몇개 단위씩)
            	let boardLimit; // 한 페이지내에 보여질 게시글 최대개수
            	
            	let selectList; // db에서 받아온 게시글 리스트
            	
            	$(function(){
            		selectBoardList();
            		
            		
            		
            	})
            	
            	function selectBoardList(){
            		
            		$.ajax({
            			url:"/semi/list.bo",
            			success:function(list){
            				selectList = list.
            			}
            			
            		})
            		
            	}
            </script>
             -->
            
            
            

        </div>
        
    </div>
	

</body>
</html>
<%@page import="board.model.vo.Category"%>
<%@page import="board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	// 글번호, 글제목, 조회수, 닉네임, 카테고리명, 작성일, 좋아요수, 댓글수
	
	// ArrayList<Category> categoryList = (ArrayList<Category>)request.getAttribute("categoryList");
	
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
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <!-- jQuery -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
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
            height: 30px;
            margin-top: 4px; 
            border: none; 
            font-size: 15px;
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
            /*height: 300px;*/
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
        #title{
            color: rgb(149, 193, 31);
            font-weight: bolder;
            margin: 70px;
            letter-spacing: 5px;
        }

        #filter select, #search select{
            font-size: 14px;
        }
        #search-option{
            margin-right: 5px;
        }
		
		.list-area>tbody span{
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
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <div class="wrap">
            <h1 align="center" id="title">자유게시판</h1>
            <div id="header">
                <div id="filter">
                    <select name="subject">
                        
                    </select>
                    <select name="test" id="test">
                    	<option value="">보기선택</option>
                        <option value="10">10개씩</option>
                        <option value="15">15개씩</option>
                        <option value="20">20개씩</option>
                    </select>
                </div>
                <script>
                	// 보기선택 함수
                	/*
                	$("select[name=test]").change(function(){
                		console.log($(this).val());
                		location.href = "<%= contextPath%>/list.bo?cpage=1&test=" + $(this).val();
                	})
                	*/
                	
                	// 카테고리 불러오는 함수
                	$(function(){
                		$.ajax({
                			url:"list.category",
                			success:function(list){
                				// console.log(list);
                				let result = "<option>말머리 선택</option>";
                				for(let i=0; i<list.length; i++){
                					result += "<option value=" + list[i].categoryNo + ">"
                							+ list[i].categoryName + "</option>"
                				}
                				
                				$("select[name=subject]").html(result);
                				
                			}, 
                			error:function(){
                				console.log("실패");
                			}
                		})
                	})

                	// 말머리선택 함수
                    $("select[name=subject]").change(function(){
                        console.log($(this).val());
                        location.href = "<%= contextPath%>/list.bo?cpage=1&test=10&categoryNo=" + $(this).val();
                        
                        
                        /*
                        $.ajax({
                            url:"list.bo",
                            data:{categoryNo:$(this).val(),
                            test:"10",
                            cpage:"1"
                            },
                            success:function(){
                                console.log("성공");
                            },
                            error:function(){
                                console.log("실패");
                            }
                            
                        })
                     
                        */
                    })
                    
                   
                </script>
    
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
                                <img src="resources/image/search.png" alt="">
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
                    <!-- 
                        <tr align="center">
                            <td>공지</td>
                            <td colspan="3"></td>
                            <td>작성일</td>
                            <td>추천</td>
                            <td>조회수</td>
                        </tr>
                     -->
                    <% for(Board b : list){ %>
                    	
                        <tr align="center">
                            <td width="80" style="color: gray;"><%= b.getBoardNo() %></td>
                            <td width="60">[<%= b.getCategory()%>]</td>
                            <% if(b.getReplyCount() == 0){ %>
                            	<td align="left" style="padding-left: 10px;"><%= b.getBoardTitle() %></td>
                            <%}else{ %>
                            	<td align="left" style="padding-left: 10px;"><%= b.getBoardTitle() %> <span><%=b.getReplyCount() %></span></td>
                            <%} %>
                            
                            <td><%= b.getBoardWriter() %></td>
                            <td><%= b.getCreateDate() %></td>
                            <td><%= b.getLikeCount() %></td>
                            <td><%= b.getCount() %></td>
                        </tr>
                     <%} %>
                            
                    </tbody>
                </table>
            </div>
            
            <script>
            	// 게시글 상세이동 함수
            	$(".list-area").children("tbody").children("tr").click(function(){
            		
            		location.href="<%= contextPath%>/detail.bo?bno=" + $(this).children().eq(0).text();
            	});
            </script>

            <div class="paging-area" align="center">
            
            	<% if(currentPage != 1){ %>
            		<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage -1 %>'"> &lt; </button>
            	<%} else{%>
            		<button disabled> &lt; </button>
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
            	
            	
            </div>
            
        
            
            
            

        </div>
        
    </div>
	

</body>
</html>
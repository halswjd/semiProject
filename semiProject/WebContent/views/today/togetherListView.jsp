<%@page import="today.model.vo.Today"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Today> list = (ArrayList<Today>)request.getAttribute("list");
 %>    

<!DOCTYPE html>
<html lang="en">
<head>
    <title>같이 등산행</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
       
        .list>div{
            /* border: 1px solid black; */
            width: 33.3%;
            height: 250px;
            float: left;
            box-sizing: border-box;
            position: relative;
        }
        
        .together{
            /* border: 1px solid black; */
            width: 90%;
            height: 85%;
            position: absolute;
            top: 10;bottom: 0;left: 0;right: 0;
            margin: auto;
            background-color: rgb(231, 231, 231);
            border-radius: 10px;
        }

        .together>table{
            width: 100%;
            height: 100%;
            padding: 15px;
            padding-left: 25px;
            /* border: 1px solid blue; */
            border-collapse: inherit;
        }
        tbody>tr{
            font-size: 15px;
            font-weight: bolder;
        }
        
        /*마감*/
        .together>.end{
            /* border: 1px solid black; */
            border-radius: 5px;
            background-color: rgb(149, 193, 31);
            color: white;
            width: 80px;
            height: 40px;
            line-height: 2.4;
            text-align: center;
            font-size: 18px;
            position: absolute;
            top: 155px;
            left: 200px;
        }
        #title {
            color: rgb(149, 193, 31);
            font-weight: bolder;
            letter-spacing: 5px;
            margin-top:100px;
            margin-bottom:60px;
        }
        
        #write-btn{
            width: 100px;
            height: 40px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
            <h1 align="center" id="title">같이 등산행</h1>
            <% if(loginMember != null){ %>
            <div align="center"><button id="write-btn" class="btn btn-secondary">글 작성</button></div>
            <%} %>
            <div class="list">
                <!-- 리스트 조회해서 여기서 for문 -->
                <% for(Today t : list){ %>
                <div>
                    <div class="together">
						<input type="hidden" class="todayNo" value="<%= t.getTodayNo() %>">
                        <table>
                            <tbody>
                                <tr height="30" style="font-size: 20px; font-weight: bolder;">
                                    <td><%= t.getTodayTitle() %></td>
                                </tr>
                                <tr>
                                    <td style="color: rgb(149, 193, 31);"><%= t.getTodayWriter() %></td>
                                </tr>
                                <tr>
                                    <td>🌄 <%= t.getTodayName() %></td>
                                </tr>
                                <tr>
                                	<td>📅 <%= t.getTodayDate()%></td>
                                </tr>
                                <tr>
                                    <td>🕒 <%= t.getTodayTime() %>시</td>
                                </tr>
                                <tr>
                                <%if(t.getLev().equals("제한없음")){ %>
                                    <td>🙋‍♂️ <%= t.getLev() %></td>
                                <%}else{ %>
                                    <td>🙋 <%= t.getMemCount() %>/<%= t.getLev() %>명</td>
                                <%} %>
                                </tr>
                            </tbody>
                        </table>
                        <% if( !t.getLev().equals("제한없음") && t.getMemCount() == Integer.parseInt(t.getLev())){ %>
                        <!-- 마감되면 보이게하는 div -->
                        <div class="end" style="background-Color:rgb(149, 193, 31);">마감</div>
                        <%} %>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    
    <script>

        // 게시글 상세보기
	    $(".together").click(function(){
		    let tno = $(this).find(".todayNo").val();
		    location.href = "<%= contextPath%>/detail.tg?tno=" + tno;
		
	    })

        // 게시글 작성
        $("#write-btn").click(function(){
            location.href="<%= contextPath%>/enrollFormView.tg";
        })
    </script>


</body>
</html>
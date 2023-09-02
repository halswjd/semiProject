<%@page import="today.model.vo.Today"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Today t = (Today)request.getAttribute("t");
	// 게시글번호(T1), 제목, 내용, 닉네임, 유저번호, 산이름, 작성일자, 교통수단, 코스, 모집인원수(lev), mem_count, 시간, 등산일자, 댓글수
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <style>
        .outer{
            width: 1200px;
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }
        .wrap{
            width: 800px; 
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
        }
        #header, #bar {
            border: none;
            border-bottom: 2px solid lightgray;
            padding: 10px;
            padding-bottom: 7px;
            margin-top: 20px;
        }
        
        #header>*{margin: 15px;}
        #h_etc{margin-bottom: 2px;}
        /* #subject{font-size: 20px; color: rgb(149, 193, 31);} */
        #title{font-size: 40px;}
        #writer{font-size: 20px; color: rgb(149, 193, 31);}
        #h_etc{font-style: 10px; color: gray;}

        /*내용*/
        #content{
            padding: 15px;
            padding-top: 30px;
            /* margin-bottom: 100px; */
            font-size: 20px;
            line-height: 35px;
            /* border: 1px solid black; */
        }
        #content>table{
            margin-top: 30px;
            width: 90%;
            padding: 20px;
            padding-left:40px;
           /* border: 3px solid rgb(149, 193, 31); */
           background-color: rgb(244, 244, 244);
            border-radius: 7px;
            border-collapse:inherit;
        }
        
        #content th{font-size: 17px; color: rgb(77, 77, 77); }
        #content td{padding: 15px; font-weight: bolder; font-size: 18px;}
        
        #content>table>tr{border-bottom: 1px solid lightgray;}

        #h_etc>span, #bar>span, #cmt_etc>span{margin-right: 10px;}
        #comment{
            padding: 20px;
        }
        
        .comment-area1{
            border: none;
            background-color: rgb(244, 244, 244);
            padding: 10px;
            margin-top: 10px;
        }
        .comment-area1>*{margin: 5px;}
        .cmt_id{font-size: 15px; font-weight: bold;}
        .cmt_txt{margin-top: 10px; margin-bottom: 10px; font-size: 14px;}
        .cmt_etc{font-size: 12px; color: gray;}
        #comment-area2{
            border: 1px solid gray;
            border-radius: 5px;
            padding: 10px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #cmt_btn{
            padding-right: 10px;
        }
        #cmt_btn>button{
            border: none;
            width: 60px;
            height: 30px;
            font-family: 'NanumBarunGothic';
        }
        .cmt_delete{
            margin-top: 7px;
            color: tomato;
            font-size: 13px;
        }
        #comment b{font-size: 15px;}

        /* hover */
        #bar>span:hover, .cmt_delete:hover{
            font-weight: bolder;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
            <div id="header">
                <div id="title"><%= t.getTodayTitle()%></div>
                <div id="writer"><%=t.getTodayWriter() %></div>
                <div id="h_etc">
                    <span><%= t.getCreateDate() %></span>
                </div>
                
            </div>
            <div id="content">
                <%= t.getTodayContent() %>
                <table>
                    <tr>
                        <th width="70">🌄</th>
                        <th width="150">산</th>
                        <td width=""><%= t.getTodayName() %></td>
                    </tr>
                    
                    <tr>
                        <th>📅</th>
                        <th>등산일자</th>
                        <td><%= t.getTodayDate() %></td>
                    </tr>
                    <tr>
                        <th>🕒</th>
                        <th>출발시간</th>
                        <td><%=t.getTodayTime() %>시</td>
                    </tr>
                    <tr>
                        <th>📍</th>
                        <th>등산루트</th>
                        <td><%= t.getTodayCourse() %></td>
                    </tr>
                    <tr>
                        <th>🚌</th>
                        <th>교통수단</th>
                        <td><%= t.getTodayVehicle() %></td>
                    </tr>
                    <tr>
                        <th>🙋‍♂️</th>
                        <th>명수</th>
                        <% if(t.getLev().equals("제한없음")){ %>
                        <td><%= t.getLev() %></td>
                        <%}else{ %>
                        <td><%= t.getLev() %>명</td>
                        <%} %>
                    </tr>
                </table>
            </div>
                <%if(loginMember == null){ %>
                    <div id="bar" align="right"></div>
                <%}else if(loginMember.getUserNo() == Integer.parseInt(t.getTodayWriter())){%>
                    <div id="bar" align="right"><button style="color:tomato;" onclick="deleteBoard();">글 삭제</button></div>
                <%}else{ %>
                <div id="bar" align="right">
                    <button type="button" data-toggle="modal" data-target="#reportBoard">신고</button>
                    <button id="bookmark1" onclick="insertBook();"><img src="resources/image/bookmark_blank.png" width="25" height="25"></button>
                    <button id="bookmark2" onclick="deleteBook();" style="display: none;"><img src="resources/image/bookmark.png" width="25" height="25"></button>
                </div>
                <%} %>
            <div id="comment">
                <b>댓글 <%= t.getReplyCount() %></b>
                <div id="comment-area2">
                    <form action="">
                        <textarea name="comment" style="resize: none; border: none; width: 95%; height: 50px;" placeholder="댓글을 입력하세요"></textarea>
                        <div id="cmt_btn" align="right">
                            <button type="reset">취소</button>
                            <button type="submit">등록</button>
                        </div>
                    </form>
                </div>
                <div class="comment-area1">
                    <div class="cmt_id">김뫄뫄</div>
                    <div class="cmt_txt">너무 피곤해유</div>
                    <div class="cmt_etc">7시간전</div>
                    <div class="cmt_delete">삭제</div>
                </div>
                <!-- 비회원은 disabled -->
            </div>
        </div>
    </div>
    <div class="modal" id="reportBoard">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title"><b>신고하기</b></h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              <form action="<%= contextPath %>/reportBoard.bo" method="post">
                <p>작성자 : <%= t.getTodayWriter() %> </p>
                <p>글 제목 : <%= t.getTodayTitle() %> </p>
                
                <input name="bno" type="hidden" value="<%= t.getTodayNo()%>">
                <input name="reportedUserNo" type="hidden" value="<%= t.getUserNo()%>">
                <% if(loginMember != null){ %>
                <input name="reportUserNo" type="hidden" value="<%= loginMember.getUserNo()%>">
                <%} %>
                <hr>
                
                    <input type="radio" id="r1" name="report" value="영리목적/홍보성">
                    <label for="r1">영리목적/홍보성</label><br>
                    <input type="radio" id="r2" name="report" value="욕설/인신공격">
                    <label for="r2">욕설/인신공격</label> <br>
                    <input type="radio" id="r3" name="report" value="도배">
                    <label for="r3">같은 내용 반복(도배)</label> <br>
                    <input type="radio" id="r4" name="report" value="개인정보노출">
                    <label for="r4">개인정보노출</label> <br>
                    <input type="radio" id="r5" name="report" value="불법정보">
                    <label for="r5">불법정보</label><br>
                    <input type="radio" id="r6" name="report" value="음란성/선정성">
                    <label for="r6">음란성/선정성</label> <br>
        
                <textarea name="reportContent" style="resize: none;" placeholder=" 신고 사유 설명이 필요하신 경우 작성해주세요." cols="50" rows="3" style="margin: 20px;"></textarea>
                <br><button type="submit" class="btn btn-secondary" id="rpt_btn" style="width: 100%; height: 40px; margin-top: 15px;">신고</button>
              </form>
            </div>
  
         </div>
            
        </div>
    </div>
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>
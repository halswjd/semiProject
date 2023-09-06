<%@page import="java.util.ArrayList"%>
<%@page import="today.model.vo.Today"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Today t = (Today)request.getAttribute("t");
	// 게시글번호(T1), 제목, 내용, 닉네임, 유저번호, 산이름, 작성일자, 교통수단, 코스, 모집인원수(lev), mem_count, 시간, 등산일자, 댓글수
	
	ArrayList<Integer> list = (ArrayList<Integer>)request.getAttribute("list");
	// 해당 게시글에 가입한 멤버의 리스트
	
	int result = 0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- jQuery library -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
 <!-- 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
 -->
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
            margin-top: 10px;
            margin-bottom: 30px;
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

		#bar>button{
            border: none;
            background-color: rgba(0, 0, 0, 0);
            font-size: 14px;
        }

        /* hover */
        #bar>span:hover, .cmt_delete:hover{
            font-weight: bolder;
            cursor: pointer;
        }

        #enroll-btn{
            width: 90%;
            height: 50px;
            margin-top: 10px;
            border: none;
            background-color: rgb(149, 193, 31);
            color: white;
            border-radius: 7px;
            font-size: 18px;
            font-weight: 200;
            letter-spacing: 20px;
        }
        
        .deleteReply-btn{
            margin: 0;
            color: tomato;
            margin-top: 3px;
            margin-left:3px;
            cursor: pointer;
            font-size:13px;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%
		if(loginMember != null && list != null){
			for(int memNo : list){
				if(loginMember.getUserNo() == memNo){
					result = 1;
				}
			}
			
		}
	%>
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
                        <% if(Integer.parseInt(t.getLev()) == 100){ %>
                        	<td><%= t.getMemCount() %>명/제한없음</td>
                        <%}else{ %>
                        	<td><%= t.getMemCount() %>/<%= t.getLev() %>명</td>
                        <%} %>
                    </tr>
                </table>
                <% if(loginMember != null && t.getMemCount() < Integer.parseInt(t.getLev()) && result!=1 && t.getUserNo() != loginMember.getUserNo()){ %>
                	<button id="enroll-btn" onclick="enrollMember();">신청하기</button>
                <%}else if(result == 1 && loginMember.getUserNo() != t.getUserNo()){ %>
                	<button id="enroll-btn" style="background-color:gray;" onclick="dropOut();">신청취소</button>
                <%} %>
            </div>
                <%if(loginMember == null){ %>
                    <div id="bar" align="right"></div>
                <%}else if(loginMember.getUserNo() == t.getUserNo() ){%>
                    <div id="bar" align="right"><button style="color:tomato;" onclick="deleteBoard();">글 삭제</button><button style="color:rgb(58,58,58);" onclick="updateBoard();">글 수정</button></div>
                <%}else{ %>
                <div id="bar" align="right">
                    <button type="button" data-toggle="modal" data-target="#reportBoard">신고</button>
                    <button id="bookmark1" onclick="insertBook();"><img src="resources/image/bookmark_blank.png" width="25" height="25"></button>
               		<button id="bookmark2" onclick="deleteBook();" style="display: none;"><img src="resources/image/bookmark.png" width="25" height="25"></button>
                </div>
                <%} %>
            <div id="comment">
                <b>댓글 <span id="countReply">보기와 작성은 모임 신청 후 가능합니다</span></b>
                <div id="comment-area2">
                    <form action="<%= contextPath %>/insertReply.bo" method="post">
                    </form>
                        <textarea id="rContent" style="resize: none; border: none; width: 95%; height: 50px;" placeholder="댓글을 입력하세요" required></textarea>
                        <div id="cmt_btn" align="right">
                            <button type="reset">취소</button>
                            <%if(loginMember != null && result==1){ %>
                            <input name="userNo" type="hidden" value="<%= loginMember.getUserNo()%>">
                            <button type="button" onclick="insertReply();">등록</button>
                            <%}else{ %>
                            <button type="submit" disabled>등록</button>
                            <%} %>
                        </div>
                </div>
                <div id="comment-list">
                    
                    
                </div>
                
            </div>
        </div>
    </div>
    
    <script>
    	let bno = "<%= t.getTodayNo()%>";
    	<% if(loginMember != null){%>
    	let userNo = "<%= loginMember.getUserNo()%>";
    	
	    function insertBook(){
	        
	           $.ajax({
	            url:"book.bo",
	            data:{boardNo:bno, userNo:userNo},
	            success:function(result){
	                if(result == 'Y'){
	                	$("#bookmark1").css("display", "none");
	                    $("#bookmark2").css("display", "");
	                }
	            },
	            error:function(){
	                console.log("실패")
	            }
	           })
	        	
	    }
	
	    function deleteBook(){
	    
	           $.ajax({
	            url:"deleteBook.bo",
	            data:{boardNo:bno, userNo:userNo},
	            success:function(result){
	                if(result == 'Y'){
	                	$("#bookmark1").css("display", "");
	                    $("#bookmark2").css("display", "none");
	                }
	            },
	            error:function(){
	                console.log("실패")
	            }
	           })
	        	
	    }
	    
	    $(function(){
			if(<%= result%> == 1){
		    	selectReplyList();
		    	
		    	setInterval(selectReplyList, 1000);
				
			}
	    	
            // 북마크 체크 함수
            $.ajax({
                url:"bookCheck.bo",
                data:{boardNo:bno, userNo:userNo},
                success:function(result){
                    if(result == 'Y'){
                    	$("#bookmark2").css("display", "");
                        $("#bookmark1").css("display", "none");
                    }else{
                    	$("#bookmark2").css("display", "none");
                        $("#bookmark1").css("display", "");                    	
                    }
                },
                error:function(result){
                    console.log("실패");
                }
            })
	            
		    
	            
            
	    })
	    
	    function selectReplyList(){
	    	
	    	// 오늘날짜
			let today = new Date();
			let year = today.getFullYear();
			let month = ('0' + (today.getMonth() + 1)).slice(-2);
			let day = ('0' + today.getDate()).slice(-2);			
			let dateString = year + '/' + month  + '/' + day;
	    	
	    	// 댓글 리스트
            let charHtml = "";
            
            $.ajax({
            	url:"replyList.bo",
            	data:{boardNo:bno},
            	success:function(list){
            		for(let i=0; i<list.length; i++){
            			charHtml += "<div class='comment-area1'>"
          				  + "<span class='cmt_id'>" + list[i].replyWriter + "</span>";
          			 if('20' + list[i].createDate.substr(0,8) == dateString){
          		charHtml += "<span class='cmt_etc'>" + list[i].createDate.substr(9);
          			 }else{
          		charHtml += "<span class='cmt_etc'>" + list[i].createDate;		 
          			 }
          		charHtml += "</span><div class='cmt_txt'>" + list[i].replyContent + "</div>";
      				  if(userNo == list[i].userNo){
          				  charHtml += "<p class='deleteReply-btn' onclick='deleteReply($(this));'>삭제</p>"
          				  		   + "<input type='hidden' value='" + list[i].replyNo + "'>"
          					 	   + "</div></div>"; 
      				  }else{
      					  charHtml += "</div>";
      				  }
	            				  
            		}
            		
            		$("#comment-list").html(charHtml);
            		
            	},
            	error:function(){
            		console.log("댓글 불러오기 실패");
            	}
            	
            })
            
            // 댓글 갯수
            $.ajax({
            	url:"countReply.bo",
            	data:{boardNo:bno},
            	success:function(result){
            		$("#countReply").text(result);
            	},
            	error:function(){
            		console.log("댓글카운트 ajax 통신 실패");
            	}
            })
       	}
	    <%} %>
	    
	    // 게시글 삭제 함수
        function deleteBoard(){
        	
        	if(confirm("해당 게시글을 삭제하시겠습니까?")){
	        	location.href = "<%= contextPath %>/delete.tg?tno=" + bno;
        	}
        	
        }
	    
	    // 모임 신청하기 버튼
	    function enrollMember(){
	    	
	    	if(confirm("해당 모임에 신청하시겠습니까?")){
	    		location.href = "<%= contextPath %>/enroll.tg?tno=" + bno + "&uno=" + userNo;
	    	}
	    }
	    
	    // 모임 탈퇴
 		function dropOut(){
	    	
	    	if(confirm("해당 모임에 탈퇴하시겠습니까?")){
	    		location.href = "<%= contextPath %>/dropOut.tg?tno=" + bno + "&uno=" + userNo;
	    	}
	    }
	    
	 // 댓글 작성 함수
	    function insertReply(){
	    	
	    	$.ajax({
	    		url:"insertReply.bo",
	    		data:{
	    			comment:$("#rContent").val(),
	    			boardNo:bno
	    		},
	    		type:"post",
	    		success:function(result){
	    			if(result > 0){
	    				selectReplyList();
	    				$("#rContent").val("");
	    			}
	    		}
	    		
	    	})
	    }
	    
	    
     	// 댓글 삭제 함수
		function deleteReply(e){
        	let replyNo = e.next().val();
        	
        	if(confirm("댓글을 삭제하시겠습니까?")){
        		$.ajax({
        			url:"deleteReply.bo",
        			data:{rno:replyNo},
        			success:function(result){
        				if(result > 0){
        					selectReplyList();
        				}
        			},
        			error:function(){
        				console.log("댓글작성 ajax 통신 실패");
        			}
        		})
        	}
     
        }
	    
        // 게시글 수정 함수
        function updateBoard(){
			location.href="<%= contextPath%>/updateView.tg?tno=<%= t.getTodayNo()%>";        	
        }
	   
	    
    </script>
    
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
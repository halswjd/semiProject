<%@page import="board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Board b = (Board)request.getAttribute("b");
	// 글번호, 글제목, 글내용, 해시태그, 조회수, 닉네임, 말머리, 작성일자, 댓글수
	
	String hashtag = b.getHashtag().trim().replaceAll(" ", "");
	String[] hashtagList = hashtag.split("#");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
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
        #subject{font-size: 20px; color: rgb(149, 193, 31);}
        #title{font-size: 40px;}
        #writer{font-size: 20px;}
        #h_etc{font-style: 10px; color: gray;}

        #content{
            padding: 15px;
            padding-top: 30px;
            font-size: 20px;
            line-height: 35px;
            /* border: 1px solid black; */
            margin-bottom: 100px;
        }

        #h_etc>span, #bar>span, #cmt_etc>span{margin-right: 10px;}
        #comment{
            padding: 20px;
          
        }
        
        #comment-area1{
            border: none;
            background-color: rgb(244, 244, 244);
            padding: 10px;
            margin-top: 10px;
        }
        #comment-area1>*{margin: 5px;}
        #cmt_id{font-size: 15px; font-weight: bold;}
        #cmt_txt{margin-top: 10px; margin-bottom: 10px; font-size: 14px;}
        #cmt_etc{font-size: 12px; color: gray;}
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

        #reportBoard{
            font-family: 'NanumBarunGothic';
        }

        #bar{
            /* border: 1px solid black; */
        }
        .hashtag{
            display: inline-block;
            border: 1px solid lightgray;
            padding: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            border-radius: 10%;
            color:white;
            background-color: lightgray;
            margin-right: 4px;
            font-size: 15px;
        }li oy80
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
            <div id="header">
                <di id="subject"><%= b.getCategory() %></di v>
                <div id="title"><%= b.getBoardTitle() %></div>
                <div id="writer"><%= b.getBoardWriter() %></div>
                <div id="h_etc">
                    <span>작성일자 <%= b.getCreateDate() %></span>
                    <span>조회수 <%= b.getCount() %></span>
                </div>
                
            </div>
            <div id="content">
               <%= b.getBoardContent() %>
            </div>
            <div id="hashtag">
                <% for(int i=1; i<hashtagList.length; i++){ %>
                <div class="hashtag">
                    # <%= hashtagList[i] %>
                </div>
                <%} %>
            </div>
            
            
            
            <div id="bar" align="right">
                <button onclick="test(this);">좋아요</button>
                <button>북마크</button>
                <button type="button" data-toggle="modal" data-target="#reportBoard">신고</button>
            </div>
            <div id="comment">
                <div id="comment-area2">
                    <form action="">
                        <textarea name="comment" style="resize: none; border: none; width: 95%; height: 50px;" placeholder="댓글을 입력하세요"></textarea>
                        <div id="cmt_btn" align="right">
                            <button type="reset">취소</button>
                            <button type="submit">등록</button>
                        </div>
                    </form>
                </div>
                <b>댓글 <%=b.getReplyCount() %></b>
                <div id="comment-area1">
                    <div id="cmt_id">김뫄뫄</div>
                    <div id="cmt_txt">너무 피곤해유</div>
                    <div id="cmt_etc">
                        <span>7시간전</span>
                        <span>좋아요</span>
                    </div>
                </div>
                <!-- 비회원은 disabled -->
            </div>
        </div>
    </div>

    <script>
        function test(e){
           $(e).css("backgroundColor","black");
        }    
    </script>

    <div class="modal" id="reportBoard">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">신고하기</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
              <form action="" method="post">
                <table>
                    <tr style="font-size: 14px;">
                        <td width="60px">작성자</td>
                        <td style="color: gray;"><%= b.getBoardWriter() %></td>
                    </tr>
                    <tr style="font-size: 14px;">
                        <td>제목</td>
                        <td style="color: gray;"><%= b.getBoardTitle() %></td>
                    </tr>
                </table>
                <hr>
                <input type="radio" id="r1">
                <label for="r1">토픽에 맞지 않는 글</label> <br>
                <input type="radio" id="r1">
                <label for="r1">토픽에 맞지 않는 글</label> <br>
                <input type="radio" id="r1">
                <label for="r1">토픽에 맞지 않는 글</label> <br>
                <input type="radio" id="r1">
                <label for="r1">토픽에 맞지 않는 글</label> <br>
        
                <textarea name="" style="resize: none;" placeholder=" 신고 사유 설명이 필요하신 경우 작성해주세요."></textarea>
                <br><button type="submit" id="rpt_btn">신고</button>
              </form>
            </div>
  
            </div>
            
          </div>
         </div>
      </div>
</body>
</html>
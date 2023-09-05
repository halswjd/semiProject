<%@page import="board.model.vo.Attachment"%>
<%@page import="board.model.vo.Board"%>
<%@page import="board.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Board b = (Board)request.getAttribute("b");
    // 글번호, 글제목, 글내용, 해시태그, 조회수, 닉네임, 말머리, 작성일자, 댓글수, 작성자유저번호

    String[] hashtagList = new String[20];
	
	if(b.getHashtag() != null){
	String hashtag = b.getHashtag().trim().replaceAll(" ", "");
	hashtagList = hashtag.split(",");				
	}

	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>자유게시판 작성</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <style>
        .outer{
            width: 1200px;
            /* border: 1px solid black; */
            margin: auto;
            margin-top: 50px;
            box-sizing: border-box;
        }
        .wrap{
            width: 800px;
            /* border: 1px solid red; */
            margin: auto;
            font-family: 'NanumBarunGothic';
            padding: 20px;
        }

        .wrap>form>div{
            margin: 20px;
            width: 100%;
        }
        .wrap>form>div>*{
            margin: 5px;
        }
        .wrap>form>div>label{
            font-size: 15px;
        }
        #btn{
            margin-top: 50px;
        }
        #btn>button{
            border: none;
            width: 80px;
            height: 50px;
            font-size: 16px;
            font-family: 'NanumBarunGothic';
        }
        input[type=text], select{
            width: 90%;
            height: 35px;
            padding-left: 5px;
        }
        label{
            display: inline-block;
        }
        .inHashtag{
            display: inline-block;
            border: 1px solid lightgray;
            padding: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            border-radius: 10%;
            color:white;
            background-color: rgb(190, 188, 188);
            margin-right: 4px;
            font-size: 15px;
        }

        #hashtag{
            padding-left: 10px;
            display: inline-block;
        }
        
        #ttl {
			color: rgb(149, 193, 31);
			font-weight: bolder;
			margin: 50px;
			letter-spacing: 5px;
		}
		
		#hashtagDelete{
			border:none;
            height: 30px;
            width: 50px;
            border-radius: 3px;
            font-size: 10px;
            margin-left: 25px;
		}
		#tag{margin-bottom: 5px;}
		#hashtag{
            margin: 0px;
            margin-left: 10px;
            margin-bottom: 5px;
        }
        #img-area>div{
            display: inline-block;
        }
        .img-div{
            position: relative;
        }
        .img-delete-btn{
            position: absolute;
            top: 10; right: 1px;
            border: none;
            background-color: black;
            color: white;
        }
        
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
        	<h1 align="center" id="ttl">자유게시판 작성</h1>
            <form action="<%= contextPath %>/update.bo" id="update-form" method="post" enctype="multipart/form-data">
            	<input type="hidden" value="<%= b.getBoardNo() %>" name="boardNo">
                <div>
                    <label>말머리</label><br>
                    <select name="subject" id="subject" style="width: 100px; " required>
                        
                    </select>
                </div>
                <div id="title">
                    <label>제목</label><br>
                    <input type="text" name="title" placeholder=" 제목을 입력해주세요" value="<%= b.getBoardTitle() %>" required>
                </div>
                <div id="content">
                    <label>본문</label><br>
                    <textarea name="content" style="resize: none; width: 89%; height: 300px; padding: 10px;" placeholder="내용을 입력해주세요" required><%= b.getBoardContent() %></textarea>
                </div>
                <div id="tag">
                    <label>태그</label><br>
                    <input name="hashtag" type="text" placeholder="해시태그 입력 후 스페이스바">
                </div>
                <div id="hashtag">
                    <!-- <div class="inHashtag"></div> -->
                    <% if(hashtagList != null){%>
                        <% for(String s:hashtagList){%>
                            <div class='inHashtag'># <%= s%></div>
                        <%} %>
                </div>
                    <button type="button" id="hashtagDelete" onclick="hashtagReset();" style="display:"";">지우기</button>
                    <%}%>
                <button type="button" id="hashtagDelete" onclick="hashtagReset();" style="display: none;">지우기</button>
                <input type="hidden" name="hashtagArr" id="result" value="<%= b.getHashtag()%>">
                
                <script>
                
                	// 해시태그 작성 함수
                    $("input[name=hashtag]").on("keydown",function(key){
                        if(key.keyCode==32) {
                            inputHashtag();
                        }
                    });

                    let input = "";
                    let result = [];
                    function inputHashtag(){

                        let ht = $("input[name=hashtag]").val();
                        input += "<div class='inHashtag'>#" + ht + "</div>";
                        result.push(ht);
                        test();                        
                    }
                    
                    function test(){
                        $("#hashtagDelete").css("display", "");
                        $("#hashtag").html(input);
                        $("input[name=hashtag]").val("");
                        $("#result").val(result);
                        console.log($("#result").val());
                    }

                    function hashtagReset(){
                        result=[];
                        input="";
                        $("#hashtag").html("");
                        $("#hashtagDelete").css("display", "none");
                    }
                </script>

                <div id="img-area">
                    <label>사진첨부</label><br>
                   		<%for(int j=0; j<list.size(); j++){ %>
                            <div class="img-div">
                                <img class="test" src="<%=contextPath %>/<%=list.get(j).getFilePath() %>/<%=list.get(j).getChangeName() %>" id="contentImg<%=j+1 %>" height="135" width="150" onclick="chooseFile(<%= j+1 %>);" >
                                <button class="img-delete-btn" type="button" onclick="deleteImg(<%=j+1%>);">x</button>
                                <input type="hidden" name="file<%=j+1 %>No" value="<%= list.get(j).getFileNo()%>">
                            </div>
                            <%} %>
                   		<%for(int i = list.size()+1; i<=3; i++){ %>
                   			<img src="" id="contentImg<%=i %>" height="135" width="150" onclick="chooseFile(<%= i %>);" >                   			
                   		<%} %>
                   		
                    <div style="display: none;">
                   		<input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
                        <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
                        <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
                    </div>
					
					<script>
					$(function(){
						console.dir($("#file1"));
						console.dir($("#file2"));
					})
					</script>
					
                </div>

                <div id="btn" align="center">
                    <button type="reset">취 소</button>
                    <button type="submit" style="background-color: rgb(149, 193, 31); color: white;">수 정</button>
                </div>

            </form>
            
            <script>
                let ch = "<%= b.getCategory()%>";
               	$(function(){
               		
	                // 카테고리 불러오는 함수
               		$.ajax({
               			url:"list.category",
               			success:function(list){
               				let result = "";
               				for(let i=0; i<list.length; i++){
               					
                                if(ch == list[i].categoryName){
                                    result += "<option value=" + list[i].categoryNo + " selected>"
                                            + list[i].categoryName + "</option>"    
                                }else{
                                    result += "<option value=" + list[i].categoryNo + ">"
                                               + list[i].categoryName + "</option>"
                                }
                                
               				}
               				
               				$("#subject").html(result);
               				
               			}, 
               			error:function(){
               				console.log("실패");
               			}
               		})
               		
               		
               		
               		
               	})
                
                
                
                
                function chooseFile(num){
                    $("#file"+num).click();
                }
				
                function loadImg(inputFile, num){
						console.dir(inputFile);
						console.log(inputFile.files);
						console.log(inputFile.files[0]);
                	
           			let a = "#contentImg" + num;
                	if(inputFile.files.length == 1){
                		
                		const reader = new FileReader();
                		
                		reader.readAsDataURL(inputFile.files[0]);
                		
                		reader.onload = function(e){
                			$(a).attr("src", e.target.result);
                		}
                	}else{
                			$(a).attr("src", null);
                	}
                }
                
                
                function deleteImg(num){
                	
                	let a = "#contentImg" + num;
                	$(a).attr("src", null);
                }     
             </script>
        </div>
    </div>
</body>
</html>
<%@page import="board.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }
        
        #ttl {
			color: rgb(149, 193, 31);
			font-weight: bolder;
			margin: 50px;
			letter-spacing: 5px;
		}
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div class="wrap">
        	<h1 align="center" id="ttl">자유게시판 작성</h1>
            <form action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
            	<input type="hidden" value="<%= loginMember.getUserNo()%>" name="userNo">
                <div>
                    <label>말머리</label><br>
                    <select name="subject" id="subject" style="width: 100px; " required>
                        
                    </select>
                </div>
                <div id="title">
                    <label>제목</label><br>
                    <input type="text" name="title" placeholder=" 제목을 입력해주세요" required>
                </div>
                <div id="content">
                    <label>본문</label><br>
                    <textarea name="content" style="resize: none; width: 89%; height: 300px; padding: 10px;" placeholder="내용을 입력해주세요" required></textarea>
                </div>
                <div id="tag">
                    <label>태그</label><br>
                    <input name="hashtag" type="text" placeholder="해시태그 입력 후 스페이스바">
                </div>
                <div id="hashtag">
                    <!-- <div class="inHashtag"></div> -->
                </div>
                <button type="button" onclick="hashtagReset();">지우기</button>
                <input type="hidden" name="hashtagArr" id="result">
                
                <script>
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

                        $("#hashtag").html(input);
                        $("input[name=hashtag]").val("");
                        $("#result").val(result);
                        console.log($("#result").val());
                    }

                    function hashtagReset(){
                        result=[];
                        input="";
                        $("#hashtag").html("");
                    }
                </script>

                <div id="tag">
                    <label>사진첨부</label><br>
                    <img src=""id="contentImg1" height="135" width="150" onclick="chooseFile(1);">
                    <img src="" id="contentImg2" height="135" width="150" onclick="chooseFile(2);">
                    <img src="" id="contentImg3" height="135" width="150" onclick="chooseFile(3);">
                    <div style="display: none;">
                        <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);">
                        <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
                        <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
                    </div>

                </div>

                <div id="btn" align="center">
                    <button type="reset">취 소</button>
                    <button type="submit" style="background-color: rgb(149, 193, 31); color: white;">등 록</button>
                </div>

            </form>
            
            <script>
                // 카테고리 불러오는 함수
               	$(function(){
               		$.ajax({
               			url:"list.category",
               			success:function(list){
               				let result = "";
               				for(let i=0; i<list.length; i++){
               					result += "<option value=" + list[i].categoryNo + ">"
               							+ list[i].categoryName + "</option>"
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
                     
             </script>
        </div>
    </div>
</body>
</html>
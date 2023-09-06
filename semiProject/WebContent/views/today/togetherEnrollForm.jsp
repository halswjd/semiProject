<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
    #ff1{font-family: 'NanumBarunGothicExtraLight';}
    #ff2{font-family: 'NanumBarunGothicLight';}
    #ff3{font-family: 'NanumBarunGothic';}
    #ff4{font-family: 'NanumBarunGothicBold';}

    /* div{border: 1px solid red; box-sizing: border-box;} */

    #write{
        width: 1200px;
        margin: auto;
        margin-bottom: 100px;
        margin-top:100px;
    }

    #write1, #write2, #write3, #write4, 
    #write5, #write6, #write7, #write8, 
    #write9, #write10, #write11, #write12{
        width: 670px;
        margin: 0 auto;
    }

    #searchimg{
            position: absolute;
            right: 460px;
            /* float: right; */
            margin: 12px 0 0 0;
            width: 15px;
            height: 15px;
            cursor: pointer;
        }

    #mtinput{
       float: right;
    }

    #top{width: 50px; height: 50px;}

    #dateIn{
        width: 650px;
    }

    input[type="number"]{
        width: 50px;
    }

	#ttl {
            color: rgb(149, 193, 31);
            font-weight: bolder;
            letter-spacing: 5px;
            margin-top:100px;
            margin-bottom:60px;
        }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div id="write">
    	 <h1 align="center" id="ttl">같이 등산행 작성</h1>
        <form action="<%= contextPath %>/insert.tg" method="post">
        	<input type="hidden" name="userNo" value="<%= loginMember.getUserNo() %>">
            <br>
            <div id="write2">
                <label id="ff4">제목</label><br><input type="text" name="title" style="width: 650px; margin: 5px 0 0 0;" maxlength="18" required>
            </div>
            <br>
            <div id="write3">
                <label id="ff4">내용</label><br><textarea name="content" cols="71" rows="8" style="resize: none;" required></textarea>
                <br>
            </div>
            <br>
            <div id="write4">
                <hr>
                <span id="ff4">모집인원</span>
                <br>
                <select name="people" required>
                    <option value="100">제한없음</option>
                    <option value="1">1명</option>
                    <option value="3">3명</option>
                    <option value="5" selected>5명</option>
                    <option value="7">7명</option>
                    <option value="10">10명</option>
                </select>
    
            </div>
            <div id="write5">
                <hr>
                <span id="ff4">🌄 산 이름</span>
                <br><input type="text" name="mountain" style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) 관악산" required>
            </div>
            <br>
            <div id="write7">
                <hr>
                <span id="ff4">📅 등산일자</span><br>
                <input type="date" name="date" id="dateIn" required>
                <hr>
            </div>
                <div id="write8">
                    <span id="ff4">🕒 시간</span><br><br>
                    <input type="radio" name="ampm" id="time1" value="오전" required><label for="time1">오전</label><br>
                    <input type="radio" name="ampm" id="time2" value = "오후"><label for="time2">오후</label>
                    <br><input type="number" name="time" min="1" max="12" required> 시<br><br>
                    <hr>
                 
                </div>
    
                <div id="write9">
                    <span id="ff4">📍 루트</span><br><br>
                    <input type="radio" name="course" id="none" value="미정"><label for="none"> 미정</label>
                    <input type="text" name="course" id="courseInput" style="width: 650px; margin: 5px 0 0 0;" placeholder="ex) ㅇㅇㅇ코스 OR 지점1 > 지점2 > ..."><br><br>
                    <hr>
                </div>
    
                <div id="write11">
                    <span id="ff4">🚌 교통</span> <span id="mtinput"></span><br><br>
                        <div id="ff4">
                            <input type="radio" name="transport" id="car" style="width: 17px; height: 17px; margin: 0 5px 0 0;" value="자차" required>
                            <label for="car">자차</label><br>
                            <input type="radio" name="transport" id="traffic" style="width: 17px; height: 17px; margin: 0 5px 0 0;" value="대중교통">
                            <label for="traffic">대중교통</label><br>
                            <input type="radio" name="transport" id="bus" style="width: 17px; height: 17px; margin: 0 5px 0 0;" value="버스대절">
                            <label for="bus">버스대절</label><br>
                            <input type="radio" name="transport" id="etc" style="width: 17px; height: 17px; margin: 0 5px 0 0;" value="기타">
                            <label for="etc">기타</label><br>                            
                        </div>
                </div>
            <br>
            <div align="right" id="write12">
                <button type="reset" class="btn btn-light" id="ff4">취소</button>
                <button type="submit" class="btn btn-primary" id="ff4">등록</button>
            </div>
            
            <div id="topbtn">
                <a style="display:scroll;position:fixed;bottom:10px;right:5px;" href="#" title="top">
                    <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top" alt="">
                </a> 
            </div>

        </form>

        <script>
            // 루트 radio controll 함수
            $("#none").click(function(){
                $("#courseInput").val("");
            });

            $("#courseInput").keydown(function(){
                $("#none").prop("checked", false);
            })

            $(function(){
                $("#none").prop("checked", true);
            })
        </script>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    
    
    <style>
        /* div{border: 1px solid red; box-sizing: border-box;} */
        body{font-family: 'NanumBarunGothic';}
        .wrap{
            text-align: center;
            width: 1200px; 
            height: 500px;
            margin: auto; 
            margin-top: 100px;
            font-family: 'NanumBarunGothic';  
        }
        
        #find>a{
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
        }
        #userId{
            color: white; 
            background-color: black;
            border: 1px solid gray;

        }
        #email{
            color: gray; 
            background-color: white; 
            border: 1px solid gray;
        }
        #userId, #email{
            width: 200px; 
            height: 50x; 
            line-height: 50px; 
            display: inline-block; 
            border-radius: 3px;

        }
        #name, #email2{
            height: 30px; 
            margin-top: 20px; 
            width: 400px; 
            font-family: 'NanumBarunGothic';
        }

        #userId, #name, #btn{
            margin-top: 30px;
        }

        #find input{
            height: 50px;
        }
        #btn{
            width: 400px; 
            height: 46px; 
            font-size: 18px; 
            line-height: 46px;
            background-color: black; 
            color: white; 
            cursor: pointer; 
            margin-top: 20px; 
            font-family: 'NanumBarunGothic';
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="wrap">
        <h1 id="findId">아이디 찾기</h1>
        <form action="" method="post" id="find">
            <a href="#" id="userId">아이디로 찾기</a>
            <a href="#" id="email">이메일로 찾기</a>
            <div>
                <input type="text" id="name" placeholder="이름">
            </div>
            <div>
                <input type="email" id="email2" placeholder="이메일">
            </div>
            <div>
                <button id="btn">휴대폰 인증하기</button>
            </div>

        </form>

    </div>


    <script>
        $(document).ready(function() {
            $("#email").click(function() {
                $(this).css("background-color", "black");
                $(this).css("color", "white");
                $("#userId").css("background-color", "white");
                $("#userId").css("color", "gray");
            });

            $("#userId").click(function() {
                $(this).css("background-color", "black");
                $(this).css("color", "white");
                $("#email").css("background-color", "white");
                $("#email").css("color", "gray");
            });
        });

    </script>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>
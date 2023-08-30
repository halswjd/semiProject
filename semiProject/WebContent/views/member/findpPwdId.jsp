<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   
    <style>
        div{border: 1px solid red; box-sizing: border-box;}
        
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
            width: 200px; 
            height: 50px; 
            line-height: 50px; 
            display: inline-block; 
            border-radius: 3px;
        }
        
        #userPwd{
            color: gray; 
            background-color:white;
            border: 1px solid gray;
        }
        
        #userId, #userPwd{
            width: 200px; 
            height: 50px; 
            line-height: 50px; 
            display: inline-block;
            border-radius: 3px;
        }
        #userId, #userPwd, #text{
            margin-top: 30px;
        }
        
        input{
            width: 200px; 
            height: 30px; 
            margin-top: 20px;
        }

        #text{
            margin-top: 20px; 
            font-size: 16px;
        }
        
        #btn{
            width: 400px; 
            height: 46px; 
            line-height: 46px; 
            display: inline-block; 
            font-size: 18px; 
            background-color: black;
            color:white; 
            margin-top: 20px; 
            border-radius: 3px;
            font-family: 'NanumBarunGothic';
        }

    </style>
</head>
<body>
    <div class="wrap">
        <h1>계정 찾기</h1>
        <form action="" method="post" id="find">
            <a href="#" id="userId">아이디</a>
            <a href="#" id="userPwd">비밀번호</a>
            <h4 id="text">휴대폰 본인인증을 통해</h4>
            <h4 id="text">비밀번호를 변경합니다.</h4>

            
            
            <button id="btn">휴대폰 인증하기</button>

        </form>

    </div>
</body>
</html>
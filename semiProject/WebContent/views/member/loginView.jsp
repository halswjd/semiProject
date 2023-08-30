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
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <style>
        div{/*border: 1px solid red;*/ box-sizing: border-box;}
        .wrap{
            width: 1200px; 
            height: 500px; 
            margin: auto; 
            margin-top: 100px; 
            font-family: 'NanumBarunGothic';
        }
        .wrap ul{
            width: 100%;
            text-align: center; 
            padding: 0;
        }
        .wrap li{
            display: inline-block;
            list-style: none; 
        }

        #text1{font-weight: 900; font-size: 45px;}
        #joinAnd a{
            text-decoration: none; 
            color:rgb(78, 80, 78); 
            text-align: center; 
            font-size: 15px;
            margin-top: 30px;
            margin-right: 20px;
            margin-left: 20px;
            
        } 
        #joinAnd a:hover{
            color: black; 
            text-decoration: none;
        }
       
        #password{margin-top: 10px;}

        #login{
            cursor: pointer; 
            margin-top: 10px; 
            width: 180px; 
            height: 50px; 
            background-color: black; 
            color: white; 
            font-size: 16px;
            font-family: 'NanumBarunGothic';
            border-radius: 5px;
        }
        #kakao{
            cursor: pointer; 
            width: 300px; 
            height: 50px; 
            margin-top: 10px; 
            background-color: white;
            color: rgb(78, 78, 78);
            border-color: rgb(194, 186, 186);
            font-family: 'NanumBarunGothic';
            background-color: #FEE500;
            margin-bottom: 10px;
        }
        #userId, #userPwd{
            width: 300px; 
            height: 50px; 
            margin-top: 10px; 
            font-size: 14px; 
            font-family: 'NanumBarunGothic';
        }
        #logining{margin-top: 30px; margin-bottom: 30px;}
        .login span{font-weight: 900; font-size: 15px;}
        .login button{border: none;}

        
    </style>
</head>

<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="wrap">
        
            <h1 align="center" id="text1">LOGIN</h1>
        

        <div id="content" align="center">
            <form action="<%= contextPath %>/login.me" method="post">

                <div class="input">
                    <input id="userId" type="text" name="userId" placeholder=" 아이디">
                </div>
    
                <div class="input">
                    <input id="userPwd" type="password" name="userPwd" placeholder=" 비밀번호">
                </div>
                
                <label for="remember">
                    <!-- <input type="checkbox" id="logining"> -->
                </label> <br>
                
                <div class="login">                    
                    <div>
                        <button type="submit" id="login"><span id="loginText1">LOGIN</span></button>

                    </div>

                    <div>
                        <!-- <button type="button" id="kakao"><span id="loginText2">카카오로 로그인</span></button> -->
                        <a href="javascript:kakaoLogin()"><img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="margin-bottom: 10px;"></a>
                    </div>
                    
                    <script type="text/javascript">
                        Kakao.init('8738b5d892935bea67960e7df126ad8e');
                        function kakaoLogin() {
                            Kakao.Auth.login({
                                success: function (response) {
                                    Kakao.API.request({
                                        url: '/v2/user/me',
                                        success: function (response) {
                                            alert(JSON.stringify(response))
                                        },
                                        fail: function (error) {
                                            alert(JSON.stringify(error))
                                        },
                                    })
                                },
                                fail: function (error) {
                                    alert(JSON.stringify(error))
                                },
                            })
                        }
                    </script>


                </div>
                	<ul id="joinAnd">
	                    <li><a href="<%= contextPath %>/enrollForm.me">회원가입</a></li>
	                    <li><a href="<%= contextPath %>/findId.me">아이디찾기 </a></li>
	                    <li><a href="<%= contextPath %>/findPwd.me">비밀번호찾기</a></li>
                  	</ul>
    
            </form>
        </div>
    </div>
    
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>
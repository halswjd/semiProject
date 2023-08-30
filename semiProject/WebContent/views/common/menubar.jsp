<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        div{box-sizing: border-box; font-family: 'NanumBarunGothic';}
        .mb_outer{
            width: 1200px;
            height: 120px;
            margin: auto;
            /* margin-top: 10px; */
            border-bottom: 1px solid gray;
            
        }
        .mb_outer>div{height: 100%; float: left;}
        .mb_menu-area{
            width: 70%; 
            /* border: 1px solid blue;  */
        }
        .mb_login-area{
            width: 30%; 
            /* border: 1px solid red; */
        }

        .mb_menu-area>div{height: 100%; float: left;}
        #mb_logo{width: 17%; height: 100%;}
        #mb_nav{width: 75%;}
        #mb_logo>img{
            display: block; 
            width: 80%; 
            height: 70%; 
            margin: auto;
            margin-top: 25px;
            /* border: 1px solid ; */
        }

        #mb_navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
        }

        #mb_navi li{
            float: left;
            text-align: center;
            width: 16%;
            /* border: 1px solid red; */
            height: 100%;
            margin-left: 4px;
            
        }
        
        #mb_navi a{
            text-decoration: none;
            color: rgb(78, 78, 78);
            font-size: 17px;
            font-weight: bold;
            display: block;
            height: 90%;
            width: 90%;
            line-height: 170px;
            cursor: pointer;
            margin: auto;
            /* border: 1px solid red; */
        }

        #mb_navi a:hover {
            border-bottom: 5px solid rgb(149, 193, 31);
        }


        .mb_login-area>div{
            height: 70%;
            float: left;
            margin-top: 40px;
            /* border: 1px solid black; */
        }
        #mb_user_1{
            width: 55%;
        }
        #mb_user_2{
            width: 45%;
        }
        #mb_user_1 img{
            border: 1px solid rgba(160, 160, 160, 0.453);
            border-radius: 50%;
            /* width: 55px;
            aspect-ratio: auto 55 / 55;
            height: px; */
        }

        #mb_user_2 a{
            text-decoration: none;
            font-size: 15px;
            color: gray;
        }
        
       #mb_logo:hover{
       		cursor:pointer;
       }

        
    </style>
</head>
<body>
    <div class="mb_outer">
        <div class="mb_menu-area">
            <div id="mb_logo" onclick="main();">
                <img src="/semi/resources/image/logo.png" alt="로고">
            </div>
            <div id="mb_nav">
                <ul id="mb_navi">
                    <li><a href="<%= contextPath %>/listView.bo">자유게시판</a></li>
                    <li><a href="#">질문게시판</a></li>
                    <li><a href="#">오등완 💪</a></li>
                    <li><a href="#">한국의 산</a></li>
                    <li><a href="#">같이 등산행</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>
            </div>
        </div>
        <script>
 			/*       
            */
            $(function(){
                // 해당 페이지 스타일부여하는 함수
                const a = location.href;
                const b = ["/listView.bo", "/detail.bo"];
                
                console.log(b[1]);
                let result = 0;
                
                for(let i=0; i<b.length; i++){
                	if(a.search(b[i]) != -1){
	                    $("#mb_navi").children().eq(0).children().css("border-bottom","5px solid rgb(149, 193, 31)");                	
                	}	
                }
                
            })
            function main(){
            	location.href = "<%= contextPath %>/main.jsp";
            }
        </script>
        
        <div class="mb_login-area">
	       <% if(loginMember != null){ %>
           <!-- 로그인 후 -->
            <div id="mb_user_1">

                <table align="center">
                    <tr height="75">
                        <th width="70"><img width="65" height="65" src="https://cdn-icons-png.flaticon.com/128/3985/3985429.png" alt=""></th>
                        <td width="150" style="font-size: 20px; padding-left: 8px;"><b><%= loginMember.getUserName() %> 님</b></td>
                    </tr>
                </table>


            </div>
            <div id="mb_user_2">
                <table align="center">
                    <tr height="75" align="center">
                        <td width="100"><a href="">마이페이지</a></td>
                        <td width="100"><a href="">로그아웃</a></td>
                    </tr>
                </table>
            </div>
			<%} else{ %>
            <!-- 로그인전 -->
            <div id="mb_user_1">

                <table align="center">
                    <tr height="75">
                        <th width="70"><img width="60" height="60" src="https://cdn-icons-png.flaticon.com/128/3985/3985429.png" alt=""></th>
                        <td width="100" style="font-size: 17px"><b>로그인하세요</b></td>
                    </tr>
                </table>

	
            </div>
            <div id="mb_user_2">
                <table align="center">
                    <tr height="75" align="center">
                        <td width="50"><a href="<%= contextPath %>/loginView.me">로그인</a></td>
                        <td width="70"><a href="<%= contextPath %>/enrollForm.me">회원가입</a></td>
                    </tr>
                </table>
            </div>
			<%} %>
        </div>
    </div>
</body>
</html>
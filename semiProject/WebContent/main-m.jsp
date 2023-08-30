<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOUNTAINEER</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        div{box-sizing: border-box; /*border: 1px solid red;*/}
        
        .wrap{
            width: 1200px;
            height: 1500px;
            margin: auto;
            font-family: 'NanumBarunGothic';
        }

        .wrap>div{
            width: 100%;
        }

        #header{height: 10%;}
        #navigator{height: 5%;}
        #main1{height: 30%;}
        #content{height: 55%;}
               
        #h1{width: 15%;}
        #h2{width: 50%;}
        #h3{width: 8%;}
        #h4{width: 10%;}
        #h5{width: 8%;}
        #h6{width: 8%;}
        /* dfsf */
        #con1{width: 45%;}
        #con2{width: 40%;}
        #con3{width: 15%;} 
        
        /* 헤더 */
        #header>div{
            height: 100%;
            float: left;
        }
        /* 로고 */
        #logo{
        display: block;
        width: 70%;
        height: 80%;
        margin: auto;
        margin-top: 8px;
        margin-right: px;
        /* border: 1px solid blue; */
        }

        /* 검색창 */
        #h2{
            position: relative;
           }
        #search_form{
            width: 90%; height: 30%;
            margin: auto;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            padding-left: 50px;
        }
        #search_form>div{height: 100%; float: left;  position: relative;}
        #search_text{width: 75%;}
        #search_btn{width: 10%; padding: 8px; border: 1px solid gray;}
        #search_form input{width: 100%; height: 100%;}

        /* 헤더 회원 */
        #header a{
            text-decoration: none;
            color: black;
            text-align: center;
            display: block; 
            font-size: 16px;
            font-weight: 550;
        }
        #h3 a{ 
            width: 70%;
            margin: auto;
            padding-top: 45px;
            }
        #h4 a, #h5 a, #h6 a{/*vertical-align: middle;*/ 
            padding-top: 60px;
        }
        #h4 a{font-size: 20px;}
        #profile{
            display: block; 
            /* width: 100%;  */
            transform: translateY(-15%);
            border: 1px solid rgba(160, 160, 160, 0.453);
            border-radius: 50%;
        }
        
        /* 네비 */
        #navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
        }
        #navi>li{
            float: left;
            text-align: center;
            width: 16.66667%;
            height: 70px;
            line-height: 70px;
        }
        #navi a{
            text-decoration: none;
            color: black;
            font-size: 17px;
            font-weight: 550;
            display: block;
            height: 60px;
            margin: auto;
        }
        #navi a:hover{
            text-decoration: none;
            border-bottom: 5px solid rgb(149, 193, 31);
            display: block;
        }

        /*메인1*/
        #main1>div{
            height: 100%;
        }
        
        .carousel-inner>.carousel-item>img{
            width: 1200px;
            height: 450px; 
        }
        
        /*컨텐트*/
        #content>div{
            height: 100%;
            float: left;
        }

        #con1>div, #con3>div{
            height: 33.3%;
        }
        
        #content a{
            text-decoration: none;
            color: black;
            font-size: 16px;
            padding: 10px;
        }

        #con2_1{height: 33.3%;}
        #con2_2{height: 66.6%;}

        #a1, #a2, #a3, #a4{
            height: 15%; 
            padding: 10px; 
            border-bottom: 1px solid #b3b0b0;
            width: 90%;
        }
        #b1, #b2, #b3, #b4{
            height: 85%;
            padding: 5px;
        }

        #a5{
            height: 7.5%; 
            padding: 10px; 
            border-bottom: 1px solid #b3b0b0;
            width: 90%;
        }
        #b5{height: 92.5%;}
        
        /* 광고1 */
        #add1, #add2{
            width: 100%; 
            height: 100%;
            padding: 15px;
        }

        #top{
            width: 50px; 
            height: 50px;
        }
        
        #navi a{
            font-weight: bolder;
            font-size: 19px;
            color: rgb(58,58,58);
        }
        #main1{
            margin-bottom: 25px;
        }

        .subtitle{
            font-size: 100px;
        }

    </style>
    
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="h1">
                <a href="#">
                    <img src="resources/image/logoBig.png" id="logo">
                </a>
            </div>
            <div id="h2">
                <form action="#" id="search_form">
                    <div id="search_text">
                        <input type="text" name="keyword">
                    </div>
                    <div id="search_btn">
                        <input type="image" id="search" src="https://cdn-icons-png.flaticon.com/128/2801/2801881.png">
                    </div>
                </form>
            </div>
            <div id="h3">
                <a href="#">
                    <img src="https://cdn-icons-png.flaticon.com/128/3985/3985429.png" id="profile" alt="" width="70" height="70">
                </a>
            </div>
            <div id="h4">
                <a href="#" style="font-weight: bolder; text-align: left; line-height: 1.2;">환영합니다</a>
            </div>
            <div id="h5">
                <a href="#">로그인</a>
            </div>
            <div id="h6">
                <a href="#">회원가입</a>
            </div>
            
            <!-- 
            <div id="h4">
                <a href="#" style="font-weight: bolder; text-align: left; line-height: 1.2;">차은우 님</a>
            </div>
            <div id="h5">
                <a href="#">마이페이지</a>
            </div>
            <div id="h6">
                <a href="#">로그아웃</a>
            </div>
        -->
            
            
           
        </div>
        <div id="navigator">
             <ul id="navi">
                    <li>
                        <a href="<%= contextPath %>/list.bo?cpage=1&test=10">자유게시판</a>
                    </li>
                    <li>
                        <a href="#">질문게시판</a>
                    </li>
                    <li>
                        <a href="#">오등완💪</a>
                    </li>
                    <li>
                        <a href="#">한국의 산</a>
                    </li>
                    <li>
                        <a href="#">같이 등산해요</a>
                    </li>
                    <li>
                        <a href="#">공지사항</a>
                    </li>
                </ul>
        </div>
        <div id="main1">
            <div id="demo" class="carousel slide" data-ride="carousel">

                <div class="carousel-inner">
                  <!-- 슬라이드 쇼 -->
                  <div class="carousel-item active">
                    <!--가로-->
                    <img class="d-block w-100" 
                      src="resources/image/mt.jpg"
                      alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/bag.jpg"
                      alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100"
                      src="resources/image/purple.jpg"
                      alt="Third slide">
                 </div>
                </div>
                
                <!-- / 슬라이드 쇼 끝 -->
            
                <!-- 왼쪽 오른쪽 화살표 버튼 -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <!-- <span>Previous</span> -->
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <!-- <span>Next</span> -->
                </a>
                <!-- / 화살표 버튼 끝 -->
                
                <!-- 인디케이터 -->
                <ul class="carousel-indicators">
                  <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
                  <li data-target="#demo" data-slide-to="1"></li>
                  <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <!-- 인디케이터 끝 -->
            </div>
            <script>
                $('.carousel').carousel({
                  interval: 5000 //기본 5초
                })
            </script>
            
        </div>

        <div id="content">
            <div id="con1">
                <div id="con1_1">
                    <div id="a1">
                    <a href="#" class="subtitle" style="font-size: 19px; font-weight: bolder;">주간예보</a>   
                    </div>
                    <div id="b1">
                    </div>
                </div>
                <div id="con1_2">
                    <div id="a2" >
                        <a href="#" style="font-size: 19px; font-weight: bolder;">
                            이번주 등산 일정
                            <img src="resources/image/location.png" alt="" width="15px">
                        </a>
                    </div>
                    <div id="b2">
                        <table>
                            <tr>
                                <td>8/25 금요일 도봉산 09:00 </td>
                            </tr>
                            <tr>
                                <td>8/25 금요일 도봉산 09:00</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="con1_3">
                    <div id="a3">
                        <a href="#" style="font-size: 19px; font-weight: bolder;">Editor's Pick!</a>
                    </div>
                    <div id="b3"></div>
                </div>
            </div>
            <div id="con2">
                <div id="con2_1">
                    <div id="a4">
                        <a href="#" style="font-size: 19px; font-weight: bolder;">인기글</a>
                    </div>
                    <div id="b4"></div>
                </div>

                <div id="con2_2">
                    <div id="a5">
                        <a href="#" style="font-size: 19px; font-weight: bolder;">실시간</a>
                    </div>
                    <div id="b5"></div>
                </div>
                
            </div>
            <div id="con3">
                <div id="con3_1">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzA4MjVfMjE0%2FMDAxNTAzNjU1MDIwNzIy.RW86PrajpO8ARPzK0DwjI0-Fi0m7rTgrplclQhjlyGog.ySLgC_RUMUA-BbWAFKuoUJLh2L-eHiuG-nyoldYW-uEg.JPEG.caprisun_zin%2F%25B6%25F3%25C7%25AA%25B8%25B6_%25282%2529.jpg&type=a340" id="add1">
                </div>
                <div id="con3_2">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzA4MjVfMTYy%2FMDAxNTAzNjU1MDIxMzAw.g5oPjCdudOh5UUZzXZEhg3rNvFzOZLghtGz6i0wmSqIg.yBmrtGSduhGVZlF_q2nEdg0p9198raV5V3FYT1l_Jy8g.JPEG.caprisun_zin%2F%25B6%25F3%25C7%25AA%25B8%25B6_%25285%2529.jpg&type=a340" id="add2">
                </div>
                <div id="con3_3" style="font-size: 18px; font-weight: bolder;"">
                    Top Writers
                </div>
            </div>
           
        </div>
    
        <div id="topbtn">
            <a style="display:scroll;position:fixed;bottom:10px;right:5px;" href="#" title="top">
                <img src="https://cdn-icons-png.flaticon.com/128/6469/6469473.png" id="top">
            </a> 
        </div>



    </div>

    <%@ include file="views/common/footerbar.jsp" %>
</body>
</html>
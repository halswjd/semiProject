<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* div{border: 1px solid red;} */
        .outer{
            width: 1200px; 
            box-sizing: border-box; 
            margin: auto;       
            font-family: 'NanumBarunGothic';  
        }
        #textJoin{margin-top: 100px;}
        #content{
            display: flex;
            justify-content: center;
            /* align-items: center; */
            
        }
        
        #addon_input>input{
            width: 200px; 
            border-top-width: 0;
            border-left-width: 0;
            border-right-width: 0;
            border-bottom-width: 1;
        }
        #addon_input>button{background-color: rgb(224, 222, 222); border: none; border-radius: 3px; height: 30px;}
        
        .title{
            font-size: 16px;
            font-weight: bold;
        }

        /* 자기소개 */
        #description{resize: none;}

        .submit>button{
            background-color: rgb(149, 193, 31);
            border: none;
            margin-top: 50px;
            height: 40px;
        }

        #pro{border-radius: 50%; width: 150px; height: 150px;}
        input, button, textarea{font-family: 'NanumBarunGothic';}

        #see{color: black;}
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div id="header">
            <h2 align="center" id="textJoin">회원가입</h2><br><br><br>
        </div>
        <div id="content">
            <form action="<%= contextPath %>/insert.me" id="enroll-form" method="post">

                <p class="title">아이디</p>
                <div id="addon_input">
                    <input type="text" class="input" name="userId" id="userId" placeholder="6-15자 영문, 숫자, 특수문자" required>
                    <button type="button" onclick="idCheck();">중복확인</button>
                </div>
                
                <script>
				function idCheck(){
					const $idInput = $("#enroll-form input[name=userId]"); 
					
					$.ajax({
						url:"idCheck.me",
						data:{checkId:$idInput.val()}, 
						success:function(result){
						 console.log(result);
							if(result == 'NNNNN'){ 
								alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
								$idInput.focus();
							}else{ 
								if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
									$("#enroll-form :submit").removeAttr("disabled"); 				
									$idInput.attr("readonly", true);
								}else{
									$idInput.focus();
								}
							}
						},
						error:function(){
							console.log("아이디 중복체크용 ajax 통신 실패!")
						}
					})
				}	
				</script>
                
                <br>
                <p class="title">비밀번호</p>

                <div id="addon_input">
                    <input type="password" name="userPwd" id="userPwd" placeholder="8-15자 영문, 숫자, 특수문자" required>
                </div>
                
                <br>
                <p class="title">비밀번호 확인</p>

                <div id="addon_input">
                    <input type="password" name="userPwd2" id="userPwd2" placeholder="비밀번호를 다시 입력해주세요." required> <br><br>
                </div>
                
                <br>
                <!-- <div id="uRadioBox">
                    <div class="title">개인정보유효기간</div> <br>
                  
                    <div id="uRadio">
                        <label>
                            <input type="radio" name="radio">
                            <span id="radio">탈퇴시까지</span>
                        </label>
                    </div>
                   
                    <div id="uRadio">
                        <label>
                            <input type="radio" name="radio" checked>
                            <span id="radio">1년</span> <br><br>
                        </label>
                    </div>
                   
                </div> -->
                
                <br>
                <p class="title">이름</p>
                
                <div id="addon_input">
                    <input type="text" name="userName" placeholder="이름을 입력해주세요." required>
                </div>
                
                <br>
                <p class="title">닉네임</p>
                
                <div id="addon_input">
                    <input type="text" name="nickname" placeholder="닉네임을 입력해주세요." required>
                    <button type="button" onclick="nickCheck();">중복확인</button>
                </div>
                
                <script>
				function nickCheck(){
					const $nickInput = $("#enroll-form input[name=nickname]"); 
					
					$.ajax({
						url:"nickCheck.me",
						data:{checkNick:$nickInput.val()}, 
						success:function(result){
						 console.log(result);
							if(result == 'NNNNN'){ 
								alert("이미 존재하거나 탈퇴한 회원의 닉네임입니다.");
								$nickInput.focus();
							}else{ 
								if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
									$("#enroll-form :submit").removeAttr("disabled"); 				
									$nickInput.attr("readonly", true);
								}else{
									$nickInput.focus();
								}
							}
						},
						error:function(){
							console.log("닉네임 중복체크용 ajax 통신 실패!")
						}
					})
				}	
				</script>
                
                
                
                <br>
                <p class="title">이메일</p>
                
                <div id="addon_input">
                    <input type="email" name="email" placeholder="이메일을 입력해주세요." required>
                </div>
                
                <br>
                <p class="title">휴대폰</p>
                
                <div id="addon_input">
                    <input type="text" name="phone" placeholder="01012345678" required>
                    <!-- <button type="button" id="msgCheck">인증번호받기</button> -->
                </div>
                
                <br>

                <div class="join_container">
                   
                    <div class="input_box">
                        
                        <p class="title">프로필 사진</p>
                        
                        <label class="upload">
                            <img id="pro" src="https://t3.ftcdn.net/jpg/03/46/83/96/240_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg" onclick="chooseFile();">
                        </label>
                            <input type="file" name="profile" id="profile" style="display: none;" width="150" height="150" onchange="loadImg(this);">
                   
                    </div>
                    
                    <script>
                    function chooseFile(){
                    	$("#profile").click();
                    }
                    
                    function loadImg(inputFile){
                    	if(inputFile.files.length == 1){
                            const reader = new FileReader();

                            reader.readAsDataURL(inputFile.files[0]);

                            reader.onload = function(e){
                               $("#pro").attr("src", e.target.result);
                            }
                        }else{
                            $("#pro").attr("src", null); 
                        }
                    }
                    </script>
                    
                    <div class="input_box">
                       
                        <p class="title">성별</p>
                        
                        <input type="radio" name="gender" value="M" > 남자
                        <input type="radio" name="gender" value="F" > 여자
                        <input type="radio" name="gender" value="N" > null
                   
                    </div><br>
                   
                    <div class="input_box">
                       
                        <p class="title">등력</p>
                        
                        <select name="gradeNo" class="input">
                            <option value="10">0~1년차</option>
                            <option value="20">1~3년차</option>
                            <option value="30">3~5년차</option>
                            <option value="40">5년차 이상</option>
                        </select>
                    
                    </div><br>
                    
                    <div class="input_box">
                        <p class="title">자기소개</p>
                        <textarea name="description" id="description" cols="30" rows="5" placeholder="소개를 작성해주세요." maxlength="30" style="resize: none;"></textarea>
                    </div>
                    <br>
                    <div class="input_box">
    
                        <p class="title">채널</p>
                        <div id="addon_input">
                            <label id="channel">인스타 instagram.com/</label>
                            <input class="input" type="text" name="instaId" placeholder="아이디를 입력해주세요">
                        </div>
                        
                    </div>
                   
                    <br><br>
                    
                    <div class="input_box">
                      
                        <!-- <p class="title">이용약관</p>
                        <input type="checkbox"> 모두 동의합니다. <a href="" id="see">[보기]</a> -->
                        <div>
                            <label><input type="checkbox" id="chk_all" name="agreement" value="selectAll"> 모두 동의합니다. </label>
                        </div>
                        <div>
                            <label><input type="checkbox" class="chk" id="chk1" name="agreement" value="terms1"> 이용약관(필수) [보기]</label>
                        </div>
                        <div>
                            <label><input type="checkbox" class="chk" id="chk2" name="agreement" value="terms2"> 개인정보 수집·이용 및 제3자 정보제공 (필수) [보기]</label>
                        </div>
                        
                    </div>
                    <script>

                        /* 체크박스 전체 선택, 전체 해제 */
                        $('.input_box').on('click', '#chk_all', function() {
                            console.log(this);
                            const checked = $(this).is(':checked');
                    
                            if (checked) {
                                $(this).parents('.input_box').find('input').prop('checked', true);
                            } else {
                                $(this).parents('.input_box').find('input').prop('checked', false);
                            }
                        });
                    
                        /* 개별 체크박스 항목이 선택 해제 될 때 전체선택 해제 */
                        $('.input_box').on('click', '.chk', function() {
                            let is_checked = true;
                    
                            $('.input_box .chk').each(function() {
                                is_checked = is_checked && $(this).is(':checked');
                            });
                    
                            $('#chk_all').prop('checked', is_checked);
                        });
                    </script>

                    <div class="submit" align="center">
                        <button type="submit" id="join" value="회원가입" onclick="return validate();">회원가입</button>
                        <button type="reset" id="reset" value="초기화">초기화</button>
                    </div> 
                </div>      
            </form>
        </div>
    </div>

			
			
            <script>
                function validate(){
                    const idInput = document.getElementById("userId");
                const pwdInput1 = document.getElementById("userPwd");
                const pwdInput2 = document.getElementById("userPwd2"); 
                const nameInput = document.getElementById("userName");

                // 1) 아이디 검사
                
                let regExp = /^[a-z][a-z\d]{5,14}$/;
                if(!regExp.test(idInput.value)){
                    alert("유효한 아이디를 입력해주세요!");
                    idInput.select(); 
                    return false;
                }

                // 2) 비밀번호 검사
                
                regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
                if(!regExp.test(pwdInput1.value)){
                    alert("유효한 비밀번호를 입력해주세요!")
                    pwdInput1.value = ""; // 지움
                    pwdInput1.focus();
                    return false;
                }

                // 3) 비밀번호 일치
                if(pwdInput1.value != pwdInput2.value){
                    alert("동일한 비밀번호를 입력해주세요!");
                    pwdInput2.value = "";
                    pwdInput2.focus();
                    return false;
                }

                // 4) 이름 
                //    한글(결합형태)로만 두글자 이상
                regExp = /^[가-힣]{2,}$/;
                if(!regExp.test(nameInput.value)){
                    alert("유효한 이름을 입력해주세요!")
                    nameInput.select();
                    return false;
                }

                }
                

            </script>
      		
	<%@ include file="../common/footerbar.jsp" %>
	
    
</body>
</html>
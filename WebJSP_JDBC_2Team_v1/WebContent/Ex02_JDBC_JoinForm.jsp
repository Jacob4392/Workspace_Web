<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	table {
		border: solid 2px black;
		border-collapse: collapse;
	}
	
	tr {
		border: solid 1px blue;
		background-color: white;
		color: black;
	}
	
	td {
		border: solid 1px red;
	}
	</style>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		//jquery 로 간단하게 유효성 check 하기
		$(function() {
			$('#joinForm').submit(validate);
		});
		function validate() {
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#mname').val() == "") { // 이름 검사
				alert('mname를 입력해 주세요.');
				$('#mname').focus();
				return false;
			} else if ($('#age').val() == "") { // 나이 검사
				alert('age를 입력해 주세요.');
				$('#age').focus();
				return false;
			} else if ($('#email').val() == "") { // 우편번호
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			}
		}
		
		$(function(){
			$('#btn').click(function(){
				if($('#id').val() == ""){
					alert("ID 입력바랍니다");
					$('#id').focus();
				}else{
					$('#valid').empty();
					$.ajax(
							{
								//http://192.168.0.169:8090/WebJSP_JDBC_2Team/JoinCheckIdServlet
								url:"JoinCheckIdServlet",
								data:{id:$('#id').val()},
								dataType:"html",
								success:function(responsedata){
									console.log(">"+responsedata+"<");
									if($('#id').focus()){
										
									}
									if(responsedata == "true"){
										$('#valid').css("display","inline");
										$('#valid').css("color","green");
										$('#valid').css("font-size","12px");
										$('#valid').html( "사용 가능한 아이디입니다." );
										$('#pwd').focus();
									}else{
										$('#valid').css("display","inline");
										$('#valid').css("color","red");
										$('#valid').css("font-size","12px");
										$('#valid').html( "중복된 아이디입니다." );
										$('#id').val("");
										$('#id').focus();
									}
								},
								error:function(){
									
								}
							}
						)
				}
				
			});
		});
		
	</script>

</head>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<form action="JoinServlet" method="post" name="joinForm"
					id="joinForm">
					<h3 style="text-align: center;">회원가입</h3>
					<div>
						<table
							style="width: 500px; height: 200px; margin-left: auto; margin-right: auto;"> 
							<tr>
								<th>ID:</th>
								<td>
									<input type="text" name="id" id="id">
									<input type="button" name="btn" id="btn" value="중복검사">
									<span id="valid"><!-- 아이디 중복체크 표시장소 --></span>
								</td>
								
							</tr>
							<tr>
								<th>PWD:</th>
								<td><input type="password" name="pwd" id="pwd"></td>
							</tr>
							<tr>
								<th>Name:</th>
								<td><input type="text" name="mname" id="mname"></td>
							</tr>
							<tr>
								<th>age:</th>
								<td><input type="number" name="age" id="age" maxlength="3"></td>
							</tr>
							<tr>
								<th>Gender:</th>
								<td><input type="radio" name="gender" id="gender" value="여"
									checked>여자 <input type="radio" name="gender"
									id="gender" value="남">남자</td>
							</tr>
							<tr>
								<th>Email:</th>
								<td><input type="text" name="email" id="email"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="회원가입">
									<input type="reset" value="취소"></td>
							</tr>
						</table>

					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>
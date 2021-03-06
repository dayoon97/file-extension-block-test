<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>플로우 과제 페이지</title>
</head>
<body>
	 <table>	
		<tr>
			<td>고정 확장자</td>
			<td><input type="checkbox" class="fix" id="bat">bat</td>
			<td><input type="checkbox" class="fix" id="cmd">cmd</td>
			<td><input type="checkbox" class="fix" id="com">com</td>
			<td><input type="checkbox" class="fix" id="cpl">cpl</td>
			<td><input type="checkbox" class="fix" id="exe">exe</td>
			<td><input type="checkbox" class="fix" id="scr">scr</td>
			<td><input type="checkbox" class="fix" id="js">js</td>
		</tr>
		<tr>
			<td>커스텀 확장자</td>
			<td colspan="3"><input type="text" placeholder="확장자 입력" id="addFileExtName"></td>
			<td colspan="3"><input type="button" value="+추가" id="addBtn"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="7">
				<div id="addTextarea">
					<div id="count-area">
						<div id="count-cont-area"> 0/200</div>
					</div>
					<div id="fileExt-area"></div>
				</div>
			</td>
		</tr>
	</table>
</body>
<script>
	var typeArr = [];

	//새로고침 후 체크박스 유지
	window.onload = function(){
		$.ajax({
			url: "selectCheckFile.fi",
			type: "post",
			dataType: "json",
			success : function(data){
				var typeNameArr = [];
				var dataList = data.CheckedList;
				
				var selectFileExt = $.each(dataList, function(index, value){
					typeNameArr.push(value.fileExtensionName);
				});
				
				for(var i = 0; i < typeNameArr.length; i++){
					$("#"+typeNameArr[i]).attr('checked', true);
				}
				
				for(var i = 0; i < arr.length; i++){
					$("#"+arr[i]).attr('checked', true);
				}
			}
		});
		var output = localStorage.getItem("typeArr");
		
		var arr = JSON.parse(output);
		console.log(arr);
		
		for(var i = 0; i < arr.length; i++){
			$("#"+arr[i]).attr('checked', true);
		}
		
	}

	//고정확장자 체크 여부 확인
	$(document).on('change', '.fix', function(event){
		
		var typeElement = event.target;			//체크박스를 체크하면 Element를 변수에 담는다.
		var typeId = typeElement.id;			//체크한 Element의 Id를 변수에 담는다.
		
		var checkYN = "";
		
		if($("#"+typeId).is(":checked")){		
			checkYN = "Y";
			updateFileCheck(typeId, checkYN);
			
			typeArr.push(typeId);
			localStorage.setItem("typeArr", JSON.stringify(typeArr));
		} else {
			checkYN = "N";
			updateFileCheck(typeId, checkYN);
			
			for(var i = 0; i < typeArr.length; i++){
				if (typeId == typeArr[i]){
					typeArr.splice(i, 1);
				}
			}
			localStorage.setItem("typeArr", JSON.stringify(typeArr));
		}
		
	
	
	//체크박스 Y/N변경	
	function updateFileCheck(typeId, checkYN){
		$.ajax({
			url: "updateCheckFile.fi",
			type: "post",
			data: {"fileExtensionName" : typeId, "fileExtensionYN" : checkYN},
			dataType: "json"
		});
	};
	    
	});
	
	//커스텀 확장자 개수 변수
	var count = 0;
	
	//커스텀 확장자 이름 변수
	var addFileExtName = "";
	
	//커스텀 확장자 추가 함수
	$(document).on('click', '#addBtn', function(){
		if($("#addFileExtName").val().length >= 20){
			alert("20자 이상 입력할 수 없습니다.");
			
			clearInput();
		} else {
			addFileExtName = $("#addFileExtName").val();
			
			clearInput();
			
			if(addFileExtName == ""){
				alert("확장자 이름을 입력하세요");
			} else {
				if(count >= '200'){
					alert("더이상 입력할 수 없습니다.");
				} else {
					duplicateCheck(addFileExtName);
				}
			}
		}
		
	});
	
	//중복 체크 함수
	function duplicateCheck(addFileExtName){
		$.ajax({
			url: "duplicateCheck.fi",
			type: "post",
			data: {"fileExtensionName" : addFileExtName},
			dataType: "json",
			success : function(data){
				if(data >= 1){
					alert("이미 존재하는 확장자입니다.");
				} else if(data == 0) {
					addFileExt(addFileExtName);
				}
			}
		});
	}
	
	//확장자 추가 함수
	function addFileExt(addFileExtName){
		var fileExtType = '커스텀';
		
		switch(addFileExtName){
			case 'bat' : fixFileExt(); break;
			case 'cmd' : fixFileExt(); break;
			case 'com' : fixFileExt(); break;
			case 'cpl' : fixFileExt(); break;
			case 'exe' : fixFileExt(); break;
			case 'scr' : fixFileExt(); break;
			case 'js' : fixFileExt(); break;
			default : 
			$.ajax({
				url: "insertFileExt.fi",
				type: "post",
				data: {"fileExtensionName" : addFileExtName, "fileExtensionType" : fileExtType},
				dataType: "json",
				success : function(data){
					if(data > 0){
						count++;
						$("#count-cont-area").remove();
						$("#count-area").append("<div id='count-cont-area'>" + count + "/200</div>");
						$("#fileExt-area").append("<div class='extBtn'>" + addFileExtName + "<div class='delete-ext-area'>X</div></div>");
					}
				}
			});
		}
	};
	
	function fixFileExt(){
		alert("고정 확장자는 입력이 불가능합니다.");
	}
	
	
	//input text값 초기화
	function clearInput(){
		var inputTextBox = document.getElementById('addFileExtName');
		
		inputTextBox.value = '';
	};
	
	//커스텀 확장자 삭제 클릭 이벤트
	$(document).on('click', '.delete-ext-area', function(event){
		
		var typeElement = event.target;							//체크박스를 체크하면 Element를 변수에 담는다.
		var typeId = typeElement.parentElement.innerText; 		//부모의 text를 담는다.
		var typeArr = typeId.split("\n"); 						//엔터키를 기준으로 분리한 후 배열에 담는다.
		var extName = typeArr[0]; 								//이름을 변수에 담는다.
		
		var typeParentEle = typeElement.parentElement; 			//부모 엘리먼트를 변수에 담는다.
		typeParentEle.parentNode.removeChild(typeParentEle);	//커스텀 확장자를 지운다.
		deleteExtName(extName);									//지우는 함수를 실행한다.
	});
	
	//커스텀 확장자 삭제 실행 함수
	function deleteExtName(extName){
		$.ajax({
			url: "deleteFileExt.fi",
			type: "post",
			data: {"fileExtensionName" : extName},
			dataType: "json",
			success : function(data){
				if(data > 0){
					count--;
					$("#count-cont-area").remove();
					$("#count-area").append("<div id='count-cont-area'>" + count + "/200</div>");
				}
			}
		});
	};
</script>
</html>
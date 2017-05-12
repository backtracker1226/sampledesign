<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	
	<form role="form3" method="post" id="up">
	
			<div class="form-group">
		<label for="exampleInputEmail2">bno</label> <input type="text"
			name="bno" class="form-control" readonly="readonly" value="${vo.bno}">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">title</label> <input type="text"
			name="title" class="form-control" value="${vo.title}">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">content</label>
		<textarea name="content" class="form-control" style="height: 500px">${vo.content}</textarea>
	</div>
		<div class="form-group">
		<label for="exampleInputPassword1">writer</label> <input type="text"
			name="writer" class="form-control" readonly="readonly" value="${vo.writer}">
	</div>
	
				



	<button type="submit" id="mody">Submit</button>
	<button type="submit" id="list">리스트</button>
	
	


	</form>
	

	

	
	

	<script>
	
	$(document).ready(function(){
		
		var formObj = $("form[id='up']");
		
		$('#mody').on("click", function(e){
			alert("수정 되었습니다.");
			formObj.submit();
		});
		
		$('#list').on("click", function(e){

		self.location = "/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+"&type=${cri.type}&keyword=${cri.keyword}";
	 }); 
		
	});
	
   </script>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<div class="box box-primary">
	<div class="box-header with-border">
		<input type="hidden" name="bno" value="${view.bno}">
		<h3 style="text-align: center;">${view.title}</h3>
		<h3 style="text-align: right;">작성자 : ${view.writer}</h3>
		<h5 style="text-align: right;">작성일 : ${view.regdate}</h5>
		<div class="form-group">
				<!-- 제목 및 내용 변경 부분 -->
					<label for="exampleInputEmail1"></label>
				<textarea name="content" class="form-control" readonly="readonly"
					style="height: 500px">${view.content}</textarea>
			</div>
		<button type="submit" value="삭제" id="deleteBtn">삭제</button>
		<button type="submit" value="수정" id="modifyBtn">수정</button>
	</div>
	
	
	<!-- /.box-header -->
	<!-- form start -->

	<!-- 삭제 버튼 -->
	<form role="form" method="POST" id="fd" >
		<input type="hidden" name="bno" value="${view.bno}" /> 

		<input type="hidden" name="type" value="${cri.type}" /> 
		<input type="hidden" name="keyword" value="${cri.keyword}" /> 
		<input type="hidden" name="page" value="${cri.page}" /> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" /> 
		
		<div class="box-footer">

		<button type="submit" value="리스트" id="listBtn">리스트</button>
	</div>
	</form>

</div>


<script>
	$(document).ready(function() {

		var formObj = $("form[id='fd']");
		
		var select;

		$('#deleteBtn').on("click", function(e) {
			
			select=confirm("삭제 하시겠습니까?")
			if(select){
				formObj.attr("action", "/delete");
				formObj.submit();
				alert("삭제 되었습니다.");
			}else{
				formObj.attr("method", "get")
				formObj.attr("action", "/list");
				formObj.submit();
			}
		});

		$('#modifyBtn').on("click", function(e) {
			
			
 			formObj.attr("method", "get");
			formObj.attr("action", "/update");
			formObj.submit(); 

		});
		
		$("#listBtn").on("click", function(e){
			formObj.attr("method", "get")
			formObj.attr("action", "/list");
			formObj.submit();
			
		});

	}); 
</script>
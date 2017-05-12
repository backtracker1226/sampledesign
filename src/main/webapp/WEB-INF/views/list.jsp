<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<div class="box">
	<div class="box-header">
		<h3 class="box-title">자유 게시판</h3>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<div id="example2_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap">
			<div class="row">
				<div class="col-sm-6"></div>
				<div class="col-sm-6"></div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table id="example2"
						class="table table-bordered table-hover dataTable" role="grid"
						aria-describedby="example2_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1" aria-sort="ascending"
									aria-label="Rendering engine: activate to sort column descending">게시물
									번호</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Browser: activate to sort column ascending">제목</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Platform(s): activate to sort column ascending">작성자</th>
								<th class="sorting" tabindex="0" aria-controls="example2"
									rowspan="1" colspan="1"
									aria-label="Engine version: activate to sort column ascending">작성
									일자</th>
							</tr>
						</thead>

						<!-- 이 부분이 게시물 view 수정 부분 입니다. -->

						<tbody>
							<c:forEach items="${list}" var="board">
								<tr role="row" class="odd">
									<td>${board.bno}</td>
									<%--     <td><a href="/view?bno=${board.bno}">${board.title}</td></a> --%>
									<td>
									
									 <a href='/view${pager.makeSearch(pager.cri.page)}&bno=${board.bno}'>${board.title}</td>
									</a>
									
									<td>${board.writer}</td>
									<td>${board.regdate}</td>
									
									
								</tr>
							</c:forEach>
						</tbody>


						<script>
							
						</script>

						<!-- 이 부분이 게시물 view 수정 부분 입니다. -->
						<tfoot>

						</tfoot>
					</table>
				</div>
			</div>


			<div class="row">
				<div class="col-sm-5">
					<div class="dataTables_info" id="example2_info" role="status"
						aria-live="polite"></div>
				</div>
				<div class="col-sm-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="example2_paginate">
						<ul class="pagination">


							<c:if test="${pager.prev == true}">
								<li class="paginate_button previous" "><a
									href="list${pager.makeSearch(pager.start - 1)}"
									aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
							</c:if>


							<c:forEach var="pages" begin="${pager.start}" end="${pager.end}">


								<li class='${pages == pager.current ? "paginate_button active":""}' >

									<a href="${pages}" aria-controls="example2" data-dt-idx="3" tabindex="0">${pages}</a>

								</li>

							</c:forEach>


							<c:if test="${pager.next == true }">
								<li class="paginate_button next" ><a href="list${pager.makeSearch(pager.end + 1)}"
									aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li>
							</c:if>
						</ul>
					</div>

					
					<select name="type">
						<option value='x' <c:out value = "${cri.type eq 'x' ? 'selected':''}"/>>----</option>
						<option value='n' <c:out value = "${cri.type eq 'n' ? 'selected':''}"/>>제목</option>
						<option value='c' <c:out value = "${cri.type eq 'c' ? 'selected':''}"/>>내용</option>
						<option value='nc' <c:out value = "${cri.type eq 'nc' ? 'selected':''}"/>>제목+내용</option>
						<option value='w' <c:out value = "${cri.type eq 'w' ? 'selected':''}"/>>작성자</option>
					</select> 
					
					<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">

					<button id='searchBtn'>Search</button>

					<button type="submit" style="float: right;" class="writeBtn">
						<a href="http://localhost:8080/write">새글쓰기</a>
					</button>

				</div>

			</div>
		</div>
	</div>

	<!-- /.box-body -->
</div>
<form id="pagingForm">

<input type="hidden" name="page" value=${pager.cri.page}>
<input type="hidden" name="perPageNum" value=${pager.cri.perPageNum}>
<input type="hidden" name="type" value=${pager.cri.type}>
<input type="hidden" name="keyword" value=${pager.cri.keyword}>

</form>



<script>
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
		
	}
	$(document).ready(function(){
		$('#searchBtn').on("click", function(event){
			self.location = "list"
/*  			+'${pager.makeSearch(1)}' */
			+"?page=1"
			+"&type="
			+$("select option:selected").val()
			+"&keyword="+encodeURIComponent($('#keywordInput').val());
		});
	});
	
	$(".pagination a").on("click", function(event){
	
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#pagingForm");
		
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "list").attr("method", "get");
		
		jobForm.submit();
		
	});

</script>





<%@include file="include/footer.jsp"%>
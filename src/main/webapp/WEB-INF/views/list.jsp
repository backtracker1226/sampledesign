<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@include file="include/header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<div class="box">
            <div class="box-header">
              <h3 class="box-title">자유 게시판</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div><div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                <thead>
                <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">게시물 번호</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">제목</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">작성자</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">작성 일자</th></tr>
                </thead>
                <!-- 이 부분이 게시물 view 수정 부분 입니다. -->
                  
                <tbody>            
                <c:forEach items="${list}" var="board" >
                <tr role="row" class="odd">
                  <td>${board.bno}</td>
                  <td><a href="/view?bno=${board.bno}">${board.title}</td></a>
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
              </table></div></div>
              
              
              <div class="row"><div class="col-sm-5">
              <div class="dataTables_info" id="example2_info" role="status" aria-live="polite"></div></div>
              <div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
              <ul class="pagination"><li class="paginate_button previous disabled" id="example2_previous">
              <a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li><li class="paginate_button active">
              <a href="list?page=1" aria-controls="example2" data-dt-idx="3" tabindex="0">1</a></li><li class="paginate_button ">
              <a href="list?page=2" aria-controls="example2" data-dt-idx="3" tabindex="0">2</a></li><li class="paginate_button ">
              <a href="list?page=3" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button ">
              <a href="list?page=4" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button ">
              <a href="list?page=5" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button ">
              <a href="list?page=6" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a></li><li class="paginate_button ">
              <a href="list?page=7" aria-controls="example2" data-dt-idx="7" tabindex="0">7</a></li><li class="paginate_button ">
              <a href="list?page=8" aria-controls="example2" data-dt-idx="8" tabindex="0">8</a></li><li class="paginate_button ">
              <a href="list?page=9" aria-controls="example2" data-dt-idx="9" tabindex="0">9</a></li><li class="paginate_button ">
              <a href="list?page=10" aria-controls="example2" data-dt-idx="10" tabindex="0">10</a></li><li class="paginate_button next" id="example2_next">
              <a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">Next</a></li></ul></div></div></div></div>
            </div>
            <!-- /.box-body -->
          </div>
 

  
<%@include file="include/footer.jsp"%>
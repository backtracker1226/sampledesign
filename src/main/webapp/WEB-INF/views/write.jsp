<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@include file="include/header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
          
          <form method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">title</label>
    <input type="text" name="title" class="form-control"  >
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">content</label>
    <textarea name="content" class="form-control" rows="4" cols="50"></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">writer</label>
    <input type="text" name="writer" class="form-control" >
  </div>
  
 <button type="submit" class="registerBtn">Submit</button>
 <button type="submit" ><a href="/list?page=${pager.current}">리스트</button></a>
 
           <script>
          
           $(document).ready(function(){
        	  
        	  $(".registerBtn").on("click",function(){
        		  alert("등록 되었습니다");
        	  });
        	  
          });
          
          </script>
</form>
         
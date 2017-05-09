<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@include file="include/header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
<div class="box box-primary">
            <div class="box-header with-border">
              <h3 style="text-align: center;">${view.title}</h3>
              <h3 style="text-align: right;">작성자 : ${view.writer}</h3>
              <h5 style="text-align: right;">작성일 : ${view.regdate}</h5>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form">
              <div class="box-body">
                <div class="form-group">
                <!-- 제목 및 내용 변경 부분 -->
                
                
                  <label for="exampleInputEmail1"></label>
                  <textarea name="content" class="form-control" readonly="readonly" style="height: 500px">${view.content}</textarea>
                </div>
                
                
                
                <!-- 제목 및 내용 변경 부분 -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
         
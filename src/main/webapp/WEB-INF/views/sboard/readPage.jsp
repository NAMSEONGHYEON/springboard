<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>





<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	
	
	//글 수정하기
	$(".btn-warning").on("click", function(){
		formObj.attr("actioin", "/sboard/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
		/* self.location="/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"; */
	});
	/* $(".modifyBtn").on("click", function(){
		formObj.attr("actioin", "/board/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	}); */
	
	
	//글 지우기
	$(".btn-danger").on("click", function(){
		alert("1");
		formObj.attr("action", "/sboard/removePage");
		alert("2");
		formObj.submit();
		alert("3");
	});
	/* $(".removeBtn").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	}); */
	
	//메뉴로 돌아가기
	$(".btn-primary").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list");
		formObj.submit();
	});
	
	/* $(".goListBtn").on("click",function(){
		formObj.attr("method","get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
	}) */
});
</script>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				
				<form role="form" method="post">
					<input type='hidden' name='bno' value="${boardVO.bno}">
				</form>
				
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label>
						<input type="text" name="title" class="form-control" value="${boardVO.title }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content }</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label>
						<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly">
					</div>
				</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-warning modifyBtn">Modify</button>
					<button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
					<button type="submit" class="btn btn-primary goListBtn">LIST</button>
				</div>
				<form role="form" action="modifyPage" method="post">
					<input type='hidden' name='bno' value="${boardVO.bno}">
					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>
			</div>
		</div>			
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

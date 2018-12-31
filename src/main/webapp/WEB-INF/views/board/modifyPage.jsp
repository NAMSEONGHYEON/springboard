<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	var result='${msg}';
	
	if(result =='seccess'){
		alert("처리가완료되었습니다.");
	}
</script>



<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	
	$(".btn-primary").on("click", function(){
		formObj.submit();
	});
});
</script>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
			
			
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				
				
				
				<form role="form" action="modifyPage" method="post">
				<%-- 	<input type='hidden' name='bno' value="${boardVO.bno}">
				</form> --%>
					<input type='hidden' name='page' value="${cri.page}">
					<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
				<div class="box-body">
				
					<div class="form-group">
						<label for="exampleInputEmail1">BNO</label>
						<input type="text" name="bno" class="form-control" value="${boardVO.bno }" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label>
						<input type="text" name="title" class="form-control" value="${boardVO.title }">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3">${boardVO.content }</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label>
						<input type="text" name="writer" class="form-control" value="${boardVO.writer }" />
					</div>
				</div>
				</form>
				
				
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>
				
				
				
			</div>
		</div>			
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

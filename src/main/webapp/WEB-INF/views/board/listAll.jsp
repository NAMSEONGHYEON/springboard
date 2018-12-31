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



<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST ALL PAGE</h3>
				</div>
				<div class="box-body">
					<table class="table table-boarded">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>
						
					<c:forEach items="${list}" var="boardVO">
						<tr>
							<td>${boardVO.bno}</td>
							<td><a href='/board/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
							<td>${boardVO.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
							<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
						</tr>
					</c:forEach>	
					</table>
				</div>
				<div class="box-footer">Footer</div>	
			</div>
		</div>			
	</div>
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>

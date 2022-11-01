<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class="w-50 mt-5">
		<h1></h1>
		<table class="table text-center table-bordered">
			<thead class="bg-light">
				<tr >
					<th width="25%">번호</th>
					<th width="25%">제목</th>
					<th width="25%">작성날짜</th>
					<th width="25%">수정날짜</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${postList}" var="post">
				<tr>
					<td>${post.id}</td>
					 <td><a href="/post/post_detail_view?postId=${post.id}">${post.subject}</a></td>
					<td><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${post.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<%-- 페이징 --%>
		<div class="d-flex justify-content-center">
		<c:if test="${prevId ne 0 }">
			<a href="/post/post_list_view?prevId=${prevId}" class="mr-5"> &lt;&lt;이전 </a>
		</c:if>
		<c:if test="${nextId ne 0 }">
			<a href="/post/post_list_view?nextId=${nextId}"> 다음&gt;&gt; </a>
		</c:if>
		</div>
		
		<div class="d-flex justify-content-end">
			<a href="/post/post_create_view" class="btn btn-primary">글쓰기</a>
		</div>
		
	</div>
</div>
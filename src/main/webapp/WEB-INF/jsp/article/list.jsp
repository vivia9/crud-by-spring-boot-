<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<h2 class="con">전체 게시물 개수 : ${totalCount}</h2>

<div class="con">
	<c:forEach items="${list}" var="article">
		<section>
			번호 : ${article.id}, 제목 :
				${article.title}, 조회수 : ${article.hit}
		</section>
		<hr>
	</c:forEach>
</div>

<div class="btns con">

</div>

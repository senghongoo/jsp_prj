<%@ page language="java" pageEncoding="UTF-8"%>
<c:if test="${ empty sessionScope.userId  }">
	<c:redirect url="${ CommonURL }/login/loginFrm.jsp"/>
</c:if>
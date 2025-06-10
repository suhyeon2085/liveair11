<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script>
	var msg = "<c:out value = '${msg}'/>"
	var url = "<c:out value = '${url}'/>"
	
	alert(msg);
	location.href = url;
</script>
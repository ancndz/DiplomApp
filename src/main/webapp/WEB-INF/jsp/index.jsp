<%@ page contentType="text/html;charset=cp1251"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Главная</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<h2>${message}</h2>

<a href="${pageContext.request.contextPath}/calculations">Оптимальный расчет страхового запаса</a>

</body>

</html>
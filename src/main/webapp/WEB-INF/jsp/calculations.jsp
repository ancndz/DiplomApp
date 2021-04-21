<%@ page contentType="text/html;charset=cp1251" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Расчет</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<h2>Оптимальный расчет страхового запаса</h2>

<%--@elvariable id="poc" type="ru.ancndz.calculations.PercentageOfDemand"--%>
<form:form method="POST" action="/calculations/poc" modelAttribute="poc">
    <table>
        <caption>Расчет оптимального запаса для товаров с длительным, <br>
            но постоянным временем выполнения заказа и довольно постоянным спросом.
        </caption>
        <tr>
            <td><form:label path="leadTime">Планируемое время выполнения заказа: </form:label></td>
            <td><form:input path="leadTime"/></td>
        </tr>
        <tr>
            <td><form:label path="dailyDemand">Дневной спрос: </form:label></td>
            <td><form:input path="dailyDemand"/></td>
        </tr>
        <tr>
            <td><form:label path="demandVolumeLevel">Уровень страхового запаса от объема спроса: </form:label></td>
            <td><form:input path="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit"/></td>
        </tr>
        <tr>
            <td>Страховой запас:</td>
            <td>${resultPOC}</td>
        </tr>
    </table>
</form:form>
<br>
<br>
<a href="${pageContext.request.contextPath}/">Главная</a> <br>

</body>

</html>
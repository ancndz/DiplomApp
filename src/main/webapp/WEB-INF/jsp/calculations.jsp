<%@ page contentType="text/html;charset=cp1251" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>������</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<h2>����������� ������ ���������� ������</h2>

<%--@elvariable id="poc" type="ru.ancndz.calculations.PercentageOfDemand"--%>
<form:form method="POST" action="/calculations/poc" modelAttribute="poc">
    <table>
        <caption>������ ������������ ������ ��� ������� � ����������, <br>
            �� ���������� �������� ���������� ������ � �������� ���������� �������.
        </caption>
        <tr>
            <td><form:label path="leadTime">����������� ����� ���������� ������: </form:label></td>
            <td><form:input path="leadTime"/></td>
        </tr>
        <tr>
            <td><form:label path="dailyDemand">������� �����: </form:label></td>
            <td><form:input path="dailyDemand"/></td>
        </tr>
        <tr>
            <td><form:label path="demandVolumeLevel">������� ���������� ������ �� ������ ������: </form:label></td>
            <td><form:input path="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit"/></td>
        </tr>
        <tr>
            <td>��������� �����:</td>
            <td>${resultPOC}</td>
        </tr>
    </table>
</form:form>
<br>
<br>
<a href="${pageContext.request.contextPath}/">�������</a> <br>

</body>

</html>
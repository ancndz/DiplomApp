<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Данные</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4 px-3">
    <a class="navbar-brand">Расчет страховых запасов</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor2"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="navbarColor2" style>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Главная</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/calculations/">Оптимальный
                расчет страхового запаса</a></li>
            <li class="nav-item active"><a class="nav-link"
                                           href="${pageContext.request.contextPath}/data/">Данные</a></li>
        </ul>
    </div>
</nav>

<main role="main" class="container">
    <div class="row justify-content-md-center">
        <div class="col col-lg-4">
            <table class="table table-striped table-bordered">
                <caption>Данные о продажах</caption>
                <thead>
                <tr class="d-flex">
                    <th class="col">Дата продажи</th>
                    <th class="col">Количество</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sales}" var="sale">
                    <tr class="d-flex">
                        <td class="col">${sale.saleDate}</td>
                        <td class="col">${sale.saleCount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col col-lg-4">
            <table class="table table-striped table-bordered">
                <caption>Данные о поставках</caption>
                <thead>
                <tr class="d-flex">
                    <th class="col">Дата заказа</th>
                    <th class="col">Дата поставки</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${supplies}" var="supply">
                    <tr class="d-flex">
                        <td class="col">${supply.beginDate}</td>
                        <td class="col">${supply.endDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
</body>
</html>

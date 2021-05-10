<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Главная</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4 px-3">
    <a class="navbar-brand">Расчет страховых запасов</a>
    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarColor2"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="navbarColor2" style>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/">Главная</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/calculations/">Оптимальный
                расчет страхового запаса</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/data/">Данные</a></li>
        </ul>
    </div>
</nav>

<div class="page-header px-5">
    <h2>${message}</h2>
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
</body>
</html>
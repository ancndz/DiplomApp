<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Расчет</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon/favicon.svg">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/favicon/apple-touch-icon.png">
    <link rel="apple-touch-startup-image" href="${pageContext.request.contextPath}/favicon/apple-touch-icon.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/favicon/site.webmanifest">
    <link rel="mask-icon" href="${pageContext.request.contextPath}/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#00aba9">
    <meta name="theme-color" content="#ffffff">
    <meta name="apple-mobile-web-app-title" content="Расчет страховых запасов"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand">Расчет страховых запасов</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/">Главная</a>
                </li>
                <li class="nav-item"><a class="nav-link active" aria-current="page"
                                        href="${pageContext.request.contextPath}/calculations/">Оптимальный
                    расчет страхового запаса</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/data/">Данные</a></li>
            </ul>
        </div>
    </div>
</nav>
<main class="container bg-light p-5 rounded">
    <h1>Оптимальный расчет страхового запаса</h1>
    <div class="row row-cols-1 row-cols-lg-2 g-4 justify-content-md-center">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="modelTabPoc" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="info-tabPoc" data-bs-toggle="tab"
                                    data-bs-target="#infoPoc"
                                    type="button" role="tab" aria-controls="infoPoc" aria-selected="true">Справка
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="calculation-tabPoc" data-bs-toggle="tab"
                                    data-bs-target="#calculationPoc"
                                    type="button" role="tab" aria-controls="calculationPoc" aria-selected="false">Расчет
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Учет процента от спроса во время выполнения заказа</h5>
                    <div class="tab-content" id="modelTabContentPoc">
                        <div class="tab-pane fade show active" id="infoPoc" role="tabpanel"
                             aria-labelledby="infoPoc-tab">
                            <div class="card-text">
                                <p>Расчет для:
                                <li>товаров с длительным, но постоянным временем выполнения заказа и довольно постоянным
                                    спросом;
                                </li>
                                <li>товаров с очень коротким временем выполнения заказа и существенными колебаниями
                                    спроса от месяца к месяцу.
                                </li>
                                </p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="calculationPoc" role="tabpanel"
                             aria-labelledby="calculationPoc-tab">
                            <form method="POST" action="${pageContext.request.contextPath}/api/poc" class="mx-1 mt-1"
                                  id="pocForm">
                                <fieldset>
                                    <div class="form-group row row-cols-1 row-cols-lg-2 g-4 mb-2">
                                        <div class="col-sm-8">
                                            <label for="time">Планируемое время выполнения заказа:</label>
                                        </div>
                                        <div class="col-sm-4">
                                            <input required class="form-control" id="time" type="number" name="time"/>
                                        </div>
                                        <div class="col-sm-8">
                                            <label for="demand">Дневной спрос:</label>
                                        </div>
                                        <div class="col-sm-4">
                                            <input required class="form-control" id="demand" type="number"
                                                   name="demand"/>
                                        </div>
                                        <div class="col-sm-8">
                                            <label for="demandVolumeLevel">Уровень страхового запаса от объема
                                                спроса:</label>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="input-group">
                                                <input required class="form-control" id="demandVolumeLevel"
                                                       type="number"
                                                       name="demandVolumeLevel"/>
                                                <span class="input-group-text">%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1" id="buttonpoc">Рассчитать
                                    </button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-footer" id="footerpoc" style="display: none">
                    <p class="card-text" style="font-weight: bold" id="resultpoc"></p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="modelTabLV" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="infoLV-tab" data-bs-toggle="tab"
                                    data-bs-target="#infoLV"
                                    type="button" role="tab" aria-controls="infoLV" aria-selected="true">Справка
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="calculationLV-tab" data-bs-toggle="tab"
                                    data-bs-target="#calculationLV"
                                    type="button" role="tab" aria-controls="calculationLV" aria-selected="false">Расчет
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Неопределенность поставки</h5>
                    <div class="tab-content" id="modelTabContentLV">
                        <div class="tab-pane fade show active" id="infoLV" role="tabpanel" aria-labelledby="infoLV-tab">
                            <div class="card-text">
                                <p>Данная модель предназначена для товаров, срок поставки которых может колебаться, а
                                    спрос является
                                    статичным. Эта модель подойдет лучше всего для товаров, которые доставляют морским
                                    или
                                    железнодорожным путем, с долгим сроком годности, а так же хранение которых не
                                    вызывает крупных
                                    затрат.</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="calculationLV" role="tabpanel"
                             aria-labelledby="calculationLV-tab">
                            <form method="POST" action="${pageContext.request.contextPath}/api/lv" class="mx-1 mt-1"
                                  id="lvForm">
                                <fieldset>
                                    <div class="form-group row row-cols-1 row-cols-lg-2 g-4 mb-2">
                                        <div class="col-8">
                                            <label for="demandLV">Дневной спрос:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="demandLV" type="number"
                                                   name="demand"/>
                                        </div>
                                        <div class="col-8">
                                            <label for="demandVolumeLevelLV">Желаемый уровень сервиса:</label>
                                        </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <input required class="form-control" id="demandVolumeLevelLV"
                                                       type="number"
                                                       name="demandVolumeLevel"/>
                                                <span class="input-group-text">%</span>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <label for="minDateLV">Начальная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="minDateLV" type="date"
                                                   name="minDate"
                                                   value="${minDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                        <div class="col-8">
                                            <label for="maxDateLV">Конечная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="maxDateLV" type="date"
                                                   name="maxDate"
                                                   value="${maxDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1" id="buttonlv">Рассчитать</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-footer" id="footerlv" style="display: none">
                    <p class="card-text" style="font-weight: bold" id="resultlv"></p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="modelTabDV" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="info-tabDV" data-bs-toggle="tab"
                                    data-bs-target="#infoDV"
                                    type="button" role="tab" aria-controls="infoDV" aria-selected="true">Справка
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="calculation-tabDV" data-bs-toggle="tab"
                                    data-bs-target="#calculationDV"
                                    type="button" role="tab" aria-controls="calculationDV" aria-selected="false">Расчет
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Неопределенность спроса</h5>
                    <div class="tab-content" id="modelTabContentDV">
                        <div class="tab-pane fade show active" id="infoDV" role="tabpanel" aria-labelledby="infoDV-tab">
                            <div class="card-text">
                                <p>Данная модель предназначена для товаров, имеющих постоянный срок поставки, а
                                    потребность может
                                    колебаться. Когда запас расходуется полностью, происходит его пополнение до
                                    первоначального
                                    уровня.
                                    В данном случае страховой запас будет минимальным, что позволяет держать меньше
                                    замороженных
                                    активов. Это крайне важно, к примеру, для товаров с небольшим сроком годности или
                                    обслуживание
                                    которых связано с большими затратами. Выбор исследуемых интервалов поможет
                                    правильно рассчитать страховой запас для сезонных товаров.</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="calculationDV" role="tabpanel"
                             aria-labelledby="calculationDV-tab">
                            <form method="POST" action="${pageContext.request.contextPath}/api/dv" class="mx-1 mt-1"
                                  id="dvForm">
                                <fieldset>
                                    <div class="form-group row row-cols-1 row-cols-lg-2 g-4 mb-2">
                                        <div class="col-8">
                                            <label for="timeDV">Планируемое время выполнения заказа:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="timeDV" type="number" name="time"/>
                                        </div>
                                        <div class="col-8">
                                            <label for="demandVolumeLevelDV">Желаемый уровень сервиса:</label>
                                        </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <input required class="form-control" id="demandVolumeLevelDV"
                                                       type="number"
                                                       name="demandVolumeLevel"/>
                                                <span class="input-group-text">%</span>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <label for="minDateDV">Начальная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="minDateDV" type="date"
                                                   name="minDate"
                                                   value="${minDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                        <div class="col-8">
                                            <label for="maxDateDV">Конечная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="maxDateDV" type="date"
                                                   name="maxDate"
                                                   value="${maxDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1" id="buttondv">Рассчитать</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-footer" id="footerdv" style="display: none">
                    <p class="card-text" style="font-weight: bold" id="resultdv"></p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="modelTabLDV" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="info-tabLDV" data-bs-toggle="tab"
                                    data-bs-target="#infoLDV"
                                    type="button" role="tab" aria-controls="infoLDV" aria-selected="true">Справка
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="calculation-tabLDV" data-bs-toggle="tab"
                                    data-bs-target="#calculationLDV"
                                    type="button" role="tab" aria-controls="calculationLDV" aria-selected="false">Расчет
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Неопределенность поставки и спроса</h5>
                    <div class="tab-content" id="modelTabContentLDV">
                        <div class="tab-pane fade show active" id="infoLDV" role="tabpanel"
                             aria-labelledby="infoLDV-tab">
                            <div class="card-text">
                                <p>В данной модели рассматривается комбинация факторов неопределенности спроса и сроков
                                    поставки.
                                    Данная модель может использоваться для любых категорий товаров, а выбор исследуемых
                                    интервалов
                                    поможет
                                    правильно рассчитать страховой запас для сезонных товаров.</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="calculationLDV" role="tabpanel"
                             aria-labelledby="calculationLDV-tab">
                            <form method="POST" action="${pageContext.request.contextPath}/api/ldv" class="mx-1 mt-1"
                                  id="ldvForm">
                                <fieldset>
                                    <div class="form-group row row-cols-1 row-cols-lg-2 g-4 mb-2">
                                        <div class="col-8">
                                            <label for="timeLDV">Планируемое время выполнения заказа:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="timeLDV" type="number"
                                                   name="time"/>
                                        </div>
                                        <div class="col-8">
                                            <label for="demandVolumeLevelLDV">Желаемый уровень сервиса:</label>
                                        </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <input required class="form-control" id="demandVolumeLevelLDV"
                                                       type="number"
                                                       name="demandVolumeLevel"/>
                                                <span class="input-group-text">%</span>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <label for="minDateLDV">Начальная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="minDateLDV" type="date"
                                                   name="minDate"
                                                   value="${minDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                        <div class="col-8">
                                            <label for="maxDateLDV">Конечная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="maxDateLDV" type="date"
                                                   name="maxDate"
                                                   value="${maxDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1" id="buttonldv">Рассчитать
                                    </button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-footer" id="footerldv" style="display: none">
                    <p class="card-text" style="font-weight: bold" id="resultldv"></p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="modelTabBV" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="info-tabBV" data-bs-toggle="tab"
                                    data-bs-target="#infoBV"
                                    type="button" role="tab" aria-controls="infoBV" aria-selected="true">Справка
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="calculation-tabBV" data-bs-toggle="tab"
                                    data-bs-target="#calculationBV"
                                    type="button" role="tab" aria-controls="calculationBV" aria-selected="false">Расчет
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Неопределенность поставки и спроса (Формула Бауэрсокса)</h5>
                    <div class="tab-content" id="modelTabContentBV">
                        <div class="tab-pane fade show active" id="infoBV" role="tabpanel" aria-labelledby="infoBV-tab">
                            <div class="card-text">
                                <p>Формула Бауэрсокса для расчета величины страхового запаса в условиях
                                    неопределенности.</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="calculationBV" role="tabpanel"
                             aria-labelledby="calculationBV-tab">
                            <form method="POST" action="${pageContext.request.contextPath}/api/bv" class="mx-1 mt-1"
                                  id="bvForm">
                                <fieldset>
                                    <div class="form-group row row-cols-1 row-cols-lg-2 g-4 mb-2">
                                        <div class="col-8">
                                            <label for="orderVal">Введите размер заказа:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="orderVal" type="number"
                                                   name="orderVal"/>
                                        </div>
                                        <div class="col-8">
                                            <label for="demandVolumeLevelBV">Желаемый уровень сервиса:</label>
                                        </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <input required class="form-control" id="demandVolumeLevelBV"
                                                       type="number"
                                                       name="demandVolumeLevel"/>
                                                <span class="input-group-text">%</span>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <label for="minDateBV">Начальная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="minDateBV" type="date"
                                                   name="minDate"
                                                   value="${minDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                        <div class="col-8">
                                            <label for="maxDateBV">Конечная дата исследуемого периода:</label>
                                        </div>
                                        <div class="col-4">
                                            <input required class="form-control" id="maxDateBV" type="date"
                                                   name="maxDate"
                                                   value="${maxDate}"
                                                   min="${minDate}"
                                                   max="${maxDate}">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1" id="buttonbv">Рассчитать</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-footer" id="footerbv" style="display: none">
                    <p class="card-text" style="font-weight: bold" id="resultbv"></p>
                </div>
            </div>
        </div>
    </div>
</main>
<footer class="footer mt-auto py-3 fixed-bottom">
    <div class="container" id="loading" style="display: none">
        <div class="progress">
            <div class="progress-bar progress-bar-striped progress-bar-animated w-100" role="progressbar"
                 aria-valuenow="100"
                 aria-valuemax="100" aria-valuemin="0"></div>
        </div>
    </div>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
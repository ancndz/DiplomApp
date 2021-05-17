<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Расчет</title>
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
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Главная</a></li>
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/calculations/">Оптимальный
                расчет страхового запаса</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/data/">Данные</a></li>
        </ul>
    </div>
</nav>

<main role="main" class="container">
    <div class="row-cols-auto justify-content-center">
        <div class="col-12">
            <h1>Оптимальный расчет страхового запаса</h1></div>
    </div>

    <div class="row justify-content-md-center">
        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>Расчет для:
                <li>товаров с длительным, но постоянным временем выполнения заказа и довольно постоянным спросом;</li>
                <li>товаров с очень коротким временем выполнения заказа и существенными колебаниями спроса от месяца к
                    месяцу.
                </li>
                </p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/api/poc" class="card-body" id="pocForm">
                <fieldset>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="time">Планируемое время выполнения заказа:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="time" type="number" name="time"/>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demand">Дневной спрос:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="demand" type="number" name="demand"/>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demandVolumeLevel">Уровень страхового запаса от объема спроса:</label>
                        </div>
                        <div class="col-4">
                            <div class="input-group">
                                <input required class="form-control" id="demandVolumeLevel" type="number"
                                       name="demandVolumeLevel"/>
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary" id="buttonpoc">Рассчитать страховой запас
                            </button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold" id="resultpoc"></p></div>
                    </div>
                </fieldset>
            </form>
        </div>

        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>Данная модель предназначена для товаров, срок поставки которых может колебаться, а спрос является
                    статичным. Эта модель подойдет лучше всего для товаров, которые доставляют морским или
                    железнодорожным путем, с долгим сроком годности, а так же хранение которых не вызывает крупных
                    затрат.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/api/lv" class="card-body" id="lvForm">
                <fieldset>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demandLV">Дневной спрос:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="demandLV" type="number" name="demand"/>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demandVolumeLevelLV">Желаемый уровень сервиса:</label>
                        </div>
                        <div class="col-4">
                            <div class="input-group">
                                <input required class="form-control" id="demandVolumeLevelLV" type="number"
                                       name="demandVolumeLevel"/>
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="minDateLV">Начальная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="minDateLV" type="date" name="minDate"
                                   value="${minDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="maxDateLV">Конечная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="maxDateLV" type="date" name="maxDate"
                                   value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary" id="buttonlv">Рассчитать страховой запас
                            </button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold" id="resultlv"></p></div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <div class="row justify-content-md-center">
        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>Данная модель предназначена для товаров, имеющих постоянный срок поставки, а потребность может
                    колебаться. Когда запас расходуется полностью, происходит его пополнение до первоначального уровня.
                    В данном случае страховой запас будет минимальным, что позволяет держать меньше замороженных
                    активов. Это крайне важно, к примеру, для товаров с небольшим сроком годности или обслуживание
                    которых связано с большими затратами. Выбор исследуемых интервалов поможет
                    правильно рассчитать страховой запас для сезонных товаров.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/api/dv" class="card-body" id="dvForm">
                <fieldset>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="timeDV">Планируемое время выполнения заказа:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="timeDV" type="number" name="time"/>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demandVolumeLevelDV">Желаемый уровень сервиса:</label>
                        </div>
                        <div class="col-4">
                            <div class="input-group">
                                <input required class="form-control" id="demandVolumeLevelDV" type="number"
                                       name="demandVolumeLevel"/>
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="minDateDV">Начальная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="minDateDV" type="date" name="minDate"
                                   value="${minDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="maxDateDV">Конечная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="maxDateDV" type="date" name="maxDate"
                                   value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary" id="buttondv">Рассчитать страховой запас
                            </button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold" id="resultdv"></p></div>
                    </div>
                </fieldset>
            </form>
        </div>

        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>В данной модели рассматривается комбинация факторов неопределенности спроса и сроков поставки.
                    Данная модель может использоваться для любых категорий товаров, а выбор исследуемых интервалов поможет
                    правильно рассчитать страховой запас для сезонных товаров.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/api/ldv" class="card-body" id="ldvForm">
                <fieldset>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="timeLDV">Планируемое время выполнения заказа:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="timeLDV" type="number" name="time"/>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demandVolumeLevelLDV">Желаемый уровень сервиса:</label>
                        </div>
                        <div class="col-4">
                            <div class="input-group">
                                <input required class="form-control" id="demandVolumeLevelLDV" type="number"
                                       name="demandVolumeLevel"/>
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="minDateLDV">Начальная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="minDateLDV" type="date" name="minDate"
                                   value="${minDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="maxDateLDV">Конечная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="maxDateLDV" type="date" name="maxDate"
                                   value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary" id="buttonldv">Рассчитать страховой запас
                            </button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold" id="resultldv"></p></div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <div class="row justify-content-md-center">
        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>Формула Бауэрсокса для расчета величины страхового запаса в условиях
                    неопределенности.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/api/bv" class="card-body" id="bvForm">
                <fieldset>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="orderVal">Введите размер заказа:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="orderVal" type="number" name="orderVal"/>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="demandVolumeLevelBV">Желаемый уровень сервиса:</label>
                        </div>
                        <div class="col-4">
                            <div class="input-group">
                                <input required class="form-control" id="demandVolumeLevelBV" type="number"
                                       name="demandVolumeLevel"/>
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="minDateBV">Начальная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="minDateBV" type="date" name="minDate"
                                   value="${minDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="maxDateBV">Конечная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="maxDateBV" type="date" name="maxDate"
                                   value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary" id="buttonbv">Рассчитать страховой запас
                            </button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold" id="resultbv"></p></div>
                    </div>
                </fieldset>
            </form>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
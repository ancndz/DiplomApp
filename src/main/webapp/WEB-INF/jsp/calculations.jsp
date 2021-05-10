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
                <p>Расчет оптимального запаса для товаров с длительным, <br>
                    но постоянным временем выполнения заказа и довольно постоянным спросом.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/calculations/poc" class="card-body">
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
                        <div class="col-8">
                            <label for="minDate">Начальная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="minDate" type="date" name="minDate"
                                   value="${minDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8"><label for="maxDate">Конечная дата исследуемого периода:</label></div>
                        <div class="col-4"><input required class="form-control" id="maxDate" type="date" name="maxDate"
                                                  value="${maxDate}"
                                                  min="${minDate}"
                                                  max="${maxDate}"></div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Рассчитать страховой запас</button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold">${resultPOC}</p></div>
                    </div>
                </fieldset>
            </form>
        </div>

        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>Цикл запаса может оказаться больше расчетного на
                    величину задержки в сроках поставки. Поскольку спрос во время цикла запаса является
                    постоянным, то необходимы страховые запасы только на период, равный <br>
                    стандартному отклонению сроков поставки.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/calculations/lv" class="card-body">
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
                            <input required class="form-control" id="maxDateLV" type="date" name="maxDate" value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Рассчитать страховой запас</button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold">${resultLV}</p></div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <div class="row justify-content-md-center">
        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>В тот момент, когда запас расходуется полностью (в последний день цикла),
                    <br>
                    происходит его пополнение до первоначального уровня, равного объему
                    оптимального заказа.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/calculations/dv" class="card-body">
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
                            <input required class="form-control" id="minDateDV" type="date" name="minDate" value="${minDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-8">
                            <label for="maxDateDV">Конечная дата исследуемого периода:</label>
                        </div>
                        <div class="col-4">
                            <input required class="form-control" id="maxDateDV" type="date" name="maxDate" value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Рассчитать страховой запас</button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold">${resultDV}</p></div>
                    </div>
                </fieldset>
            </form>
        </div>

        <div class="col-sm-5 card m-2 px-0">
            <div class="card-header">
                <p>В третьей ситуации рассматривается комбинация факторов
                    неопределенности спроса и сроков поставки. В этом случае общая <br>
                    неопределенность может быть представлена, как сумма указанных рисков.</p>
            </div>
            <form method="POST" action="${pageContext.request.contextPath}/calculations/ldv" class="card-body">
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
                            <button type="submit" class="btn btn-primary">Рассчитать страховой запас</button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold">${resultLDV}</p></div>
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
            <form method="POST" action="${pageContext.request.contextPath}/calculations/bv" class="card-body">
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
                            <input required class="form-control" id="maxDateBV" type="date" name="maxDate" value="${maxDate}"
                                   min="${minDate}"
                                   max="${maxDate}">
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Рассчитать страховой запас</button>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <div class="col-12"><p style="font-weight: bold">${resultBV}</p></div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</main>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
</body>
</html>
<%@ page contentType="text/html;charset=cp1251" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Расчет</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<h2 align="center">Оптимальный расчет страхового запаса</h2>

<form method="POST" action="/calculations/poc">
    <table align="center">
        <caption>Расчет оптимального запаса для товаров с длительным, <br>
            но постоянным временем выполнения заказа и довольно постоянным спросом.
        </caption>
        <tr>
            <td>Планируемое время выполнения заказа:</td>
            <td><input type="number" name="time"/></td>
        </tr>
        <tr>
            <td>Дневной спрос:</td>
            <td><input type="number" name="demand"/></td>
        </tr>
        <tr>
            <td>Уровень страхового запаса от объема спроса:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" name="Расчитать страховой запас"/></td>
            <td style="font-weight: bold" align="center">${resultPOC}</td>
        </tr>
    </table>
</form>
<br>

<form method="POST" action="/calculations/lv">
    <table align="center">
        <caption>Цикл запаса может оказаться больше расчетного на
            величину задержки в сроках поставки. Поскольку спрос во время цикла запаса является
            постоянным, то необходимы страховые запасы только на период, равный <br>
            стандартному отклонению сроков поставки. </caption>
        <tr>
            <td>Дневной спрос:</td>
            <td><input type="number" name="demand"/></td>
        </tr>
        <tr>
            <td>Желаемый уровень сервиса:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" name="Расчитать страховой запас"/></td>
            <td style="font-weight: bold" align="center">${resultLV}</td>
        </tr>
    </table>
</form>
<br>

<form method="POST" action="/calculations/dv">
    <table align="center">
        <caption>В
            тот момент, когда запас расходуется полностью (в последний день цикла), <br>
            происходит его пополнение до первоначального уровня, равного объему
            оптимального заказа.</caption>
        <tr>
            <td>Планируемое время выполнения заказа (дни):</td>
            <td><input type="number" name="leadCycle"/></td>
        </tr>
        <tr>
            <td>Желаемый уровень сервиса:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" name="Расчитать страховой запас"/></td>
            <td style="font-weight: bold" align="center">${resultDV}</td>
        </tr>
    </table>
</form>
<br>

<form method="POST" action="/calculations/ldv">
    <table align="center">
        <caption>В третьей ситуации рассматривается комбинация факторов
            неопределенности спроса и сроков поставки. В этом случае общая <br>
            неопределенность может быть представлена, как сумма указанных рисков</caption>
        <tr>
            <td>Планируемое время выполнения заказа (дни):</td>
            <td><input type="number" name="leadCycle"/></td>
        </tr>
        <tr>
            <td>Желаемый уровень сервиса:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" name="Расчитать страховой запас"/></td>
            <td style="font-weight: bold" align="center">${resultLDV}</td>
        </tr>
    </table>
</form>
<br>

<form method="POST" action="/calculations/bv">
    <table align="center">
        <caption>Формула Бауэрсокса для расчета величины страхового запаса в условиях неопределенности</caption>
        <tr>
            <td>Введите размер заказа: </td>
            <td><input type="number" name="orderVal"/></td>
        </tr>
        <tr>
            <td>Желаемый уровень сервиса:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td><input type="submit" name="Расчитать страховой запас"/></td>
            <td style="font-weight: bold" align="center">${resultBV}</td>
        </tr>
    </table>
</form>
<br>
<br>
<a href="${pageContext.request.contextPath}/">Главная</a> <br>

</body>

</html>
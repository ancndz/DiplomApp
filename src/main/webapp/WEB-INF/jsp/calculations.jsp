<%@ page contentType="text/html;charset=cp1251" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>������</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<h1 align="center">����������� ������ ���������� ������</h1>

<form method="POST" action="/calculations/poc">
    <table align="center">
        <caption>������ ������������ ������ ��� ������� � ����������, <br>
            �� ���������� �������� ���������� ������ � �������� ���������� �������.
        </caption>
        <tr>
            <td>����������� ����� ���������� ������:</td>
            <td><input type="number" name="time"/></td>
        </tr>
        <tr>
            <td>������� �����:</td>
            <td><input type="number" name="demand"/></td>
        </tr>
        <tr>
            <td>������� ���������� ������ �� ������ ������:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td>��������� ���� ������������ �������:</td>
            <td><input type="date" name="minDate" value="${minDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td>�������� ���� ������������ �������:</td>
            <td><input type="date" name="maxDate" value="${maxDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td><input type="submit" name="��������� ��������� �����"/></td>
            <td style="font-weight: bold" align="center">${resultPOC}</td>
        </tr>
    </table>
</form>
<br>
<hr align="center" width="800" size="2" color="#000000"/>
<br>
<form method="POST" action="/calculations/lv">
    <table align="center">
        <caption>���� ������ ����� ��������� ������ ���������� ��
            �������� �������� � ������ ��������. ��������� ����� �� ����� ����� ������ ��������
            ����������, �� ���������� ��������� ������ ������ �� ������, ������ <br>
            ������������ ���������� ������ ��������.
        </caption>
        <tr>
            <td>������� �����:</td>
            <td><input type="number" name="demand"/></td>
        </tr>
        <tr>
            <td>�������� ������� �������:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td>��������� ���� ������������ �������:</td>
            <td><input type="date" name="minDate" value="${minDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td>�������� ���� ������������ �������:</td>
            <td><input type="date" name="maxDate" value="${maxDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td><input type="submit" name="��������� ��������� �����"/></td>
            <td style="font-weight: bold" align="center">${resultLV}</td>
        </tr>
    </table>
</form>
<br>
<hr align="center" width="800" size="2" color="#000000"/>
<br>
<form method="POST" action="/calculations/dv">
    <table align="center">
        <caption>�
            ��� ������, ����� ����� ����������� ��������� (� ��������� ���� �����), <br>
            ���������� ��� ���������� �� ��������������� ������, ������� ������
            ������������ ������.
        </caption>
        <tr>
            <td>����������� ����� ���������� ������ (���):</td>
            <td><input type="number" name="leadCycle"/></td>
        </tr>
        <tr>
            <td>�������� ������� �������:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td>��������� ���� ������������ �������:</td>
            <td><input type="date" name="minDate" value="${minDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td>�������� ���� ������������ �������:</td>
            <td><input type="date" name="maxDate" value="${maxDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td><input type="submit" name="��������� ��������� �����"/></td>
            <td style="font-weight: bold" align="center">${resultDV}</td>
        </tr>
    </table>
</form>
<br>
<hr align="center" width="800" size="2" color="#000000"/>
<br>
<form method="POST" action="/calculations/ldv">
    <table align="center">
        <caption>� ������� �������� ��������������� ���������� ��������
            ���������������� ������ � ������ ��������. � ���� ������ ����� <br>
            ���������������� ����� ���� ������������, ��� ����� ��������� ������
        </caption>
        <tr>
            <td>����������� ����� ���������� ������ (���):</td>
            <td><input type="number" name="leadCycle"/></td>
        </tr>
        <tr>
            <td>�������� ������� �������:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td>��������� ���� ������������ �������:</td>
            <td><input type="date" name="minDate" value="${minDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td>�������� ���� ������������ �������:</td>
            <td><input type="date" name="maxDate" value="${maxDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td><input type="submit" name="��������� ��������� �����"/></td>
            <td style="font-weight: bold" align="center">${resultLDV}</td>
        </tr>
    </table>
</form>
<br>
<hr align="center" width="800" size="2" color="#000000"/>
<br>
<form method="POST" action="/calculations/bv">
    <table align="center">
        <caption>������� ���������� ��� ������� �������� ���������� ������ � �������� ����������������</caption>
        <tr>
            <td>������� ������ ������:</td>
            <td><input type="number" name="orderVal"/></td>
        </tr>
        <tr>
            <td>�������� ������� �������:</td>
            <td><input type="number" name="demandVolumeLevel"/> %</td>
        </tr>
        <tr>
            <td>��������� ���� ������������ �������:</td>
            <td><input type="date" name="minDate" value="${minDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td>�������� ���� ������������ �������:</td>
            <td><input type="date" name="maxDate" value="${maxDate}" min="${minDate}" max="${maxDate}"></td>
        </tr>
        <tr>
            <td><input type="submit" name="��������� ��������� �����"/></td>
            <td style="font-weight: bold" align="center">${resultBV}</td>
        </tr>
    </table>
</form>
<br>
<hr align="center" width="800" size="2" color="#000000"/>
<br>
<a href="${pageContext.request.contextPath}/">�������</a>
</body>
</html>
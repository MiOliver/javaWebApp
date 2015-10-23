<%--
  Created by IntelliJ IDEA.
  User: ning
  Date: 10/22/15
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title></title>
</head>
<body>
<table>
    <c:forEach items="${userList}" var="item">
        <tr>
            <td>${item.userName}</td>
            <td>${item.password}</td>
            <td>${item.age}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

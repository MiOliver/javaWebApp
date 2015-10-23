<html>
<head>
    <title></title>
</head>
<body>
<table>
    <#if (userList?size>0) >
        <#list userList as user >
            <tr>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.age}</td>
            </tr>
        </#list>

    </#if>
</table>
</body>
</html>
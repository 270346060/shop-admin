<#include 'layout.ftl'>

<@layout title="用户列表">
  <table>
    <tr>
      <th>用户名</th>
      <th>最后一次登录时间</th>
    </tr>
    <#-- 
freemarker的指令有两种：预定义、自定义，
调用预定义指令时以#号开头，调用自定义指令时以@开头

给指令传参时，不需要${}，
在静态文本中插入值，使用${...}

内建函数（Built-ins）
${some.var?...}的意思是对该值的进一步处理，有点像调用该值的方法（someVar.someMethod(...)）
    -->
    <#list users as user>
      <tr>
        <td>${user.username}</td>
        <td>
        <#--
时间日期值有三种形式：只含年月日，只含时分秒，都含，
必须要先?datetime告诉freemarker用哪种，
再?string自定义格式
        -->
            ${user.lastLoginTime?datetime?string['yyyy-MM-dd HH:mm:ss']}
        </td>
      </tr>
    </#list>
  </table>
</@layout>


<#include 'layout.ftl'>

<@layout title="用户列表">
  <table>
    <tr>
      <th>用户名</th>
      <th>最后一次登录时间</th>
    </tr>
    <#list users as user>
      <tr>
        <td>${user.username}</td>
        <td>
            ${user.lastLoginTime?datetime}
        </td>
      </tr>
    </#list>
  </table>
</@layout>


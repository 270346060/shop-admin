<#include 'layout.ftl'>

<@layout title="手机列表">
  <table>
    <tr>
      <th>品牌</th>
      <th>型号</th>
      <th>操作系统</th>
      <th>CPU</th>
      <th>RAM</th>
      <th>存储</th>
      <th>颜色</th>
      <th>价格</th>
    </tr>
    <#list cellphones as cellphone>
      <tr>
        <td>${cellphone.brand}</td>
        <td>${cellphone.model}</td>
        <td>${cellphone.os}</td>
        <td>${cellphone.cpuBrand} ${cellphone.cpuCoreCount}</td>
        <td>${cellphone.ram}</td>
        <td>${cellphone.storage}</td>
        <td>${cellphone.color}</td>
        <td>${cellphone.price}</td>
      </tr>
    </#list>
  </table>
</@layout>

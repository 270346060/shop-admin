<#import "/spring.ftl" as spring />

<#macro css>
</#macro>

<#macro js>
</#macro>

<#macro layout title>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>${title}</title>
  <@css />
</head>
<body>
  <div class="header"> 
    <a href="<@spring.url '/cellphones/' />">手机列表</a>
    <a href="<@spring.url '/cellphones/add' />">添加手机</a>
    <a href="<@spring.url '/users/' />">用户列表</a>
  </div>
  
  <div class="content">
    <h1>${title}</h1>
    <#nested>
  </div>
  
  <div class="footer">copyright 2018</div>
   
   <@js />
</body>
</html>

</#macro>
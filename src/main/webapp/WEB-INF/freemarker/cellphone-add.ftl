<#include 'layout.ftl'>

  <#macro css>
    <link href="<@spring.url '/assets/css/form.css' />" rel="stylesheet">
  </#macro>
  
  <#macro js>
    <script>
      console.log('添加手机');
    </script>
  </#macro>
  
<@layout title="添加手机">
    <form action="" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

      <div>
        <label for="brand">品牌</label>
        <@spring.formSingleSelect "cellphone.brand" 
            {
                '': '--请选择品牌--', 
                '苹果': '苹果', 
                '锤子': '锤子', 
                '华为': '华为'
            }>
        </@spring.formSingleSelect>
        <@spring.showErrors "<br>" "field-error" />
      </div>
      
      <div>
        <label for="model">型号</label>
        <@spring.formInput 'cellphone.model' />
        <@spring.showErrors "<br>" "field-error" />
      </div>
      
      <div>
        <label for="os">操作系统</label>
        <@spring.formSingleSelect "cellphone.os" 
            {
                '': '--请选择操作系统--', 
                'Android': 'Android', 
                'IOS': 'IOS', 
                'Windows Phone': 'Windows Phone'
            }>
        </@spring.formSingleSelect>
        <@spring.showErrors "<br>" "field-error" />
      </div>
      
      <div>
        <label for="cpuBrand">CPU品牌</label>
        <@spring.formSingleSelect "cellphone.cpuBrand" 
            {
                '': '--请选择CPU品牌--', 
                '高通': '高通', 
                '联发科': '联发科'
            }>
        </@spring.formSingleSelect>
        <@spring.showErrors "<br>" "field-error" />            
      </div>    
      
      <div>
        <label for=cpuCoreCount>CPU核心数</label>
        <@spring.formInput "cellphone.cpuCoreCount" 
                           'min="1" max="16"' 
                           "number" />
        <@spring.showErrors "<br>" "field-error" />
      </div>
      
      <div>
        <label for=ram>运行内存</label>
        <@spring.formInput "cellphone.ram" 
                           'min="1" max="16" placeholder="GB"' 
                           "number" />
        <@spring.showErrors "<br>" "field-error" />
      </div>
      
      <div>
        <label for=storage>机身存储</label>
        <@spring.formInput path="cellphone.storage" 
                           fieldType="number" 
                           attributes='min="16" max="256" placeholder="GB"' />
        <@spring.showErrors "<br>" "field-error" />
      </div>    
      
      <div>
        <label for="color">颜色</label>
        <@spring.formInput path="cellphone.color" />
        <@spring.showErrors "<br>" "field-error" />        
      </div>
      
      <div>
        <label for="description">描述</label>
        <@spring.formTextarea path="cellphone.description" />
        <@spring.showErrors "<br>" "field-error" />        
      </div> 
      
      <div>
        <label for=price>价格</label>
        <@spring.formInput path="cellphone.price" 
                           fieldType='number' 
                           attributes='min="1" max="10000" placeholder="分"' />
        <@spring.showErrors "<br>" "field-error" />        
      </div> 
      
      <div>
        <button type="submit">保存</button>
      </div>
    </form>
</@layout>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>${name}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="../hero.css">
            <script type="text/javascript" src="../jquery-1.6.4.min.js"></script>
            <script type="text/javascript">
                $(function() {
                  document.body.style.webkitTouchCallout = "none";
                  document.body.style.webkitUserSelect = "none";
                  
                  $(".tab").click(
                                  function(){
                                  $(".tab").removeClass("sel");  
                                  $(".tab").addClass("unsel");
                                  $(this).removeClass("unsel");
                                  $(this).addClass("sel");
                                  var index = $(this).attr("sel");
                                  $(".hideDIV").hide();
                                  $("#content"+index).show();
                                  });
                  $(".abi").click(
                                  function(){
                                  $(".abi").removeClass("cur");  
                                  $(this).addClass("cur");
                                  var index = $(this).attr("sel");
                                  $(".abicontent").hide();
                                  $("#abi"+index).show();
                                  });
                  });
                
                
                </script>
            </head>
    <body>
<div>${name}</div>

<div>${codename}</div>

<div>${domian}</div>

<div>${short_desc}</div>

<div>${bio}</div>

<div>${desc}</div>

<div>${role}</div>

<div>${atype}</div>

<div>${hp}</div>

<div>${hp_regen}</div>

<div>${mp}</div>

<div>${mp_regen}</div>

<div>${atkD}</div>

<div>${atkS}</div>

<div>
abilities
<ul>
<#list abilities as abi>
<li sel="${abi_index + 1}" class="abi<#if abi_index == 0> cur</#if>">
    ${abi.abiName}  ${abi.key}
    <img src="${abi.abiName}.png">
</li>
</#list>
</ul>
</div>

<div>
talents
<ul>
<#list talents as tLevel>
<li sel="${tLevel_index + 1}" class="tLevel<#if tLevel_index == 0> cur</#if>">
    <#list tLevel as talent>
        <#if talent_index == 0>
            ${talent}<br>
        <#else>
            ${talent.tName} ${talent.tDesc} ${talent.tCD}
            <img src="${talent.tImg}"><br>
        </#if>
    </#list>
</li>
</#list>
</ul>
</div>


    </body>

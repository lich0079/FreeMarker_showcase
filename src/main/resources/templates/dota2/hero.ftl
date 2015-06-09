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
        <div class="everything">
            <div class="share">
                <a href="share.html"><img src="../openin.png"/></a>
            </div>
            <div class="head">
                <div class="floatleft headleft">
                    <a href='javascript:history.go(-1)'  name='gotop'><img  src="../img/${herocode}_hphover.png"/></a>
                </div>
                <div  class="floatleft headright">
                    <div class="heroName">${name}</div>
                    <div class="atype">${attackType}</div>
                    <div style="float:right">
                        <table class="roletable" border="0"  cellspacing="0" cellpadding="4">
                            <tr >
                                <td class="role" width="50%"><#if (roles?size > 0)>${roles[0]}</#if></td>
                                <td class="role" width="50%"><#if (roles?size > 1)>${roles[1]}</#if></td>
                            </tr>
                            <tr >
                                <td class="role"><#if (roles?size > 2)>${roles[2]}</#if></td>
                                <td class="role"><#if (roles?size > 3)>${roles[3]}</#if></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            
            <div class="tb_ ">
                <ul> 
                    <li sel="1" class="tab sel">${stats}</li>
                    <li sel="2" class="tab unsel">${ABILITIES}</li>
                    <li sel="3" class="tab unsel">${bio}</li>
                    <li sel="4" class="tab unsel">${PORTRAIT}</li>
                </ul>
            </div>
            
            <div class="clearfix"></div>
            
            <div >
                <div id="content1"  class="hideDIV">

                    <div class="contentblock" >
                        <div class="statsline floatleft">
                            <ul>
                                <li <#if overviewIcon_Primary == "Int">class="relativeP">&nbsp;<img class="primary" src="../img/overviewicon_primary.png" width="40" height="40"><#else>>&nbsp;</#if><img src="../img/overviewicon_int.png" class="img33"> <span>${overview_IntVal}</span></li>
                                <li <#if overviewIcon_Primary == "Agi">class="relativeP">&nbsp;<img class="primary" src="../img/overviewicon_primary.png" width="40" height="40"><#else>>&nbsp;</#if><img src="../img/overviewicon_agi.png" class="img33"> <span>${overview_AgiVal}</span></li>
                                <li <#if overviewIcon_Primary == "Str">class="relativeP">&nbsp;<img class="primary" src="../img/overviewicon_primary.png" width="40" height="40"><#else>>&nbsp;</#if><img src="../img/overviewicon_str.png" class="img33"> <span>${overview_StrVal}</span></li>
                            </ul>
                        </div>
                        <div class="grow floatleft">
                            <ul>
                                <li ><img src="../img/overviewicon_attack.png" class="img33"> &nbsp;&nbsp;<span>${overview_AttackVal}</span></li>
                                <li ><img src="../img/overviewicon_speed.png"  class="img33"> <span>${overview_SpeedVal}</span></li>
                                <li ><img src="../img/overviewicon_defense.png" class="img33"> &nbsp;&nbsp;&nbsp;&nbsp;<span>${overview_DefenseVal}</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="recommanditems contentblock" >
                        <table class="stattable" width="98%" border="0"  cellspacing="0" cellpadding="4">
                            <tr class="statRow">
                                <td width="2%"></td>
                                <td width="30%">${LEVEL}</td>
                                <td width="20%">1</td>
                                <td width="20%">15</td>
                                <td width="18%">25</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >${HIT_POINTS}</td>
                                <td class="statRowColW">${hp1}</td>
                                <td class="statRowColW">${hp2}</td>
                                <td class="statRowColW">${hp3}</td>
                            </tr>
                            <tr class="statRow">
                                <td ></td>
                                <td >${MANA}</td>
                                <td class="statRowColW">${mp1}</td>
                                <td class="statRowColW">${mp2}</td>
                                <td class="statRowColW">${mp3}</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >${DAMAGE}</td>
                                <td class="statRowColW">${at1}</td>
                                <td class="statRowColW">${at2}</td>
                                <td class="statRowColW">${at3}</td>
                            </tr>
                            <tr class="statRow">
                                <td ></td>
                                <td >${ARMOR}</td>
                                <td class="statRowColW">${ac1}</td>
                                <td class="statRowColW">${ac2}</td>
                                <td class="statRowColW">${ac3}</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >${SIGHT_RANGE}</td>
                                <td class="statRowColW" colspan="3" align="center">${s_range}</td>
                            </tr>
                            <tr class="statRow">
                                <td ></td>
                                <td >${ATTACK_RANGE}</td>
                                <td class="statRowColW" colspan="3" align="center">${a_range}</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >${MISSILE_SPEED}</td>
                                <td class="statRowColW" colspan="3" align="center">${m_speed}</td>
                            </tr>
                        </table>
                        <br>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    
                    
                </div>
                <div id="content2"  class="abilities hideDIV hided">
                    <div class="contentblock">
                        <ul>
                            <#list abilitiesList as abi>
                            <li sel="${abi_index + 1}" class="abi<#if abi_index == 0> cur</#if>">
                                <img  src="../img/${abi.ability_img}" />
                            </li>
                            </#list>
                        </ul>
                    </div>
                    <div class="contentblock">
                        <#list abilitiesList as abi>
                        <div id="abi${abi_index + 1}" class="abicontent cont<#if abi_index != 0> hided</#if>">
                            <p><strong>${abi.ability_name}</strong></p>
                            <p>${abi.ability_desc}</p>
                            <br>
                            <table class="stattable" border="0"  cellspacing="0" cellpadding="4">
                                <#list abi.stats as stat>
                                <tr class="statRow<#if (stat_index%2 == 1)>B</#if>">
                                    <td<#if stat_index == 0> width="45%"</#if>>${stat.stat_name}</td><td class="statRowColW"<#if stat_index == 0> width="55%"</#if>>${stat.stat_value}</td>
                                </tr>
                                </#list>
                            </table>
                            <p>${abi.abilityLore}</p>
                        </div>
                        </#list>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                </div>
                <div id="content3"  class="hideDIV hided">
                    <div class="story contentblock">
                    	<p>${bioInner}</p>
                    </div>
                </div>
                <div id="content4"  class="hideDIV hided">
                    <div class="recommanditems">
                        <div class="wallpapers contentblock">
                            <br>
                            <span><img src="../img/${herocode}_vert.jpg" /></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <br><br>
    </body>

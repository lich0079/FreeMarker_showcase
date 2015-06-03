<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>${name}</title>
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
        <div class="everything"><div class="share"><a href="share.html"><img src="../openin.png"/></a></div>
            <div>
                <div class="floatleft">
                    <a href='javascript:history.go(-1)'  name='gotop'><img  src="../img/${herocode}_hphover.png"/></a>
                </div>
                <div  class="floatleft">
                    <div class="heroName">${name}</div>
                     <div class="atype">${attackType}</div>
                    <table class="roletable" border="0"  cellspacing="0" cellpadding="4">
                            <tr >
                                <td class="role" width="50%"><#if (roles?size > 0)> ${roles[0]}</#if></td>
                                <td class="role" width="50%"><#if (roles?size > 1)> ${roles[1]}</#if></td>
                            </tr>
                            <tr >
                                <td class="role"><#if (roles?size > 2)> ${roles[2]}</#if></td>
                                <td class="role"><#if (roles?size > 3)> ${roles[3]}</#if></td>
                            </tr>
                        </table>
                </div>
            </div>
            <div class="clearfix"></div>
            
            <div class="tb_ floatleft">
                <ul> 
                    <li sel="1" class="tab sel">STATS</li>
                    <li sel="2" class="tab unsel">ABILITIES</li>
                    <li sel="3" class="tab unsel">BIO</li>
                    <li sel="4" class="tab unsel">PORTRAIT</li>
                </ul>
            </div>
            
            <div class="clearfix"></div>
            
            <div class="floatleft">
                <div id="content1"  class="hideDIV">

                    <div class="contentblock" >
                        <div class="statsline floatleft">
                            <ul>
                                <li <#if overviewIcon_Primary == "Int">class="relativeP">&nbsp;<img class="primary" src="../img/overviewicon_primary.png" width="40" height="40"</#if>>&nbsp;<img src="../img/overviewicon_int.png" class="img33"> <span>${overview_IntVal}</span></li>
                                <li <#if overviewIcon_Primary == "Agi">class="relativeP">&nbsp;<img class="primary" src="../img/overviewicon_primary.png" width="40" height="40"</#if>>&nbsp;<img src="../img/overviewicon_agi.png" class="img33"> <span>${overview_AgiVal}</span></li>
                                <li <#if overviewIcon_Primary == "Str">class="relativeP">&nbsp;<img class="primary" src="../img/overviewicon_primary.png" width="40" height="40"</#if>><img src="../img/overviewicon_str.png" class="img33"> <span>${overview_StrVal}</span></li>
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
                                <td width="30%">LEVEL</td>
                                <td width="20%">1</td>
                                <td width="20%">15</td>
                                <td width="18%">25</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >HIT POINTS</td>
                                <td class="statRowColW">${hp1}</td>
                                <td class="statRowColW">${hp2}</td>
                                <td class="statRowColW">${hp3}</td>
                            </tr>
                            <tr class="statRow">
                                <td ></td>
                                <td >MANA</td>
                                <td class="statRowColW">${mp1}</td>
                                <td class="statRowColW">${mp2}</td>
                                <td class="statRowColW">${mp3}</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >DAMAGE</td>
                                <td class="statRowColW">${at1}</td>
                                <td class="statRowColW">${at2}</td>
                                <td class="statRowColW">${at3}</td>
                            </tr>
                            <tr class="statRow">
                                <td ></td>
                                <td >ARMOR</td>
                                <td class="statRowColW">${ac1}</td>
                                <td class="statRowColW">${ac2}</td>
                                <td class="statRowColW">${ac3}</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >SIGHT RANGE</td>
                                <td class="statRowColW" colspan="3" align="center">${s_range}</td>
                            </tr>
                            <tr class="statRow">
                                <td ></td>
                                <td >ATTACK RANGE</td>
                                <td class="statRowColW" colspan="3" align="center">${a_range}</td>
                            </tr>
                            <tr class="statRowB">
                                <td ></td>
                                <td >MISSILE SPEED</td>
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
                        <br>
                        <ul>
                            <li sel="1" class="abi cur">
                                <img  src="../img/earthshaker_fissure_hp2.png" />
                            </li>
                            <li sel="2" class="abi">
                                <img  src="../img/earthshaker_enchant_totem_hp2.png" />               
                            </li>
                            <li sel="3" class="abi">
                                <img  src="../img/earthshaker_aftershock_hp2.png" />                          
                            </li>
                            <li sel="4" class="abi">
                                <img  src="../img/earthshaker_echo_slam_hp2.png" >
                            </li>
                        </ul>
                    </div>
                    <div class="contentblock">
                        <div id="abi1" class="abicontent cont">
                            <p><strong>Fissure</strong></p>
                            <p>Slams the ground with a mighty totem, fissuring the earth while stunning and damaging enemy units in a line. Creates an impassable ridge of stone.</p>
                            <br>
                            <table class="stattable" border="0"  cellspacing="0" cellpadding="4">
                                <tr class="statRow">
                                    <td width="45%">MANA COST:</td><td class="statRowColW" width="55%">125 / 140 / 155 / 170</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >COOLDOWN:</td><td class="statRowColW">15.0</td>
                                </tr>
                                <tr class="statRow">
                                    <td >ABILITY:</td><td class="statRowColW">TARGET UNIT, TARGET POINT</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >AFFECTS:</td><td class="statRowColW">ENEMY HEROES</td>
                                </tr>
                                <tr class="statRow">
                                    <td >DAMAGE:</td><td class="statRowColW">MAGICAL</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >DAMAGE:</td><td class="statRowColW">125 / 175 / 225 / 275</td>
                                </tr>
                                <tr class="statRow">
                                    <td >FISSURE DURATION:</td><td class="statRowColW">8</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >STUN DURATION:</td><td class="statRowColW">1 / 1.25 / 1.5 / 1.75</td>
                                </tr>
                            </table>
                        </div>
                        <div id="abi2" class="abicontent cont hided">
                            <p><strong>Enchant Totem</strong></p>
                            <p>Empowers Earthshaker's totem, causing it to deal extra damage on the next attack.</p>
                            <br>
                            <table class="stattable"  border="0"  cellspacing="0" cellpadding="4">
                                <tr class="statRow">
                                    <td width="45%">MANA COST:</td><td class="statRowColW" width="55%">50 / 50 / 50 / 50</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >COOLDOWN:</td><td class="statRowColW">5</td>
                                </tr>
                                <tr class="statRow">
                                    <td >ABILITY:</td><td class="statRowColW">NO TARGET</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >BONUS:</td><td class="statRowColW">75% / 150% / 225% / 300%</td>
                                </tr>
                                <tr class="statRow">
                                    <td >DURATION:</td><td class="statRowColW">14 / 14 / 14 / 14</td>
                                </tr>
                            </table>
                        </div>
                        <div id="abi3" class="abicontent cont hided">
                            <p><strong>Aftershock</strong></p>
                            <p>Causes the earth to shake underfoot, adding additional damage and stuns to nearby enemy units when Earthshaker casts his abilities.</p>
                            <br>
                            <table class="stattable"  border="0"  cellspacing="0" cellpadding="4">
                                <tr class="statRow">
                                    <td width="45%">ABILITY:</td><td class="statRowColW" width="55%">PASSIVE</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >DAMAGE:</td><td class="statRowColW">MAGICAL</td>
                                </tr>
                                <tr class="statRow">
                                    <td >DAMAGE:</td><td class="statRowColW">50/75/100/125</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >RADIUS:</td><td class="statRowColW">300</td>
                                </tr>
                                <tr class="statRow">
                                    <td >DURATION:</td><td class="statRowColW">0.6/0.9/1.2/1.5</td>
                                </tr>
                            </table>
                        </div>
                        <div id="abi4" class="abicontent cont hided">
                            <p><strong>Echo Slam</strong></p>
                            <p>Shockwaves travel through the ground, damaging enemy units. Each enemy hit causes an echo to damage nearby units. Upgradable by Aghanim's Scepter.</p>
                            <br>
                            <table class="stattable"  border="0"  cellspacing="0" cellpadding="4">
                                <tr class="statRow">
                                    <td width="45%">MANA COST:</td><td class="statRowColW" width="55%">145 / 205 / 265</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >COOLDOWN:</td><td class="statRowColW">150.0 / 130.0 / 110.0</td>
                                </tr>
                                <tr class="statRow">
                                    <td >ABILITY:</td><td class="statRowColW">NO TARGET</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >DAMAGE:</td><td class="statRowColW">MAGICAL</td>
                                </tr>
                                <tr class="statRow">
                                    <td >DAMAGE:</td><td class="statRowColW">200 / 265 / 340</td>
                                </tr>
                                <tr class="statRowB">
                                    <td >RADIUS:</td><td class="statRowColW">500</td>
                                </tr>
                                <tr class="statRow">
                                    <td >ECHO DAMAGE:</td><td class="statRowColW">40 / 55 / 70</td>
                                </tr>
                            </table>
                        </div>
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

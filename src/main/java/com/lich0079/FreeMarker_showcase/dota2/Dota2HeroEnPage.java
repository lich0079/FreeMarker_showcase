package com.lich0079.FreeMarker_showcase.dota2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.lich0079.FreeMarker_showcase.interfaces.IRootGenerator;
import com.lich0079.FreeMarker_showcase.util.FileUtil;
import com.lich0079.FreeMarker_showcase.util.Generator;
import com.lich0079.FreeMarker_showcase.util.HttpUtil;

import freemarker.template.utility.StringUtil;

@SuppressWarnings({"unchecked","rawtypes"})
public class Dota2HeroEnPage implements IRootGenerator {

	public Map getRoot(Map parameter) throws Throwable {
		Map result = new HashMap();
		String href = (String) parameter.get("href");
		Document mainDoc = Jsoup.parse(HttpUtil.getHtmlString(href));
		
		
		String herocode = mainDoc.select("#heroTopPortraitIMG").attr("src").replace("http://cdn.dota2.com/apps/dota2/images/heroes/", "").split("_")[0];
		result.put("herocode", herocode);
		
		String name = mainDoc.select("#centerColContent  h1").text();
		result.put("name", name.toUpperCase());
		
		String attackType = mainDoc.select("#heroBioRoles  span").text();
		result.put("attackType", attackType);
		
		String roles = mainDoc.select("#heroBioRoles").text();
		result.put("roles", handleRoles(roles));
		
		
		String overview_IntVal = mainDoc.select("#overview_IntVal").text();
		result.put("overview_IntVal", overview_IntVal);
		
		String overview_AgiVal = mainDoc.select("#overview_AgiVal").text();
		result.put("overview_AgiVal", overview_AgiVal);
		
		String overview_StrVal = mainDoc.select("#overview_StrVal").text();
		result.put("overview_StrVal", overview_StrVal);
		
		String overviewIcon_Primary = mainDoc.select("#overviewIcon_Primary").attr("style");
		result.put("overviewIcon_Primary", handlePrimary(overviewIcon_Primary));
		
		String overview_AttackVal = mainDoc.select("#overview_AttackVal").text();
		result.put("overview_AttackVal", overview_AttackVal);
		
		String overview_SpeedVal = mainDoc.select("#overview_SpeedVal").text();
		result.put("overview_SpeedVal", overview_SpeedVal);
		
		String overview_DefenseVal = mainDoc.select("#overview_DefenseVal").text();
		result.put("overview_DefenseVal", overview_DefenseVal);
		
		Elements  statsL = mainDoc.select("#statsLeft .statRowColW");
		
		result.put("hp1", statsL.get(2).text());
		result.put("hp2", statsL.get(1).text());
		result.put("hp3", statsL.get(0).text());
		
		result.put("mp1", statsL.get(5).text());
		result.put("mp2", statsL.get(4).text());
		result.put("mp3", statsL.get(3).text());
		
		result.put("at1", statsL.get(8).text());
		result.put("at2", statsL.get(7).text());
		result.put("at3", statsL.get(6).text());
		
		result.put("ac1", statsL.get(11).text());
		result.put("ac2", statsL.get(10).text());
		result.put("ac3", statsL.get(9).text());
		
		Elements  statsR = mainDoc.select("#statsRight .statRowCol2W");
		
		result.put("s_range", statsR.get(0).text());
		result.put("a_range", statsR.get(1).text());
		result.put("m_speed", statsR.get(2).text());
		
		String bioInner = mainDoc.select("#bioInner").text();
		result.put("bioInner", bioInner);
		
		Elements  abilities = mainDoc.select("#abilitiesInner .abilitiesInsetBoxInner");
		List abilitiesList = new ArrayList();
		for (Element ability : abilities) {
			Map abi = new HashMap();
			String ability_img = getAbilityImg(ability.select(".overviewAbilityImg").attr("src"));
			abi.put("ability_img", ability_img);
			String ability_name = ability.select(".abilityHeaderRowDescription h2").text();
			abi.put("ability_name", ability_name);
			String ability_desc = ability.select(".abilityHeaderRowDescription p").text();
			abi.put("ability_desc", ability_desc);
			
			List stats  = new ArrayList();
			
			String manaName = ability.select(".mana .manaCoolKey").text();
			if(StringUtils.isNotBlank(manaName)){
				String manaValue = ability.select(".mana").text().replace(manaName+" ", "");
				stats.add(warpMap("stat_name",manaName,"stat_value",manaValue));
			}
			
			String cdName = ability.select(".cooldown .manaCoolKey").text();
			if(StringUtils.isNotBlank(cdName)){
				String cdValue = ability.select(".cooldown").text().replace(cdName+" ", "");
				stats.add(warpMap("stat_name",cdName,"stat_value",cdValue));
			}
			
			String abilityFooterBox = ability.select(".abilityFooterBox").text();
			
			Elements attribVals = ability.select(".abilityFooterBox .attribVal");
			for (Element val : attribVals) {
				abilityFooterBox = abilityFooterBox.replace(val.text(), "");
			}
			String[] stat_names = abilityFooterBox.split(": ");
			for (int i = 0; i < stat_names.length; i++) {
				stats.add(warpMap("stat_name",stat_names[i].trim()+":","stat_value",attribVals.get(i).text()));
			}
			
			abi.put("stats", stats);
			abilitiesList.add(abi);
		}
		result.put("abilitiesList", abilitiesList);
		
		
		
		
		
//		System.out.println(result);
		return result;
	}
	
	private Map warpMap(String k1, String v1, String k2, String v2){
		Map m = new HashMap();
		m.put(k1, v1);
		m.put(k2, v2);
		return m;
	}
	private String getAbilityImg(String src) {
		int last = src.lastIndexOf("/");
		int lastQ = src.lastIndexOf("?");
		return src.substring(last+1,lastQ);
	}

	private String handlePrimary(String overviewIcon_Primary){
		String px = overviewIcon_Primary.replace("top:", "").replace("px", "");
		if(px.equals("1")){
			return "Int";
		}else if(px.equals("43")){
			return "Agi";
		}else{
			return "Str";
		}
		
	}
	
	private List handleRoles(String roles){
		List l = new ArrayList();
		String[] rolesArr = roles.split(" - ");
		if (rolesArr.length > 1) {
			for (int i = 1; i < rolesArr.length; i++) {
				l.add(rolesArr[i]);
			}
		}
		return l;
	}

	public static void main(String[] args) throws Throwable {
		
		Generator generator = new Generator("/dota2/hero_en.ftl", new Dota2HeroEnPage());
		
		String path = FileUtil.class .getResource("/").getPath()+"test"+".html";
		Map parameter = new HashMap();
		parameter.put("href", "http://www.dota2.com/hero/Earthshaker/");
		generator.generateResult(parameter, path);
	}
}

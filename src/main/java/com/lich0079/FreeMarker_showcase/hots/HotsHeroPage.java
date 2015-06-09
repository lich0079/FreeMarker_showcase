package com.lich0079.FreeMarker_showcase.hots;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.lich0079.FreeMarker_showcase.interfaces.IRootGenerator;
import com.lich0079.FreeMarker_showcase.util.FileUtil;
import com.lich0079.FreeMarker_showcase.util.Generator;
import com.lich0079.FreeMarker_showcase.util.HttpUtil;

@SuppressWarnings({"unchecked","rawtypes"})
public class HotsHeroPage implements IRootGenerator {

	public Map getRoot(Map parameter) throws Throwable {
		Map result = new HashMap();
		String href = (String) parameter.get("href");
		String locale = (String) parameter.get("locale");
		Document mainDoc = Jsoup.parse(HttpUtil.getHtmlString2(href));
		
		String name = mainDoc.select(".hero-info-container h2").text();
		result.put("name", name);
		
		String codename = mainDoc.select(".hero-info-container").attr("class").split(" ")[1];
		result.put("codename", codename);
		
		String urlName = codename;
		if(urlName.equals("e-t-c")){
			urlName = "etc";
		}else if(urlName.equals("li-li")){
			urlName = "lili";
		}
		Document bioDoc = Jsoup.parse(HttpUtil.getHtmlString2("http://us.battle.net/heroes/en/heroes/"+urlName+"/"));
		String bio = bioDoc.select(".hero-description").text();
		result.put("bio", bio);
		
		String domian = mainDoc.select(".hero-info-container span").attr("class").split(" ")[1];
		result.put("domian", domian);
		
		String short_desc = mainDoc.select(".hero-info-container h3").text();
		result.put("short_desc", short_desc);
		
		String desc = mainDoc.select(".hero-info-container .desc").text();
		result.put("desc", desc);
		
		String role = mainDoc.select("li[class=role]").text();
		result.put("role", role);
		
		String atype = mainDoc.select("ul[class*=hero-type] li:not(.role)").text();
		result.put("atype", atype);
		
		Elements hpEle = mainDoc.select("ul[class=hero-hp] li");
		result.put("hp", hpEle.get(0).text());
		result.put("hp_regen", hpEle.get(1).text());
		
		Elements mpEle = mainDoc.select("ul[class=hero-mana] li");
		result.put("mp", mpEle.get(0).text());
		result.put("mp_regen", mpEle.get(1).text());
		
		Elements atkEle = mainDoc.select("ul[class=hero-atk] li");
		result.put("atkD", atkEle.get(0).text());
		result.put("atkS", atkEle.get(1).text());
		
		List abilities = new ArrayList();
		
		Elements abisEle = mainDoc.select("div[class=t-hero-ability]");
		for (Element element : abisEle) {
			Map m = new HashMap();
			
			String abiName = element.select(".t-ability-desc h4").text();
			m.put("abiName", abiName);
			String imgUrl = element.select("img").attr("src");
			HttpUtil.downloadImg(imgUrl, abiName+".png");
			String key = element.select(".t-hero-ability-hotkey").text();
			m.put("key", key);
			
			String cd = element.select(".t-hero-ability-cooldown span").text();
			m.put("cd", cd);
			
			String abiDesc = element.select(".t-ability-desc div").text();
			m.put("abiDesc", abiDesc);
			
			String abiType = element.select(".t-hero-ability-type").text();
			m.put("abiType", abiType);
			
			abilities.add(m);
		}
		result.put("abilities", abilities);
		
		
		List talents = new ArrayList();
		
		Elements talentsEle = mainDoc.select(".p-talentCalc-primary ul");
		for (Element element : talentsEle) {
			List level = new ArrayList();
			String levelStr = element.select(".level").text();
			level.add(levelStr);
			Elements eles = element.select(".talent");
			for (Element ele : eles) {
				Map m = new HashMap();
				String tName = ele.select("> span:not(.t-hero-ability-cooldown)").text();
				m.put("tName", tName);
				String imgUrl = ele.select("img").attr("src");
				String imgName = ele.select("a").attr("href").substring(9);
				HttpUtil.downloadImg(imgUrl, imgName+".png");
				m.put("tImg", imgName+".png");
				String tDesc = ele.select("div").text();
				m.put("tDesc", tDesc);
				String tCD = ele.select(".t-hero-ability-cooldown span").text();
				m.put("tCD", tCD);
				
				
				level.add(m);
			}
			
			talents.add(level);
		}
		result.put("talents", talents);
		
//		System.out.println(result);
		return result;
	}

	public static void main(String[] args) throws Throwable {
		Generator generator = new Generator("/hots/hero.ftl", new HotsHeroPage());
		
		String path = "test"+".html";
		Map parameter = new HashMap();
		parameter.put("href", "http://www.heroesnexus.com/heroes/20-e-t-c");
		parameter.put("locale","en");
		generator.generateResult(parameter, path, false);
	}
}

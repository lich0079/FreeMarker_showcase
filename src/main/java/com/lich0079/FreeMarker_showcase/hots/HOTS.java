package com.lich0079.FreeMarker_showcase.hots;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.lich0079.FreeMarker_showcase.util.Generator;
import com.lich0079.FreeMarker_showcase.util.HttpUtil;

@SuppressWarnings({"unchecked","rawtypes"})
public class HOTS {

	public static void main(String[] args) throws Throwable {
		Document mainDoc = Jsoup.parse(HttpUtil.getHtmlString2("http://www.heroesnexus.com/"));
		Elements heros = mainDoc.select(".listing-champs-visual  a"); 
		System.out.println(heros.size());
		for (Element element : heros) {
			String path = null;
			try {
				
				String href = element.attr("href");
				String tmp = href.split("-")[0];
				String herocode = href.replace(tmp+"-", "");
				Generator generator = new Generator("/hots/hero.ftl", new HotsHeroPage());
				
				path = herocode+".html";
				Map parameter = new HashMap();
				parameter.put("href", "http://www.heroesnexus.com"+href);
				generator.generateResult(parameter, path, false);
			} catch (Throwable e) {
				System.out.println("error when generate "+path);
				e.printStackTrace();
			}
			
		}
	}

}

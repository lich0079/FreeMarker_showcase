package com.lich0079.FreeMarker_showcase.dota2;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.lich0079.FreeMarker_showcase.util.FileUtil;
import com.lich0079.FreeMarker_showcase.util.Generator;
import com.lich0079.FreeMarker_showcase.util.HttpUtil;

@SuppressWarnings({"unchecked","rawtypes"})
public class Dota2 {
	public static void main(String[] args) throws Throwable {
		Document mainDoc = Jsoup.parse(HttpUtil.getHtmlString("http://www.dota2.com/heroes/"));
		Elements heros = mainDoc.select(".heroIcons  a"); 
		System.out.println(heros.size());
		for (Element element : heros) {
			String path = null;
			try {
				final String herocode = element.attr("id").replace("link_", "");
				final String href = element.attr("href");
				Generator generator = new Generator("/dota2/hero.ftl", new Dota2HeroPage());
				
				path = FileUtil.class .getResource("/").getPath()+herocode+".html";
				Map parameter = new HashMap();
				parameter.put("href", href+"?l=schinese");
				parameter.put("locale","zh");
				generator.generateResult(parameter, path, false);
			} catch (Throwable e) {
				System.out.println("error when generate"+path);
				e.printStackTrace();
			}
			
		}
	}
}

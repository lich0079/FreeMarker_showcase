package com.lich0079.FreeMarker_showcase;


import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.lich0079.FreeMarker_showcase.interfaces.IRootGenerator;
import com.lich0079.FreeMarker_showcase.util.FileUtil;
import com.lich0079.FreeMarker_showcase.util.Generator;
import com.lich0079.FreeMarker_showcase.util.HttpUtil;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;



/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) throws Throwable {
		Configuration cfg = new Configuration();
		cfg.setClassForTemplateLoading(App.class, "/templates");
		cfg.setObjectWrapper(new DefaultObjectWrapper());
		cfg.setDefaultEncoding("UTF-8");
		
		Template temp = cfg.getTemplate("/dota2/hero_en.ftl");
		
		Document mainDoc = Jsoup.parse(HttpUtil.getHtmlString("http://www.dota2.com/heroes/?l=english"));
		Elements heros = mainDoc.select(".heroIcons  a"); 
		for (Element element : heros) {
			final String heroname = element.attr("id").replace("link_", "");
			Generator generator = new Generator("/dota2/hero_en.ftl", new IRootGenerator() {
				
				public Map getRoot(Map parameter) {
					Map root = new HashMap();
					root.put("heroname", heroname);
					return root;
				}
			});
			
			String path = FileUtil.class .getResource("/").getPath()+heroname+".html";
			generator.generateResult(null, path, true);
		}
		
	}
}

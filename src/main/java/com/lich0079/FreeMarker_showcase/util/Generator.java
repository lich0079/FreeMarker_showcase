package com.lich0079.FreeMarker_showcase.util;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import com.lich0079.FreeMarker_showcase.interfaces.IRootGenerator;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class Generator {

	private String ftl;
	private IRootGenerator rootGenerator;
	private Template temp;
	
	public Generator(String ftl, IRootGenerator rootGenerator) {
		super();
		this.ftl = ftl;
		this.rootGenerator = rootGenerator;
	}

	public static final Configuration cfg = new Configuration();
	static{
		cfg.setClassForTemplateLoading(Generator.class, "/templates");
		cfg.setObjectWrapper(new DefaultObjectWrapper());
		cfg.setDefaultEncoding("UTF-8");
	}
	
	protected Template getTemplate() throws IOException{
		if(temp == null){
			synchronized(this){
				if(temp == null){
					temp = cfg.getTemplate(ftl);
				}
			}
		}
		return temp;
	}
	
	public void generateResult(Map parameter, String resultPath) throws Throwable{
		Template temp = getTemplate();
		Map root = rootGenerator.getRoot(parameter);
		Writer out = new OutputStreamWriter(System.out);
//				new BufferedWriter(new OutputStreamWriter( new FileOutputStream(resultPath), "UTF-8"));
    	temp.process(root, out);
    	out.flush();
    	System.out.println("write to "+resultPath);
	}
}

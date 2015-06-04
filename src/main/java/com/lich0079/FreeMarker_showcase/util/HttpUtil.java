package com.lich0079.FreeMarker_showcase.util;

import java.io.IOException;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class HttpUtil {

	public static final String proxyUrl = "161.92.51.225";
	public static final int proxyPort = 8080;
	
	
	public static String getHtmlString(String url) throws ClientProtocolException, IOException{
		HttpClient httpclient = new DefaultHttpClient();
		
		//if you under a proxy
        HttpHost proxy = new HttpHost(proxyUrl, proxyPort, "http");
        httpclient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy);
        
        HttpGet request = new HttpGet(url);
		HttpResponse res = httpclient.execute( request);
		return EntityUtils.toString(res.getEntity(),"UTF-8");
	}
}

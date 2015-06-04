package com.lich0079.FreeMarker_showcase.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;

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
	
	public static void downloadImg(String src, String name){
		try {
			URL url = new URL(src);
			Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(HttpUtil.proxyUrl, HttpUtil.proxyPort));
			InputStream in = new BufferedInputStream(url.openConnection(proxy).getInputStream());
			OutputStream out = new BufferedOutputStream(new FileOutputStream(name));

			for ( int i; (i = in.read()) != -1; ) {
			    out.write(i);
			}
			in.close();
			out.close();
		} catch (Throwable e) {
			e.printStackTrace();
			System.out.println("error when fetch "+src);
		}
	}
}

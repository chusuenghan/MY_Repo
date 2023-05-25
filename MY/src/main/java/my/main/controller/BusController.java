package my.main.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import my.train.controller.ApiExplorer.Item;

@Controller
public class BusController {
	@RequestMapping(value="/busgps.do")
	@ResponseBody
	public ModelAndView trainTimeSelect() throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		
        /*StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); URL
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="); Service Key
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 페이지번호
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); 한 페이지 결과 수
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); 데이터 타입(xml, json)
        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode("38080", "UTF-8")); 도시코드 [상세기능3 도시코드 목록 조회]에서 조회 가능
        urlBuilder.append("&" + URLEncoder.encode("nodeId","UTF-8") + "=" + URLEncoder.encode("1109", "UTF-8")); 정류소ID [국토교통부(TAGO)_버스정류소정보]에서 조회가능*/
        
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=g64N2sgi7eIqYD9JSElDNMs%2FOWCkZBXSs5dRX503xwUvswXQVVsofejAEPeOBKSvBbHC0l5A%2FZIVg98A9zRIjw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode("38080", "UTF-8")); /*도시코드 [상세기능3 도시코드 목록 조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("nodeId","UTF-8") + "=" + URLEncoder.encode("MYB46", "UTF-8")); /*정류소ID [국토교통부(TAGO)_버스정류소정보]에서 조회가능*/
        URL url = new URL(urlBuilder.toString());

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        InputSource inputSource = new InputSource(rd);

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(inputSource);
        document.getDocumentElement().normalize();

        NodeList itemElements = document.getElementsByTagName("item");
        List<Item> items = new ArrayList<Item>();
        System.out.println("파싱할 리스트 수 : "+ itemElements.getLength());
        for (int i = 0; i < itemElements.getLength(); i++) {
        	Node iNode = itemElements.item(i);
        	Element element = (Element) iNode;
        	String arrprevstationcnt = element.getElementsByTagName("arrprevstationcnt").item(0).getTextContent();
        	String arrtime = element.getElementsByTagName("arrtime").item(0).getTextContent();
        	String nodenm = element.getElementsByTagName("nodenm").item(0).getTextContent();
        	String routeno = element.getElementsByTagName("routeno").item(0).getTextContent();
        	int arrtime2 = Integer.parseInt(arrtime);
        	arrtime2 = arrtime2/60;
        	arrtime = Integer.toString(arrtime2);
        	
        	items.add(new Item(arrprevstationcnt, arrtime, nodenm, routeno));
        }
        rd.close();
        conn.disconnect();
        for(Item i : items) { //for문을 통한 전체출력
            System.out.println(i.arrprevstationcnt + " " + i.arrtime);
        }
        
        mav.addObject("items", items);
        
        return mav;
    }
	
	
	public static class Item {
	    private String arrprevstationcnt; //남은 구간
	    private String arrtime; //남은 시간(초, 60초단위)
	    private String nodenm; //도착 정류소 명
	    private String routeno; //버스루트 이름
	    
	    public Item(String arrprevstationcnt, String arrtime, String nodenm, String routeno) {
	        this.arrprevstationcnt = arrprevstationcnt;
	        this.arrtime = arrtime;
	        this.nodenm = nodenm;
	        this.routeno = routeno;
	    }

		public String getArrprevstationcnt() {
			return arrprevstationcnt;
		}

		public void setArrprevstationcnt(String arrprevstationcnt) {
			this.arrprevstationcnt = arrprevstationcnt;
		}

		public String getArrtime() {
			return arrtime;
		}

		public void setArrtime(String arrtime) {
			this.arrtime = arrtime;
		}

		public String getNodenm() {
			return nodenm;
		}

		public void setNodenm(String nodenm) {
			this.nodenm = nodenm;
		}

		public String getRouteno() {
			return routeno;
		}

		public void setRouteno(String routeno) {
			this.routeno = routeno;
		}
	}
}

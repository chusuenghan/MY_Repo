package my.train.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
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

import my.train.service.TrainService;

@Controller
public class ApiExplorer {
	
	@Autowired
	TrainService trainService;
	
	@RequestMapping(value="/trainTimeList.do")
	@ResponseBody
	public ModelAndView trainTimeSelect(@RequestParam("stationName") String stationName) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		String stationId = trainService.selectStationId(stationName);
		String nowDate = CurrentDate();
		String nowTime = CurrentDateTime();
		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("70", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode("NAT013841", "UTF-8")); /*출발기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(stationId, "UTF-8")); /*도착기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(nowDate, "UTF-8")); /*출발일(YYYYMMDD)*/
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
        	String depplacename = element.getElementsByTagName("depplacename").item(0).getTextContent();
        	String depplandtime = element.getElementsByTagName("depplandtime").item(0).getTextContent();
        	String arrplacename = element.getElementsByTagName("arrplacename").item(0).getTextContent();
        	String arrplandtime = element.getElementsByTagName("arrplandtime").item(0).getTextContent();
        	String traingradename = element.getElementsByTagName("traingradename").item(0).getTextContent();
        	
        	if (depplandtime.compareTo(nowTime) > 0) {
        		depplandtime = depplandtime.substring(8, 10) + ":" +depplandtime.substring(10, 12);
        		arrplandtime = arrplandtime.substring(8, 10) + ":" +arrplandtime.substring(10, 12);
                items.add(new Item(depplacename, depplandtime, arrplacename, arrplandtime, traingradename));
            }
        	
        }
        rd.close();
        conn.disconnect();
        for(Item i : items) { //for문을 통한 전체출력
            System.out.println(i.arrplacename + " " + i.arrplandtime);
        }
        
        mav.addObject("items", items);
        
        return mav;
    }
	
	public String CurrentDate() {
		 
        // 현재 날짜/시간
        Date now = new Date();
 
        // 현재 날짜/시간 출력
        System.out.println(now); // Thu Jun 17 06:57:32 KST 2021
 
 
        // 포맷팅 정의
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
 
        // 포맷팅 적용
        String formatedNow = formatter.format(now);
        
        return formatedNow;
	}
	
	public String CurrentDateTime() {
		 
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		
		LocalDateTime currentTime = LocalDateTime.now();
		
		String currentDateTimeString = currentTime.format(formatter);
        
        return currentDateTimeString;
	}
	
	public static class Item {
	    private String depplacename;
	    private String depplandtime;
	    private String arrplacename;
	    private String arrplandtime;
	    private String traingradename;
	    
	    public Item(String depplacename, String depplandtime, String arrplacename, String arrplandtime, String traingradename) {
	        this.depplacename = depplacename;
	        this.depplandtime = depplandtime;
	        this.arrplacename = arrplacename;
	        this.arrplandtime = arrplandtime;
	        this.traingradename = traingradename;
	    }

		public String getDepplacename() {
			return depplacename;
		}

		public String getDepplandtime() {
			return depplandtime;
		}

		public String getArrplacename() {
			return arrplacename;
		}

		public String getArrplandtime() {
			return arrplandtime;
		}

		public String getTraingradename() {
			return traingradename;
		}

	}
}


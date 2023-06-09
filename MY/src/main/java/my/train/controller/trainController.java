package my.train.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import my.train.service.TrainService;
import net.sf.json.JSONObject;

@Controller
public class trainController {
	
	@Autowired
	TrainService trainService;
	
	@RequestMapping(value="trainTimeList11.do")
	@ResponseBody
	public String trainTimeSelect(@RequestParam("stationName") String stationName) throws IOException {
		
		String stationId = trainService.selectStationId(stationName);
		String nowTime = CurrentDateTime();
		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode("NAT013841", "UTF-8")); /*출발기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(stationId, "UTF-8")); /*도착기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(nowTime, "UTF-8")); /*출발일(YYYYMMDD)*/
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
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
        	System.out.println(line);
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        System.out.println(sb.toString());
        return sb.toString();
    }
	
	public String CurrentDateTime() {
		 
     /*   // 현재 시간
        LocalTime now = LocalTime.now();
 
 
        // 포맷 정의하기
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
 
        // 포맷 적용하기
        String formatedNow = now.format(formatter);*/
 
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
}


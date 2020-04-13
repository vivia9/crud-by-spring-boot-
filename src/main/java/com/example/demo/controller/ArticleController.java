package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;
import com.example.demo.response.JqgridResponse;
import com.example.demo.response.UserDto;
import com.example.demo.service.ArticleService;
import com.google.gson.JsonObject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;






@Controller

public class ArticleController {

	@Autowired
	ArticleService articleService;
	
	
	
	@RequestMapping ("/article/list")	
	public String showMain(Model model) {
		List<Article> list = articleService.getList();
		

//		model.addAttribute("list", list);
		
		
		return "article/w2ui";
	}
	
	
	

    @ResponseBody
    @RequestMapping("/test3")
    public ModelAndView test3(    
    		
    		@RequestParam(value="filters", required=false) String filters,
    		@RequestParam(value="searchLogic", required=false) Integer searchLogic,
    		@RequestParam(value="rows", required=false) Integer rows,
    		@RequestParam(value="value", required=false) String value,
    		@RequestParam(value="body", required=false) String body,
    		@RequestParam(value="request", required=false) String request)
    		throws ParseException
//    		@RequestParam(value="request[]", required=false) List<String> vals)
    {
    	
//    	String response1="{\"limit\":100,\"offset\":0,\"searchLogic\":\"OR\",\"search\":[{\"field\":\"id\",\"type\"\"in\",\"operator\":\"is\",\"value\":\"111\"},{\"field\":\"title\",\"type\":\"text\",\"operator\":\"\",\"value\":\"111\"},{\"field\":\"body\",\"type\":\"tex\",\"operator\":\"begins\",\"value\":\"111\"}]}";

			JSONParser paser1 = new JSONParser(); 
			JSONObject obj1 = (JSONObject) paser1.parse(request); 
			JSONArray parse_response1 = (JSONArray) obj1.get("search");
			
			
			if ( parse_response1 != null ) {
				
//				
//				JSONObject id_imsi1 = (JSONObject) parse_response1.get(0);
//////				String id1 = (String) id_imsi.get("field"); 
//				String text1 = (String) id_imsi1.get("value");
//				
//				JSONObject id_imsi2 = (JSONObject) parse_response1.get(1);
////				String id1 = (String) id_imsi.get("field"); 
//				String text2 = (String) id_imsi2.get("value");
//						
//				JSONObject id_imsi3 = (JSONObject) parse_response1.get(2);
////				String id1 = (String) id_imsi.get("field"); 
//				String text3 = (String) id_imsi3.get("value");
//						
				String nameid= null;
    	    	String nametitle=null;
    	    	String nametbody=null;
				
				
		    for (int i = 0; i < parse_response1.size(); i++) { // 해당 JSONArray객체에 값을 차례대로 가져와서 읽습니다. 
    	    	JSONObject imsi = (JSONObject) parse_response1.get(i); 
				
    	    	String name = (String) imsi.get("field");
    	    
    	    	
    	    	 switch (name) {
    	    	 
    	    	 case "title" :   nametitle = (String) imsi.get("value");
    	    	 break;
    	    	 
    	    	 case "body" :   nametbody = (String) imsi.get("value");
    	    	 break;
    	    	 
    	    	 case "id" :  nameid = (String) imsi.get("value") ;
    	    	 break;
    	    	 
    	    	 }
    	    	 
    	    	 System.out.println("====================");
    	
    
    	    	 
    	    	
		    }
		    
	    	 System.out.println("id:" + nameid );
	    	 System.out.println("title:" + nametitle );
	    	 System.out.println("body" + nametbody );
	    	 
		    
    		}; 	
	        	    
    	 ModelAndView mv = new ModelAndView("jsonView");
    
    	    
    	 List<Article> list = articleService.getList();
    
    	    int totalCnt = 3;
    	    
    	    
    	    mv.addObject("total", totalCnt);
    	    mv.addObject("records", list);
    	

    	    return mv;
    	    
    	    
    	    
    	    
    }
	

    
    
    public static void main(String[] agrs) throws ParseException
    { /** 파싱 하기 */ // 아래와 같은 문자열 JSON데이터가 있습니다. 이데이터는 위에서 작성한 데이터와 일치합니다
    String response = "{\"response\":{\"header\":{\"code\":\"00\",\"error\":\"faile\"},\"body\":{\"items\":{\"itemlist\":[{\"name\":\"서울\",\"age\":\"10\"},{\"name\":\"대전\",\"age\":\"20\"},{\"name\":\"대구\",\"age\":\"30\"}]}}}}"; 
    JSONParser paser = new JSONParser(); //JSON Parser객채를 만듭니다. parser를 통해서 파싱을 합니다. 
    JSONObject obj = (JSONObject) paser.parse(response); //Parser로 문자열 데이터를 JSON데이터로 변환합니다.
    // 한번에 제일 아랫단에 갈 수는 없다 차례대로 찾아가자 
    // response 가져오기 
    JSONObject parse_response = (JSONObject) obj.get("response");
    //response key값에 맞는 Value인 JSON객체를 가져옵니다. // response 로 부터 body 찾아오기 
    JSONObject parse_body = (JSONObject) parse_response.get("body"); // body 로 부터 items 받아오기
    JSONObject parse_items = (JSONObject) parse_body.get("items"); // items로 부터 itemlist 를 받아옵니다. itemlist : 뒤에 [ 로 시작하므로 jsonarray입니다. 
    JSONArray parse_itemlist = (JSONArray) parse_items.get("itemlist"); // 각각 요소 출력 
    for (int i = 0; i < parse_itemlist.size(); i++) { // 해당 JSONArray객체에 값을 차례대로 가져와서 읽습니다. 
    	JSONObject imsi = (JSONObject) parse_itemlist.get(i); String name = (String) imsi.get("name"); 
    	String age = (String) imsi.get("age"); 
    	System.out.println("배열의 " + i + "번째 요소"); 
    	System.out.println("name : " + name); 
    	System.out.println("age : " + age); } }
   

	
	
	
	
	
	
	
	
}

package com.eventopia.community;

import org.springframework.stereotype.C;

@Controller
public class BulletinBoardC {
	
	@GetMapping("/bulletinboard")
	public String getBulletinboard() {
		//bulletinboard.htmlに画面遷移
		return "bulletinboard";
	}
	
	@PostMapping("/bulletinboard")
	public String postRequest(@RequestParam("name")String name,
			@RequestParam("content")String content, Model model) {
		
		//画面から受けとった文字列をModelに登録
		model.addAttribute("name", name);
		model.addAttribute("content", content);
		
		//response.htmlに遷移
		return "hello/response";
	}

}

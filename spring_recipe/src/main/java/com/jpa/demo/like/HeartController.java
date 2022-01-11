package com.jpa.demo.like;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jpa.demo.board.Board;
import com.jpa.demo.board.BoardService;
import com.jpa.demo.user.User;

@Controller
@RequestMapping("/heart")
public class HeartController {

	@Autowired
	private HeartService service;
	

	@Autowired
	private BoardService bservice;
	
	@ResponseBody
	@RequestMapping("/likeheart")
	public Map likeHeart(Heart h) {
		
		Map map = new HashMap();
//		String userId = h.getUser().getId();
//		int boardNum = h.getBoard().getNum();
		Heart h2 = service.getByHeart(h.getUser(), h.getBoard());
		boolean flag = false;
		if(h2!=null) {
			//db에 있으면 삭제
			service.delHeart(h2.getNum());
			flag = true;
		}else {
			//db에 없으면 저장
			service.saveHeart(h);
		}
		map.put("flag", flag);
		
		return map;
	}


	@GetMapping("/list")
	public String allHeart(User u, Map map) {
		ArrayList<Heart> list = service.getByUser(u);
		ArrayList<Board> board_list = new ArrayList<Board>();
		for(Heart h : list) {
			board_list.add(bservice.getByNum(h.getNum()));
		}
		map.put("list", list);
		map.put("board_list", board_list);
		return "heart/list";
	}

	
	
	@GetMapping("/del/{num}")
	public String delHeart(@PathVariable("num") int num) {
		service.delHeart(num);
		return "redirect:/heart/list";
	}
}

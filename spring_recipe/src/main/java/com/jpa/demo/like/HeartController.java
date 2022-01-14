package com.jpa.demo.like;

import java.util.ArrayList;
//github.com/sangeun-b/Recipe_site.git
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jpa.demo.board.Board;
import com.jpa.demo.board.BoardService;
import com.jpa.demo.user.User;
import com.jpa.demo.user.UserService;

@Controller
@RequestMapping("/heart")
public class HeartController {

	@Autowired
	private HeartService service;

	@Autowired
	private BoardService bservice;
	
	@Autowired
	private UserService uservice;
	
	public String ckHeart(Board b, User u) {
		Heart h2 = service.getByHeart(u, b);
		Heart h = new Heart();
		String para = "";
		boolean flag = false;
		if(h2!=null) {
			System.out.println(h2.getNum());
			service.delHeart(h2.getNum());
			para = Integer.toString(h2.getBoard().getNum());
			flag = true;
		} else {
			h.setUser(u);
			h.setBoard(b);
			System.out.println(h);
			service.saveHeart(h);
			para = Integer.toString(h.getBoard().getNum());
		}
		return para;
	}
	@GetMapping("/likeheart/{num}")
	public String likeHeart(@PathVariable("num") int num, HttpSession session, Map map) {
		String id = (String) session.getAttribute("loginid");
		Board board = bservice.getByNum(num);
		User user = uservice.getUser(id);
		String para = ckHeart(board,user);
		
		return "redirect:/board/detail/"+para;
	}
	
	@GetMapping("/likeheartlist/{num}")
	public String likeHeartList(@PathVariable("num") int num, HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		Board board = bservice.getByNum(num);
		User user = uservice.getUser(id);
		ckHeart(board, user);
		
		return "redirect:/heart/list";
	}

	@GetMapping("/list")
	public String allHeart(HttpSession session,Map map) {
		String id = (String) session.getAttribute("loginid");
		User u = new User();
		u.setId(id);
		ArrayList<Heart> list = service.getByUser(u);
		System.out.println(list.toString());
		map.put("list", list);
		return "heart/list";
	}
	
	
	@GetMapping("/del/{num}")
	public String delHeart(@PathVariable("num") int num) {
		service.delHeart(num);
		return "redirect:/board/detail";
	}
}

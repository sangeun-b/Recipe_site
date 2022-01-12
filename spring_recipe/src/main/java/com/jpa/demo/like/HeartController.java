package com.jpa.demo.like;

import java.util.ArrayList;
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
	
//<<<<<<< HEAD
//	@ResponseBody
//	@RequestMapping("/likeheart")
//	public Map likeHeart(Heart h,Map map) {
////		String userId = h.getUser().getId();
////		int boardNum = h.getBoard().getNum();
//		Heart h2 = service.getByHeart(h.getUser(), h.getBoard());
//		boolean flag = false;
//		if(h2!=null) {
//			//db에 있으면 삭제
//			service.delHeart(h2.getNum());
//			flag = true;
//		}else {
//			//db에 없으면 저장
//			service.saveHeart(h);
//		}
//		map.put("flag", flag);
//		
//		return map;
//	}
//
//	@GetMapping("/list")
//	public String allHeart(HttpSession session,Map map) {
//		String id = (String) session.getAttribute("loginid");
//		User u = new User();
//		u.setId(id);
//		ArrayList<Heart> list = service.getByUser(u);
//		ArrayList<Board> board_list = new ArrayList<Board>();
//		for(Heart h : list) {
//			board_list.add(bservice.getByNum(h.getNum()));
//		}
//		map.put("list", list);
//		map.put("board_list", board_list);
//	
//	@GetMapping("/del/{num}")
//	public String delHeart(@PathVariable("num") int num) {
//		service.delHeart(num);
//		return "redirect:/heart/list";
//	}
//=======
	@Autowired
	private UserService uservice;
	
//	@ResponseBody
//	@RequestMapping("/likeheart")
//	public Map likeHeart(Heart h,Map map) {
////		String userId = h.getUser().getId();
////		int boardNum = h.getBoard().getNum();
//		Heart h2 = service.getByHeart(h.getUser(), h.getBoard());
//		boolean flag = false;
//		if(h2!=null) {
//			//db에 있으면 삭제
//			service.delHeart(h2.getNum());
//			flag = true;
//		}else {
//			//db에 없으면 저장
//			service.saveHeart(h);
//		}
//		map.put("flag", flag);
//		
//		return map;
//	}

	@GetMapping("/likeheart/{num}")
	public String likeHeart(@PathVariable("num") int num, HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		Board board = bservice.getByNum(num);
		User user = uservice.getUser(id);
		Heart h2 = service.getByHeart(user, board);
		Heart h = new Heart();
		String para = "";
		System.out.println(h2);
		System.out.println("why not working");
		if(h2!=null) {
			System.out.println("delete");
			System.out.println(h2.getNum());
			service.delHeart(h2.getNum());
			//map.put("b",board);
			para = Integer.toString(h2.getBoard().getNum());
		} else {
			System.out.println("save");
			h.setUser(user);
			h.setBoard(board);
			System.out.println(h);
			service.saveHeart(h);
			Board board2 = bservice.getByNum(num);
			para = Integer.toString(h.getBoard().getNum());
			//map.put("b", board2);
		}
		
		return "redirect:/board/detail/"+para;
	}
	
	@GetMapping("/likeheartlist/{num}")
	public String likeHeartList(@PathVariable("num") int num, HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		Board board = bservice.getByNum(num);
		User user = uservice.getUser(id);
		Heart h2 = service.getByHeart(user, board);
		Heart h = new Heart();
		String para = "";
		System.out.println(h2);
		System.out.println("why not working");
		if(h2!=null) {
			System.out.println("delete");
			System.out.println(h2.getNum());
			service.delHeart(h2.getNum());
			//map.put("b",board);
			para = Integer.toString(h2.getBoard().getNum());
		} else {
			System.out.println("save");
			h.setUser(user);
			h.setBoard(board);
			System.out.println(h);
			service.saveHeart(h);
			Board board2 = bservice.getByNum(num);
			para = Integer.toString(h.getBoard().getNum());
			//map.put("b", board2);
		}
		
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
//		ArrayList<Board> board_list = new ArrayList<Board>();
//		for(Heart h : list) {
//			board_list.add(bservice.getByNum(h.getNum()));
//			System.out.println(h);
//		}
//		
//		
//		map.put("board_list", board_list);
		return "heart/list";
	}
	
	
	@GetMapping("/del/{num}")
	public String delHeart(@PathVariable("num") int num) {
		service.delHeart(num);
		return "redirect:/board/detail";
	}
}

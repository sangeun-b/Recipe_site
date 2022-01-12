package com.jpa.demo.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jpa.demo.board.Board;
import com.jpa.demo.board.BoardService;
import com.jpa.demo.user.User;
import com.jpa.demo.user.UserService;

@Controller
@RequestMapping("/com")
public class CommentController {
	@Autowired
	private CommentService service;

	@Autowired
	private UserService uservice;

	@Autowired
	private BoardService bservice;

//	// 댓글작성
//	@GetMapping("/write")
//	public String write(Comment c) {
//	}
//	@GetMapping("/write")
//	public String write(Comment c) {
//		System.out.println(c);
//		System.out.println("NOOOOOOOOO");
//		service.saveComment(c);
//		return "redirect:/com/list/"+c.getBoard().getNum();
//	}

	@GetMapping("/write/{num}/{content}")
	public String writeComment(@PathVariable("num") int board_num, @PathVariable("content") String content,
			HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		User u = uservice.getUser(id);
		Board b = bservice.getByNum(board_num);
		Comment c = new Comment();
		c.setBoard(b);
		c.setWriter(u);
		c.setContent(content);
		System.out.println(c);
		service.saveComment(c);
		return "redirect:/board/detail/" + board_num;
	}

	@ResponseBody
	@GetMapping("/list/{img_num}")

	public Map list(@PathVariable("img_num") int img_num, Map map) {
		Board b = new Board();
		b.setNum(img_num);
		ArrayList<Comment> reps = service.getByBoard(b);
		map.put("reps", reps);
		return map;
	}

	@GetMapping("/del/{board_num}/{num}")
	public String delCom(@PathVariable("board_num") int board_num, @PathVariable("num") int num) {
		service.delComment(num);
		return "redirect:/board/detail/" + board_num;

	}

}
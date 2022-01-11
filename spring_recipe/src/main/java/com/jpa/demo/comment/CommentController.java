package com.jpa.demo.comment;

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

@Controller
@RequestMapping("/com")
public class CommentController {
	@Autowired
	private CommentService service;
	
	//댓글작성 
	@GetMapping("/write")
	public String write(Comment c) {
		System.out.println(c);
		System.out.println("NOOOOOOOOO");
		service.saveComment(c);
		return "redirect:/com/list/"+c.getBoard().getNum();
	}
	
	@ResponseBody
	@GetMapping("/list/{img_num}")
	public Map list(@PathVariable("img_num")int img_num){
		Map map = new HashMap();
		Board b = new Board();
		b.setNum(img_num);
		ArrayList<Comment> reps = service.getByBoard(b);
		map.put("reps", reps);
		return map;
	}
}

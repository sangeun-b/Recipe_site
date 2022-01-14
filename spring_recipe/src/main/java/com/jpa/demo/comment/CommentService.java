package com.jpa.demo.comment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jpa.demo.board.Board;

@Service
public class CommentService {
	@Autowired
	private CommentDao dao;
	
	public Comment saveComment(Comment c) {
		return dao.save(c);
	}
	public Comment getComment(int num) {
		return dao.findById(num).orElse(null);
	}
	public ArrayList<Comment> getByBoard(Board b){
		return dao.findByBoard(b);
	}
	public void delComment(int num) { //댓글삭제 
		dao.deleteById(num);
	}
}

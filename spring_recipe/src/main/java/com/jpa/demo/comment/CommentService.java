package com.jpa.demo.comment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jpa.demo.board.Board;

@Service
public class CommentService {
	@Autowired
	private CommentDao dao;
	
	public void saveComment(Comment c) {
		dao.save(c);
	}
	
	public ArrayList<Comment> getByBoard(Board b){
		return dao.findByBoard(b);
	}
}

package com.jpa.demo.heart;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jpa.demo.board.Board;
import com.jpa.demo.user.User;

@Service
public class HeartService {

	@Autowired
	private HeartDao dao;
	
	public Heart saveHeart(Heart h) {
		return dao.save(h);
	}
	
	public ArrayList<Heart> getByUser(User u) {
		return dao.findByUser(u);
	}
	
	public void delHeart(int num) {
		dao.deleteById(num);
	}
	
	public Heart getByHeart(User u, Board b) {
		return dao.findByUserAndBoard(u.getId(), b.getNum());
		
	}
}

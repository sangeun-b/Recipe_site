package com.jpa.demo.like;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jpa.demo.board.Board;
import com.jpa.demo.user.User;

public interface HeartDao extends JpaRepository<Heart, Integer> {
	
	ArrayList<Heart> findByUser(User u);
	
	Heart findByUserAndBoard(User u, Board b);
	
}

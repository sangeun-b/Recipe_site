package com.jpa.demo.board;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jpa.demo.user.User;

public interface BoardDao extends JpaRepository<Board, Integer> {

	ArrayList<Board> findByWriter(User writer);
	
	ArrayList<Board> findByTitleLike(String title);
	
	ArrayList<Board> findByCate(String cate);

}

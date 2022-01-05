package com.encore.demo.board;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.encore.demo.User.User;

public interface BoardDao extends JpaRepository<Board, Integer> {

	ArrayList<Board> findByWriter(User writer);
	
	ArrayList<Board> findByTitleLike(String title);
}

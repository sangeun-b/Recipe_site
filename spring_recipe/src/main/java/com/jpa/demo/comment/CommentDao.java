package com.jpa.demo.comment;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jpa.demo.board.Board;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	ArrayList<Comment> findByBoard(Board b);
}

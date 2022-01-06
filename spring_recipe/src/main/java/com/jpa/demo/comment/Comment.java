package com.jpa.demo.comment;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.jpa.demo.board.Board;
import com.jpa.demo.user.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@ToString
@AllArgsConstructor
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	
	@ManyToOne
	@JoinColumn(name="user_id", nullable = false)
	private User id;
	@Column(nullable = false)
	private String content;

	private Date date; 
	
	@ManyToOne
	@JoinColumn(name="board_num", nullable=false)
	private Board board;
}


//Comment – num(int, pk), id(user_id, fk), content(var, not null), date(date), board(board_num, fk) 

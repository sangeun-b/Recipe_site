package com.jpa.demo.comment;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

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
	@JoinColumn(name="board", nullable=false)
	@OnDelete(action= OnDeleteAction.CASCADE)
	private Board board;
	@ManyToOne
	@JoinColumn(name="writer", nullable=false)
	private User writer;
//	@ManyToOne
//	@JoinColumn(name="user_id", nullable = false)
//	@OnDelete(action= OnDeleteAction.CASCADE)
//	private User id;
	@Column(nullable = false)
	private String content;
	
	private Date date; 

	@PrePersist//insert 실행전 먼저 처리
	public void beforeCreate() {
		date = new Date();//현재 날짜 객체 생성
	}
//	@ManyToOne
//	@JoinColumn(name="board_num", nullable=false)
//	@OnDelete(action= OnDeleteAction.CASCADE)
//	private Board board;
}


//Comment – num(int, pk), id(user_id, fk), content(var, not null), date(date), board(board_num, fk) 


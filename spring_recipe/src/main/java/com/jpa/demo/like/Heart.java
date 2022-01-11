package com.jpa.demo.like;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.jpa.demo.board.Board;
import com.jpa.demo.user.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity  
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Heart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	
	@OneToOne
	@JoinColumn(name="board_num", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE) 
	private Board board;
	
	@ManyToOne
	@JoinColumn(name="user_id", nullable = false)
	@OnDelete(action=OnDeleteAction.CASCADE) 
	private User user;
//
}

package com.jpa.demo.board;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Transient;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.web.multipart.MultipartFile;

import com.jpa.demo.user.User;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Entity  //엔터티(테이블) 정의
@Setter
@Getter
@ToString
public class Board {
//Board – num(int, pk), title(var, not null), 
//	content(var, not null), 작성자id(user_id, fk), 
//	date(date), difficulty(1~5), 
//	cate(1-한식 2-양식 3-일식 4-중식 5-기타)  
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int num;
	
	@ManyToOne
	@JoinColumn(name="writer", nullable=false)//체크
	@OnDelete(action= OnDeleteAction.CASCADE)
	private User writer;
	private String title;
	private String content;
	private Date date;
	private String difficulty;
	private String cate;
	
	@Transient
	private ArrayList img_path; //이미지
	
	@PrePersist//insert 실행전 먼저 처리
	public void beforeCreate() {
		date = new Date();//현재 날짜 객체 생성
	}
	
	@Transient   //테이블 컬럼으로 만들지마라. 폼에서 값을 받아오는 용도로 사용. 
	private MultipartFile file;
}

package com.encore.demo.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.encore.demo.User.User;


@Service
public class BoardService {

	@Autowired
	private BoardDao dao;
	
	public Board saveBoard(Board b) {
		return dao.save(b);
	}
	
	public Board getByNum(int num) {//번호로 검색
		return dao.findById(num).orElse(null);
	}
	public ArrayList<Board> getAll(){//전체검색
		return (ArrayList<Board>) dao.findAll();
	}
	
	public ArrayList<Board> getByWriter(User writer){//작성자로 검색
		return dao.findByWriter(writer);
	}
	
	public ArrayList<Board> getByTitle(String title){//제목으로 검색
		return dao.findByTitleLike(title);
	}
	
	public void delBoard(int num) {//삭제
		dao.deleteById(num);
	}
}

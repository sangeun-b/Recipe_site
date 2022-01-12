package com.jpa.demo.like;

import java.util.ArrayList;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;

import com.jpa.demo.board.Board;
import com.jpa.demo.user.User;

public interface HeartDao extends JpaRepository<Heart, Integer> {
	
	ArrayList<Heart> findByUser(User u);

//	Heart findByUserAndBoard(String userId, int boardNum);
	
	Heart findByUserAndBoard(User u, Board b);
	
//	@Query("SELECT h FROM Heart * join User as u on h.user_id = u.user_id join Board as b on b.board_num = h.board_num WHERE user_id = ?1 AND board_num=?2")
//	Heart findByUserAndBoard(String userId, int boardNum);
	
//	@Query("SELECT h FROM Heart * join User as u on h.user_id = u.user_id join Board as b on b.board_num = h.board_num WHERE user_id =:user_id AND board_num= :board_num")
//	Heart findByUserAndBoard(@Param("user_id") String userId, @Param("board_num") int boardNum);

	
//	@Query("SELECT h FROM Heart h WHERE h.user_id =?1 AND h.board_num=?2")
//	Heart findByClick(String userId, int boardNum);

}

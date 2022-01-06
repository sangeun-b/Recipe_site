package com.jpa.demo.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	private String path = "C:\\img\\imgboard\\";
	
	@GetMapping("/list")
	public void list(Map map) {
		ArrayList<Board> list = service.getAll();
		map.put("list", list);
	}
	
	@GetMapping("/write")
	public void writeForm() {}
	
//	@PostMapping("/write")
//	public String write(Board b) {
//		service.saveBoard(b);
//		return "redirect:/board/list";
//	}
	
	@PostMapping("/write")
	public String write(Board b) {
		Board b2 = service.saveBoard(b);
		
		
		MultipartFile file = b.getFile();// 업로드된 파일을 변수 file에 저장
		String ori_fname = file.getOriginalFilename();// 업로드된 원본 파일명 a.jpg
		int idxOfLastDot = ori_fname.lastIndexOf(".");// 파일명에서 .위치
		String fname = b2.getNum() + ori_fname.substring(idxOfLastDot);
		try {
			file.transferTo(new File(path + fname));// 업로드된 파일을 서버 컴퓨터(path)에 복사
			b2.setImg_path(fname);
			service.saveBoard(b2);// 방금 추가한 행의 img_path컬럼값을 방금 업로드한 경로로 수정
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/readimg/{fname}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname) {
		File f = new File(path + fname);// C:\\img\\imgboard\\fname
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));// 마임타입
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/del/{num}")
	public String del(@PathVariable("num")int num) {
		service.delBoard(num);
		return "redirect:/board/list";
	}
}

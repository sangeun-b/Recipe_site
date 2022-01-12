package com.jpa.demo.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
<<<<<<< HEAD
import org.springframework.web.server.session.HeaderWebSessionIdResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
=======
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git

import com.jpa.demo.comment.Comment;
import com.jpa.demo.comment.CommentService;
import com.jpa.demo.like.Heart;
import com.jpa.demo.like.HeartService;
import com.jpa.demo.user.User;
import com.jpa.demo.user.UserService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
<<<<<<< HEAD

	@Autowired
	private CommentService cservice;

	@Autowired
	private HeartService hservice;

	@Autowired
	private UserService uservice;

=======
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
	private String path = "C:\\img\\";

<<<<<<< HEAD
=======
	@Autowired
	private CommentService cservice;

	@Autowired
	private HeartService hservice;

	@Autowired
	private UserService uservice;

>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
	@GetMapping("/list")
	public void list(Map map) {
		ArrayList<Board> list = service.getAll();
		map.put("list", list);
	}
<<<<<<< HEAD

=======
	
	@GetMapping("/ranboard")
		public String randomBoard(Map map) {
			ArrayList<Board> list = service.getAll();
			Collections.shuffle(list);
			int r = list.get(0).getNum();			
			Board b = service.getByNum(r);
			System.out.println(b);
			map.put("b", b);
						
			return "/home";
		}
		
	
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
	@GetMapping("/write")
	public void writeForm() {
	}

//	@PostMapping("/write")
//	public String write(Board b) {
//		service.saveBoard(b);
//		return "redirect:/board/list";
//	}

	@PostMapping("/write")
	public String write(Board b) {
<<<<<<< HEAD
		String path = "C:\\img\\";
=======

		String path = "C:\\img\\";

>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
		Board b2 = service.saveBoard(b);
		// 1. 게시글 숫자에 맞게 폴더 생성
		path += b.getNum();
		File Folder = new File(path);
		if (!Folder.exists()) {
			try {
				Folder.mkdir();
				System.out.println("폴더 생성");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 있음");
		}
		// 2. 어레이 리스트 폴더에 이미지 추가

		ArrayList<MultipartFile> list = b.getFile();// 업로드된 파일을 변수 file에 저장
		// for (MultipartFile file : list) {
		for (int i = 0; i < list.size(); i++) {
			// 3. 각 이미지별 이름 다르게 저장
			String ori_fname = list.get(i).getOriginalFilename();// 업로드된 원본 파일명 a.jpg
			int idxOfLastDot = ori_fname.lastIndexOf(".");// 파일명에서 .위치
			String fname = b2.getTitle() + "-" + i + ori_fname.substring(idxOfLastDot);

			try {
				path += "\\";
				list.get(i).transferTo(new File(path + fname));// 업로드된 파일을 서버 컴퓨터(path)에 복사
				b2.setImg_path(fname);
				service.saveBoard(b2);// 방금 추가한 행의 img_path컬럼값을 방금 업로드한 경로로 수정
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
<<<<<<< HEAD

		return "redirect:/board/list";
=======
		return "redirect:/board/list_cate";
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
	}

	@GetMapping("/readimg/{fname}/{num}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname, @PathVariable("num") int num) {
		String path2 = "C:\\img\\" + num + "\\";
		File f = new File(path2 + fname);// C:\\img\\num\\fname
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
	public String del(@PathVariable("num") int num) {
		service.delBoard(num);
		return "redirect:/board/list";
<<<<<<< HEAD
=======
	}

	@GetMapping("/detail/{num}")
	public String detail(@PathVariable("num") int num, Map map, HttpSession session) {
		String id = (String) session.getAttribute("loginid");


		Board b = service.getByNum(num);

		String str = b.getContent();
		String[] strarr = str.split(",");
		ArrayList<String> strList = new ArrayList<>();
		for(int i = 0; i<strarr.length; i++) {
			strList.add(strarr[i]);
		
		String path_img = path+b.getNum();
		File dir = new File(path_img);
//		MultipartFile files[] = dir.();
		File files[] = dir.listFiles();
		ArrayList<String> fileList = new ArrayList<String>();
		
		for(int i = 1; i <files.length; i++) {
//			File file = files[i];
			String orifname = files[i].getName();
			String oriPath = path_img+"\\"+orifname;
			fileList.add(oriPath);	
		}
		System.out.println(fileList);
		System.out.println(strList);
		
		ArrayList<Comment> c = cservice.getByBoard(b);
		if (id != null || id == "") {
			User u = uservice.getUser(id);
			
			Heart h = hservice.getByHeart(u, b);
			boolean flag = false;
			if (h != null) {
				flag = true;
			}
			map.put("flag", flag);
			map.put("c", c);
			map.put("b", b);
			map.put("strList", strList);
			map.put("contentimg", fileList);
			return "board/detail";
		}

		map.put("contentimg", fileList);
		map.put("c", c);
		map.put("strList", strList);
		map.put("b", b);
		return "board/detail";
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
	}
<<<<<<< HEAD

	@GetMapping("/detail/{num}")
	public String detail(@PathVariable("num") int num, Map map, HttpSession session) {
		String id = (String) session.getAttribute("loginid");

		Board b = service.getByNum(num);
		if (id != null || id == "") {
			User u = uservice.getUser(id);
			ArrayList<Comment> c = cservice.getByBoard(b);
			Heart h = hservice.getByHeart(u, b);
			boolean flag = false;
			if (h != null) {
				flag = true;
			}
			map.put("flag", flag);
			map.put("c", c);
			map.put("b", b);

			return "board/detail";
		}
		map.put("b", b);
=======
	
//	public String Contsplit(@PathVariable("num") int num, Map map) {
//		Board b = service.getByNum(num);
//		String str = b.getContent();
//		String[] strarr = str.split(",");
//		ArrayList<String> strList = new ArrayList<>();
//		for(int i = 0; i<strarr.length; i++) {
//			strList.add(strarr[i]);
//		}
//		map.put("strList", strList);
//		return "board/detail";
//	}
//	
	public String potoget(@PathVariable("num") int num,  Map map) {
		String path = "C:\\img\\";
		File dir = new File("디렉토리패스명들어가야하는데..");
		File files[] = dir.listFiles();
		
		for(int i = 0; i<files.length; i++) {
			File file = files[i];
		}
		
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
		return "board/detail";
	}

	@PostMapping("/edit")
	public String edit(Board b) {
		service.saveBoard(b);
		return "redirect:/board/list";
	}

	@PostMapping("/getbytitle")
	public String getByTitle(String word, Map map) {
		ArrayList<Board> list = service.getByTitle("%" + word + "%");
		map.put("list", list);
		return "board/list";
	}

	@GetMapping("/list_cate")
	public void list_cate() {

	}

<<<<<<< HEAD
=======
//	@GetMapping("/list_date")
//	public String list_date(Map map) {
//		ArrayList<Board> list = service.findAllOrderByDateDesc();
//		map.put("list", list);
//		return "board/list";
//	}

>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
	@GetMapping("/write/{num}")
	public String write(@PathVariable("num") int num, Map map) {
		Board b = service.getByNum(num);
		map.put("b", b);
		return "board/write";
	}

//	@PostMapping("/getbycate")
//	public String getByCate(String word, Map map) {
//		ArrayList<Board> list = service.getByCate(word);
//		map.put("list", list);
//		return "board/list";
//	}
	@GetMapping("/getbycate/{cate}")
	public String getByCate(@PathVariable("cate") String cate, Map map) {
		ArrayList<Board> list = service.getByCate(cate);
		map.put("list", list);
		return "board/list";
	}

<<<<<<< HEAD
	// 수정페이지 이동
	@GetMapping("/modify/{num}")
	public String boardModifyGET(@PathVariable("num") int num, Map map) {
		Board b = service.getByNum(num);
		map.put("b", b);
		return "board/modify";
	}

	// 페이지 수정
	@PostMapping("/modify/{num}")
	public String boardModifyPOST(Board b, RedirectAttributes rttr) {
		service.saveBoard(b);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/detail";
	}
=======
	
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
}

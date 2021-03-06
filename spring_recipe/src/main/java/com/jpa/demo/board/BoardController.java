
package com.jpa.demo.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.Collator;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
	
	private String path = "C:\\img\\";
	
	@Autowired
	private CommentService cservice;

	@Autowired
	private HeartService hservice;

	@Autowired
	private UserService uservice;

	@GetMapping("/list")
	public void list(Map map) {
		ArrayList<Board> list = service.getAll();
		map.put("list", list);
	}

		
	@GetMapping("/ranboard")
	public String randomBoard(Map map) {
		ArrayList<Board> list = service.getAll();
		if(list!=null) {
		Collections.shuffle(list);
		int r = list.get(0).getNum();			
		Board b = service.getByNum(r);
		map.put("b", b);
		}
		return "home";
		
		}
		
	@GetMapping("/write")
	public void writeForm() {
	}

	public void saveImg(Board b) {
		String path = "C:\\img\\";
		Board b2 = service.saveBoard(b);
		// 1. ????????? ????????? ?????? ?????? ??????
		path += b.getNum();
		File Folder = new File(path);
		if (!Folder.exists()) {
			try {
				Folder.mkdir();
				System.out.println("?????? ??????");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("?????? ??????");
		}
		// 2. ????????? ????????? ????????? ????????? ??????

		ArrayList<MultipartFile> list = b.getFile();// ???????????? ????????? ?????? file??? ??????

		// for (MultipartFile file : list) {
		for (int i = 0; i < list.size(); i++) {
			// 3. ??? ???????????? ?????? ????????? ??????
			String ori_fname = list.get(i).getOriginalFilename();// ???????????? ?????? ????????? a.jpg
			int idxOfLastDot = ori_fname.lastIndexOf(".");// ??????????????? .??????
			String fname = b2.getTitle() + "-" + i + ori_fname.substring(idxOfLastDot);

			try {
				path += "\\";
				list.get(i).transferTo(new File(path + fname));// ???????????? ????????? ?????? ?????????(path)??? ??????
				b2.setImg_path(fname);
				service.saveBoard(b2);// ?????? ????????? ?????? img_path???????????? ?????? ???????????? ????????? ??????
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@PostMapping("/write")
	public String write(Board b) {
		saveImg(b);		
		return "redirect:/board/list_cate";
	}

	@GetMapping("/readimg/{fname}/{num}")
	public ResponseEntity<byte[]> read_img(@PathVariable("fname") String fname, @PathVariable("num") int num) {
		String path2 = "C:\\img\\" + num + "\\";
		File f = new File(path2 + fname);// C:\\img\\num\\fname
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));// ????????????
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public void delFile(Board b) {
		String path_img = path+b.getNum();
		File dir = new File(path_img);
		File files[] = dir.listFiles();
		if(dir.exists()) {
			try {
				File[] fileList = dir.listFiles();
				for(int j=0; j<fileList.length; j++) {
					fileList[j].delete();
					System.out.println("?????? ?????? ??????");
				}
			}catch(Exception e) {
				e.getStackTrace();
				}
		}
	}
	public void delFolder(Board b) {
		String path_img = path+b.getNum();
		File dir = new File(path_img);
		File files[] = dir.listFiles();
		if(dir.exists()) {
			try {
				File[] fileList = dir.listFiles();
				if(fileList.length==0 && dir.isDirectory()) {
					dir.delete();
					System.out.println("?????? ?????? ??????");
				}
			}catch(Exception e) {
				e.getStackTrace();
				}
		}
	}
	@GetMapping("/del/{num}")
	public String del(@PathVariable("num") int num) {
		Board b = service.getByNum(num);
		delFile(b);
		delFolder(b);
		service.delBoard(num);
		return "redirect:/board/list";
	}
	
	public ArrayList splitContent(Board b) {
		String str = b.getContent();
		String[] strarr = str.split(",");
		ArrayList<String> strList = new ArrayList<>();
		for(int i = 0; i<strarr.length; i++) {
			strList.add(strarr[i]);
		}
		return strList;
		
	}
	public ArrayList getImgFile(Board b) {
		String path_img = path+b.getNum();
		File dir = new File(path_img);
		File files[] = dir.listFiles();
		ArrayList<String> fileList = new ArrayList<String>();
		
		for(int i = 0; i <files.length-1; i++) {
			String orifname = files[i].getName();
			fileList.add(orifname);	
		}
		return fileList;
	}
	@GetMapping("/detail/{num}")
	public String detail(@PathVariable("num") int num, Map map, HttpSession session) {
		String id = (String) session.getAttribute("loginid");

		Board b = service.getByNum(num);
		
		Date d1 = b.getDate();
		SimpleDateFormat format1 = new SimpleDateFormat("YYYY??? MM??? DD???");
		String date_string = format1.format(d1);
		
		
		ArrayList strList = splitContent(b);
		ArrayList fileList = getImgFile(b);
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
			map.put("sdate", date_string);
			return "board/detail";
		}

		map.put("contentimg", fileList);
		map.put("c", c);
		map.put("strList", strList);
		map.put("b", b);
		map.put("sdate", date_string);
		return "board/detail";
	}

	@PostMapping("/getbytitle")
	public String getByTitle(String word, Map map) {
		ArrayList<Board> list = service.getByTitle("%" + word + "%");
		map.put("list", list);
		return "board/list";
	}

	@GetMapping("/getbywriter/{id}")
	public String getByWriter(@PathVariable("id")String id, Map map) {
		User writer = uservice.getUser(id);
		ArrayList<Board> list = service.getByWriter(writer);
		map.put("list", list);
		return "board/list";
	}
	
	@GetMapping("/list_cate")
	public void list_cate() {

	}

	@GetMapping("/write/{num}")
	public String write(@PathVariable("num") int num, Map map) {
		Board b = service.getByNum(num);
		map.put("b", b);
		return "board/write";
	}

	@GetMapping("/getbycate/{cate}")
	public String getByCate(@PathVariable("cate") String cate, Map map) {
		ArrayList<Board> list = service.getByCate(cate);
		map.put("list", list);
		return "board/list";
	}

	@PostMapping("/modify")
	public String update(Board b) {
		String path = "C:\\img\\";
		Date now = new Date();
		b.setDate(now);
		System.out.println(now);
		delFile(b);
		saveImg(b);
		return "redirect:/board/detail/"+b.getNum();
	}

	@GetMapping("/modify/{num}")
	public String updateForm(@PathVariable("num") int num, Map map) {
		Board b=service.getByNum(num);
		ArrayList strList = splitContent(b);
		ArrayList fileList = getImgFile(b);
		System.out.println(strList);
		System.out.println(fileList);
		map.put("b",b);
		map.put("strList", strList);
		map.put("contentimg", fileList);
		return "board/modify";
	}

}

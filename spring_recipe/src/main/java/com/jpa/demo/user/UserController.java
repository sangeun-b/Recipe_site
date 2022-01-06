package com.jpa.demo.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/join")
	public void joinForm() {
		
	}
	@PostMapping("/join")
	public String join(User u) {
		service.saveUser(u);
		return "redirect:/user/login";
	}
	
	@ResponseBody 
	@RequestMapping("idcheck")
	public Map idCheck(String id) {
		Map map = new HashMap();
		User u = service.getUser(id);
		boolean flag = false;
		if(u==null) {
			flag=true;
		}
		map.put("flag", flag);//json 형태의 값 반환. 자동으로
		return map;
		
	}
	@GetMapping("/login")
	public void loginForm() {
		
	}
	@PostMapping("/login")
	public String login(User u, HttpSession session) {
		User u2 = service.getUser(u.getId());
		System.out.println(u.getId());
		String path = "user/login";
		if(u2!=null && u2.getPwd().equals(u.getPwd())) {
			session.setAttribute("loginid", u2.getId());
			path="user/menu";
		}
		return path;
	}

	@GetMapping("/myinfo")
	public void myInfo(HttpSession session, Map map) {
		String id = (String) session.getAttribute("loginid");
		User u = service.getUser(id);
		map.put("u", u);
	}
	
	@PostMapping("/edit")
	public String edit(User u) {
		service.saveUser(u);
		return "user/menu";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	
	@GetMapping("/out")
	public String out(HttpSession session) {
		String id = (String) session.getAttribute("loginid");
		service.delUser(id);
		return "redirect:/user/logout";
	}
	

}

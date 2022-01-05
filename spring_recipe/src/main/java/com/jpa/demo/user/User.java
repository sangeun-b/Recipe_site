package com.jpa.demo.user;

@Entity  
@Setter
@Getter
@ToString
public class User {

	@Id
	private String id;
	
	@Column(nullable=false)
	private String pwd;
	
	@Column(nullable=false)
	private String email;
}
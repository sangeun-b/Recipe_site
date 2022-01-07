package com.jpa.demo.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

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
public class User {

	@Id
	private String id;
	
	@Column(nullable=false)
	private String pwd;
	
	@Column(nullable=false)
	private String email;
}
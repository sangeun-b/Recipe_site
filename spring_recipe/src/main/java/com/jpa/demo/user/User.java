package com.jpa.demo.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

<<<<<<< HEAD
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
=======
import lombok.Getter;
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
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

// User  - id(var, pk), pwd(var, not null),
// email(var, not nul

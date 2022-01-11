package com.jpa.demo.photo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PhotoDao extends JpaRepository<Photo, Long> {

}

package com.group4.miroffice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.ProjectDto;

@Mapper
public interface ProjectDao {
	
	@Select("select * from project")
	List<ProjectDto> projectList();
	
	// @Insert()
	
	// 
}

package com.flow.project.file.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.flow.project.file.model.vo.File;

public interface FileDao {

	int updateFileExtension(SqlSessionTemplate sqlSession, File file);

	int insertFileExtension(SqlSessionTemplate sqlSession, File file);

	int deleteFileExtension(SqlSessionTemplate sqlSession, File file);

	int duplicateCheckFileExtension(SqlSessionTemplate sqlSession, String fileExtensionName);

	List<File> selectCheckedFile(SqlSessionTemplate sqlSession);

}

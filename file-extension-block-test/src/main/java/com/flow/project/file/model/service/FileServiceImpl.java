package com.flow.project.file.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flow.project.file.model.dao.FileDao;
import com.flow.project.file.model.vo.File;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FileDao fd;

	@Override
	public int updateFileExtension(File file) {
		return fd.updateFileExtension(sqlSession, file);
	}

	@Override
	public int insertFileExtension(File file) {
		return fd.insertFileExtension(sqlSession, file);
	}

	@Override
	public int deleteFileExtension(File file) {
		return fd.deleteFileExtension(sqlSession, file);
	}

	@Override
	public int duplicateCheckFileExtension(String fileExtensionName) {
		return fd.duplicateCheckFileExtension(sqlSession, fileExtensionName);
	}

	
}

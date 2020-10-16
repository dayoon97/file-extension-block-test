package com.flow.project.file.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.flow.project.file.model.vo.File;

@Repository
public class FileDaoImpl implements FileDao{

	@Override
	public int updateFileExtension(SqlSessionTemplate sqlSession, File file) {
		int result = sqlSession.update("File.updateFileExtension", file);
		return result;
	}

	@Override
	public int insertFileExtension(SqlSessionTemplate sqlSession, File file) {
		int result = sqlSession.insert("File.insertFileExtension", file);
		return result;
	}

	@Override
	public int deleteFileExtension(SqlSessionTemplate sqlSession, File file) {
		int result = sqlSession.delete("File.deleteFileExtension", file);
		return result;
	}

	@Override
	public int duplicateCheckFileExtension(SqlSessionTemplate sqlSession, String fileExtensionName) {
		int result = sqlSession.selectOne("File.duplicateCheck", fileExtensionName);
		
		return result;
	}

	@Override
	public List<File> selectCheckedFile(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("File.selectCheckedFile");
	}
	
}

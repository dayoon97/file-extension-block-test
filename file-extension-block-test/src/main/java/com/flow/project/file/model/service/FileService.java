package com.flow.project.file.model.service;

import java.util.Map;

import com.flow.project.file.model.vo.File;

public interface FileService {

	int updateFileExtension(File file);

	int insertFileExtension(File file);

	int deleteFileExtension(File file);

	int duplicateCheckFileExtension(String fileExtensionName);

}

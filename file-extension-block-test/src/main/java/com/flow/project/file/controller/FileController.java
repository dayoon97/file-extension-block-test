package com.flow.project.file.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.flow.project.file.model.service.FileService;
import com.flow.project.file.model.vo.File;

@Controller
public class FileController {
	
	@Autowired
	private FileService fs;
	
	@ResponseBody
	@RequestMapping("updateCheckFile.fi")
	public void updateFile(File file) {
		
		int updateFileExtension = 0;
		updateFileExtension = fs.updateFileExtension(file);
		
	}
	
	@ResponseBody
	@RequestMapping("insertFileExt.fi")
	public int insertFile(File file) {
		
		int insertFileExtension = 0;
		insertFileExtension = fs.insertFileExtension(file);
		
		return insertFileExtension;
		
	}
	
	@ResponseBody
	@RequestMapping("deleteFileExt.fi")
	public int deleteFile(File file) {
		
		int deleteFileExtension = 0;
		deleteFileExtension = fs.deleteFileExtension(file);
		
		return deleteFileExtension;
		
	}
	
	@ResponseBody
	@RequestMapping("duplicateCheck.fi")
	public int duplicateCheck(String fileExtensionName) {
		
		int duplicateCheck = 0;
		duplicateCheck = fs.duplicateCheckFileExtension(fileExtensionName);
		
		return duplicateCheck;
	}
	
	@ResponseBody
	@RequestMapping("selectCheckFile.fi")
	public ModelAndView selectCheckFile(ModelAndView mv) {
		
		List<File> CheckedList = new ArrayList<File>();
		CheckedList = fs.selectCheckedFile();
		
		mv.addObject("CheckedList", CheckedList);
		mv.setViewName("jsonView");
		
		return mv;
	}
}

package com.flow.project.file.model.vo;

public class File implements java.io.Serializable{
	private int fileExtensionCode;
	private String fileExtensionName;
	private String fileExtensionYN;
	private String fileExtensionType;
	
	public File() {}

	public File(int fileExtensionCode, String fileExtensionName, String fileExtensionYN, String fileExtensionType) {
		super();
		this.fileExtensionCode = fileExtensionCode;
		this.fileExtensionName = fileExtensionName;
		this.fileExtensionYN = fileExtensionYN;
		this.fileExtensionType = fileExtensionType;
	}

	public int getFileExtensionCode() {
		return fileExtensionCode;
	}

	public void setFileExtensionCode(int fileExtensionCode) {
		this.fileExtensionCode = fileExtensionCode;
	}

	public String getFileExtensionName() {
		return fileExtensionName;
	}

	public void setFileExtensionName(String fileExtensionName) {
		this.fileExtensionName = fileExtensionName;
	}

	public String getFileExtensionYN() {
		return fileExtensionYN;
	}

	public void setFileExtensionYN(String fileExtensionYN) {
		this.fileExtensionYN = fileExtensionYN;
	}

	public String getFileExtensionType() {
		return fileExtensionType;
	}

	public void setFileExtensionType(String fileExtensionType) {
		this.fileExtensionType = fileExtensionType;
	}

	@Override
	public String toString() {
		return "File [fileExtensionCode=" + fileExtensionCode + ", fileExtensionName=" + fileExtensionName
				+ ", fileExtensionYN=" + fileExtensionYN + ", fileExtensionType=" + fileExtensionType + "]";
	}

	
	
}

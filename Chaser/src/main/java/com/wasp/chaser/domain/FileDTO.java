package com.wasp.chaser.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileDTO {
	
	// 로컬 디렉토리를 가져오는 DTO임
	
	private String directory;
	private String fileName;
	private String fileSize;
	
	private List<FileDTO> fileList;

}

package com.wasp.chaser.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileDTO {
	
	
	private String directory;
	private String fileName;
	private String fileSize;
	
	private List<FileDTO> fileList;

}

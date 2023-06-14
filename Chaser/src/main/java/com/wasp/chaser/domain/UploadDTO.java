package com.wasp.chaser.domain;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class UploadDTO {
	
	private int idx;
	private String loc;							// 영상이 찍힌 위치
	private String uploadFolder;				// 영상 폴더 이름
	private ArrayList<String> uploadFolderList;

}

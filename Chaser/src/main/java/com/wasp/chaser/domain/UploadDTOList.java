package com.wasp.chaser.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UploadDTOList {

	private String path;						// 영상 최상단 경로
	
	ArrayList<UploadDTO> uploadList;			// 영상 폴더 리스트 (폴더 이름, 영상이 찍힌 위치, 영상 리스트)
	
	public UploadDTOList() {
		this.uploadList = new ArrayList<UploadDTO>();
	}
	
}

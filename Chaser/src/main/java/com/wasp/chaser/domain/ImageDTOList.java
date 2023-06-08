package com.wasp.chaser.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ImageDTOList {
	
	ArrayList<ImageDTO> imageDTOList;

	public ImageDTOList() {
		this.imageDTOList = new ArrayList<ImageDTO>();
	}
	

}

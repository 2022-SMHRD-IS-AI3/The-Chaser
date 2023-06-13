package com.wasp.chaser.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ImageDTOList {
	
	List<ImageDTO> imageDTOList;

	public ImageDTOList() {
		this.imageDTOList = new ArrayList<ImageDTO>();
	}
	

}

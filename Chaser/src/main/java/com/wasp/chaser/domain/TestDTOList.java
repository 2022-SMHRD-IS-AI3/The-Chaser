package com.wasp.chaser.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class TestDTOList {
	
	ArrayList<TestDTO> testList;
	
	public TestDTOList(){
		this.testList = new ArrayList<TestDTO>();
	}
	

}

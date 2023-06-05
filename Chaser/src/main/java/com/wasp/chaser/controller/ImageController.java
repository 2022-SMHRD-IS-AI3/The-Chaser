package com.wasp.chaser.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wasp.chaser.domain.FileDTO;
import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.service.IImageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/analysis")
@Log4j
public class ImageController {

	@Autowired
	private IImageService service;

	private String uploadPath = "C:\\Users\\smhrd\\Desktop\\cctv";

	private FileDTO getFolder(String path) {
		// 리턴될 파일 목록
		FileDTO fileList = new FileDTO(uploadPath, "cctv", null, null);

		// cctv 폴더의 디렉토리를 가져옴(2023,2022)
		File[] folders = new File(path).listFiles();

		List<FileDTO> fList = new ArrayList<FileDTO>();

		for (File folder : folders) { // cctv1, 2
			FileDTO f1 = new FileDTO(folder.getPath(), folder.getName(), null, null);
			List<FileDTO> f1List = new ArrayList<FileDTO>();

			for (File folder2 : folder.listFiles()) { // 2023, 2022
				FileDTO f2 = new FileDTO(folder2.getPath(), folder2.getName(), null, null);
				List<FileDTO> f2List = new ArrayList<FileDTO>();

				for (File folder3 : folder2.listFiles()) { // 01~12
					FileDTO f3 = new FileDTO(folder3.getPath(), folder3.getName(), null, null);
					List<FileDTO> f3List = new ArrayList<FileDTO>();

					for (File folder4 : folder3.listFiles()) { // 영상 파일
						FileDTO f4 = new FileDTO(folder4.getPath(), folder4.getName(), null, null);
						f3List.add(f4);
					}
					f3.setFileList(f3List);
					f2List.add(f3);
				}
				f2.setFileList(f2List);
				f1List.add(f2);
			}
			f1.setFileList(f1List);
			fList.add(f1);
		}
		fileList.setFileList(fList);

		return fileList;
	}

	@RequestMapping(value = "/image_list", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		FileDTO fileList = getFolder(uploadPath);
		model.addAttribute("fileList", fileList);

	}

	@RequestMapping(value = "/image_delete", method = RequestMethod.POST)
	public void delete(@RequestParam("img_idx") int img_idx) throws Exception {
		log.info("...............id.......");
	}

	@RequestMapping(value = "/image_insert", method = RequestMethod.POST)
	public void insert(ImageDTO img, RedirectAttributes rttr) throws Exception {
		log.info("....................ii..............");
	}

}

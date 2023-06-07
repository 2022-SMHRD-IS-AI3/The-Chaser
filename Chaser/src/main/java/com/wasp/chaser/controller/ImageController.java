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
import com.wasp.chaser.domain.TestDTO;
import com.wasp.chaser.domain.TestDTOList;
import com.wasp.chaser.domain.UploadDTO;
import com.wasp.chaser.domain.UploadDTOList;
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

	// 원본영상 리스트 출력하는 메소드
	@RequestMapping(value = "/image_list", method = RequestMethod.GET)
	public void listup(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception {
		FileDTO fileList = getFolder(uploadPath);
		List<ImageDTO> imageDTOList = service.listAll(episode_idx);
		for(ImageDTO imageDTO : imageDTOList) {
			fileList.getFileList().contains(imageDTO.getOrigin_img_first());
			
		}
		
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("episode_idx", episode_idx);
		
	}
	
	// 압축된 영상 삭제하는 메소드
	@RequestMapping(value = "/image_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("img_idx") int img_idx, @RequestParam("episode_idx") int episode_idx) throws Exception {
		service.delete(img_idx);
		return "redirect:/analysis/analysis_result?episode_idx=" + episode_idx;
	}
	
	// 모델링단과 통신하는 메소드
	@RequestMapping(value = "/image_insert", method = RequestMethod.POST)
	public void insert(UploadDTOList uploadList, RedirectAttributes rttr) throws Exception {
		
		// 영상 선택 페이지에서 가져온 리스트를 ImageDTO에 담아서 insert시킴
		for(UploadDTO uploadDTO : uploadList.getUploadList()) {
			ImageDTO imageDTO = new ImageDTO();
			imageDTO.setImg_nm(uploadDTO.getUploadFolder());
			imageDTO.setImg_xy(uploadDTO.getLoc());
			imageDTO.setOrigin_img_src(uploadDTO.getUploadFolderList().get(0));
			imageDTO.setOrigin_img_first(uploadDTO.getUploadFolderList().get(0));
			imageDTO.setOrigin_img_last(uploadDTO.getUploadFolderList().get(uploadDTO.getUploadFolderList().size()-1));
			imageDTO.setEpisode_idx(uploadList.getEpisode_idx());
			log.info(imageDTO);
			service.insert(imageDTO);
		}
		
		// 로딩 페이지
		// 0. 모델링 단으로 원본 영상에 대한 정보를 줌
		// 1. 영상 처리 중
		// 2. 영상 처리 완료 -> 이때 영상에 대한 데이터를 받아옴 -> DB에 insert
		// 3. 분석 처리 중
		// 4. 분석 처리 완료 -> 이때 분석 결과에 대한 데이터를 받아옴 -> DB에 insert
	}
	
	// 분석된 영상 리스트를 출력하는 메소드
	@RequestMapping(value="/analysis_result", method=RequestMethod.GET)
	public void listAll(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		model.addAttribute("imageList", service.listAll(episode_idx));
		
		
	}

}

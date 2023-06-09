package com.wasp.chaser.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.domain.FileDTO;
import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.domain.ImageDTOList;
import com.wasp.chaser.domain.TestDTO;
import com.wasp.chaser.domain.TestDTOList;
import com.wasp.chaser.domain.UploadDTO;
import com.wasp.chaser.domain.UploadDTOList;
import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.service.IAppeService;
import com.wasp.chaser.service.IEpisodeService;
import com.wasp.chaser.service.IImageService;
import com.wasp.chaser.service.IWantedService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/analysis")
@Log4j
public class ImageController {

	@Autowired	private IImageService service;
	@Autowired private IAppeService Aservice;
	@Autowired private IImageService Iservice;
	@Autowired private IWantedService Wservice;
	@Autowired private IEpisodeService Eservice;

	private String uploadPath = "C:\\Users\\smhrd\\Desktop\\cctv";
	
	final String[] extension_list = {"mp4", "avi", "m4v", "wmv", "mwa", "asf", "mpg", "mpeg", "ts", "mkv", "mov", "webm"};

	private List<FileDTO> getFolder(String path) {
		// 리턴될 파일 목록
		FileDTO fileList = new FileDTO(uploadPath, "cctv", null, null); // 파일 구조 반환 시 사용
		List<FileDTO> onlyFileList = new ArrayList<FileDTO>(); // 파일 구조없이 파일만 반환 시 사용

		// cctv 폴더의 디렉토리를 가져옴(2023,2022)
		File[] folders = new File(path).listFiles();

		List<FileDTO> fList = new ArrayList<FileDTO>();
		for (File folder : folders) { // cctv1, 2
			boolean isVideo1 = (Arrays.asList(extension_list).contains(folder.getName().substring((folder.getName().lastIndexOf(".") + 1), folder.getName().length())));
			if (folder.isFile()) {
				if(isVideo1) {
					FileDTO f1 = new FileDTO(folder.getPath(), folder.getName(), null, null);
					onlyFileList.add(f1);
				}
			} else {
				for (File folder2 : folder.listFiles()) { // 2023, 2022
					boolean isVideo2 = (Arrays.asList(extension_list).contains(folder2.getName().substring((folder2.getName().lastIndexOf(".") + 1), folder2.getName().length())));
					if (folder2.isFile()) {
						if(isVideo2) {
							FileDTO f2 = new FileDTO(folder2.getPath(), folder2.getName(), null, null);
							onlyFileList.add(f2);
						}
					} else {
						for (File folder3 : folder2.listFiles()) { // 01~12
							boolean isVideo3 = (Arrays.asList(extension_list).contains(folder3.getName().substring((folder3.getName().lastIndexOf(".") + 1), folder3.getName().length())));
							if (folder3.isFile()) {
								if(isVideo3) {
									FileDTO f3 = new FileDTO(folder3.getPath(), folder3.getName(), null, null);
									onlyFileList.add(f3);
								}
							} else {
								for (File folder4 : folder3.listFiles()) { // 최하위
									boolean isVideo4 = (Arrays.asList(extension_list).contains(folder4.getName().substring((folder4.getName().lastIndexOf(".") + 1), folder4.getName().length())));
									if (folder4.isFile()) {
										if(isVideo4) {
											FileDTO f4 = new FileDTO(folder4.getPath(), folder4.getName(), null, null);
											onlyFileList.add(f4);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		fileList.setFileList(fList);
		// return fileList; // 파일 구조 반환

		return onlyFileList; // 최하위 파일 반환
	}

	// 원본영상 리스트 출력하는 메소드
	@RequestMapping(value = "/image_list", method = RequestMethod.GET)
	public void listup(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception {
		// 로컬 파일 불러오기
		List<FileDTO> onlyFileList = getFolder(uploadPath);
		// 사용자가 분석하려고 했던 영상 불러오기
		List<ImageDTO> imageDTOList = service.beforeListAll(episode_idx);

		// 화면에 사용자의 기록을 띄우기위한 객체 생성
		List<UploadDTO> old_fileList = new ArrayList<UploadDTO>();

		// 사용자의 기록에서 생성한 객체에 넣기
		for (ImageDTO image : imageDTOList) {
			UploadDTO uDto = new UploadDTO();
			uDto.setIdx(image.getImg_idx());
			uDto.setLoc(image.getImg_xy());
			uDto.setUploadFolder(image.getImg_nm());

			String[] imgs = image.getOrigin_imgs().split(",");
			ArrayList<String> uploadList = new ArrayList<String>();
			if(onlyFileList.size()==0) {
				
			for (String img : imgs) {
				String src = image.getOrigin_img_src() + img;
				uploadList.add(img);

				for (int i = 0; i < onlyFileList.size(); i++) {
					if (onlyFileList.get(i).getDirectory().equals(src)) {
						onlyFileList.remove(i);
					}

				}
			}

			}
			uDto.setUploadFolderList(uploadList);
			old_fileList.add(uDto);
		}

		log.info(old_fileList);

		model.addAttribute("old_fileList", old_fileList);
		model.addAttribute("fileList", onlyFileList);
		model.addAttribute("episode_idx", episode_idx);
		model.addAttribute("episode_loc", Eservice.getEpisodeLoc(episode_idx));
	}

	// 영상 삭제하는 메소드
	@RequestMapping(value = "/image_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("img_idx") int img_idx, HttpServletRequest request) throws Exception {
		String referer = request.getHeader("Referer");
		service.delete(img_idx);
		return "redirect:"+referer;
	}

	// 모델링단과 통신하는 메소드
	@RequestMapping(value = "/image_insert", method = RequestMethod.POST)
	public String insert(UploadDTOList uploadList, RedirectAttributes rttr) throws Exception {
		log.info("image_insert.................................");
		log.info(uploadList);
		// 영상 선택 페이지에서 가져온 리스트를 ImageDTO에 담아서 insert시킴
		
		File ePath = new File("C:\\cctv\\", uploadList.getEpisode_idx() + "");
		
		if(ePath.exists() == false) {
			ePath.mkdirs();
		}
		
		File ePath2 = new File(ePath.toPath() + "");
		
		
		for(UploadDTO uploadDTO1 : uploadList.getUploadList()) {
			File newPath = new File(ePath2, uploadDTO1.getUploadFolder());
			if(newPath.exists() == false) {
				newPath.mkdir();
			}
			for(String file : uploadDTO1.getUploadFolderList()) {
				
				File newPath2 = new File(newPath, file.substring(file.lastIndexOf("\\")+1));
				File origin = new File(file);
				Files.copy(origin.toPath(), newPath2.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}
		}
		
		
		if (uploadList.getUploadList().size() > 0) {
			for (UploadDTO uploadDTO : uploadList.getUploadList()) {
				if (uploadDTO.getUploadFolderList() != null) {
					// 분석할 영상을 담을 객체 생성
					ImageDTO imageDTO = new ImageDTO();

					// 폴더 이름, 좌표를 담음
					imageDTO.setImg_nm(uploadDTO.getUploadFolder());
					imageDTO.setImg_xy(uploadDTO.getLoc());

					// 원본 파일 주소를 담음
					int idx = uploadDTO.getUploadFolderList().get(0).lastIndexOf("\\") + 1;
					imageDTO.setOrigin_img_src("C:\\cctv\\" + uploadList.getEpisode_idx() + "\\" + uploadDTO.getUploadFolder());

					// 원본 파일 이름들을 담음
					String nms = new String();
					for (String nm : uploadDTO.getUploadFolderList()) {
						nms += nm.substring(idx) + ",";
					}
					nms = nms.substring(0, nms.lastIndexOf(","));
					imageDTO.setOrigin_imgs(nms);

					// 사건 번호를 담음
					imageDTO.setEpisode_idx(uploadList.getEpisode_idx());

					log.info(imageDTO);

					service.insert(imageDTO);
				}
			}
		}
		rttr.addFlashAttribute("episode_idx", uploadList.getEpisode_idx());
		
		return "redirect:/analysis/analyzing";

		// 로딩 페이지
		// 0. 모델링 단으로 원본 영상에 대한 정보를 줌
		// 1. 영상 처리 중
		// 2. 영상 처리 완료 -> 이때 영상에 대한 데이터를 받아옴 -> DB에 update
		// 3. 분석 처리 중
		// 4. 분석 처리 완료 -> 이때 분석 결과에 대한 데이터를 받아옴 -> DB에 update

	}
	
	@RequestMapping("analyzing")
	public String analyzing(String episode_idx) {
				
		return "/analysis/analyzing";
	}

	@RequestMapping(value = "/image_update", method = RequestMethod.GET)
	public void image_update(ImageDTOList imageDTOList, RedirectAttributes rttr) throws Exception {
		for (ImageDTO imageDTO : imageDTOList.getImageDTOList()) {
			service.update(imageDTO);
		}
	}

	// 분석된 영상 리스트를 출력하는 메소드
	@RequestMapping(value = "/analysis_result", method = RequestMethod.GET)
	public String listAll(ImageDTO iDTO, Model model) throws Exception {
		
		// 사건에 대한 영상 리스트를 불러와서 담음
		List<ImageDTO> imageList = service.afterListAll(iDTO.getEpisode_idx());
		
		if(imageList.size() == 0) {
			return "redirect:/analysis/image_list?episode_idx="+iDTO.getEpisode_idx();
		}
		
		// get 방식으로 받은 데이터에 조회할 img_idx가 없으면 전체 영상 리스트의 첫번째 img_idx를 담음
		if(iDTO.getImg_idx() == null){
			iDTO.setImg_idx(imageList.get(0).getImg_idx());
		}
		
		// 영상 하나에 대한 객체를 받아옴
		ImageDTO result = service.getImageOne(iDTO);
		
		
		// 받아온 영상에 나오는 후보 리스트를 담음
		WantedDTO wanted = new WantedDTO();
		wanted.setEpisode_idx(result.getEpisode_idx());
		wanted.setImg_idx(result.getImg_idx());
		
		result.setWantedDTOList(Wservice.listAll(wanted));

		
		model.addAttribute("imageList", imageList);
		model.addAttribute("result", result);
		model.addAttribute("episode_idx", iDTO.getEpisode_idx());
		
		return "/analysis/analysis_result";
	}
	
	@RequestMapping(value="/visualize_result", method = RequestMethod.GET)
	public void list(@RequestParam("episode_idx") int episode_idx,WantedDTO wanted, Model model,EpisodeDTO eDto) throws Exception{
		// 이미지 리스트 테이블 가져오기
		model.addAttribute("list",service.resultListAll(episode_idx));	
		
		// 에피소드 테이블 가져오기
		model.addAttribute("episode", Eservice.read(episode_idx));
		log.info("사건불러오기");
		log.info("get...................");
		
		// 인상착의 테이블 가져오기
		AppeDTO appeDto = Aservice.read(episode_idx);
		if(appeDto != null) {
			model.addAttribute("appe", appeDto);	
		}
		model.addAttribute("episode_idx", episode_idx);
		
		log.info("인상착의불러오기");
		log.info("get...................");
		
		// 후보리스트 테이블 가져오기
		log.info("후보 리스트 불러오기");
		log.info(Wservice.listAll(wanted).toString());
		
	}

}

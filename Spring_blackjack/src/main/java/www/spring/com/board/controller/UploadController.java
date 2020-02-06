package www.spring.com.board.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		
		log.info("upload Form");
	}
	
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		//스프링에서 제공하는 MultipartFile이라는 타입을 이용해서 손쉽게 파일 데이터를 처리한다.
		
		String uploadFolder = "C:\\upload"; //파일 저장 경로
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("upload File Size: " + multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			
			try {
				multipartFile.transferTo(saveFile); //transferTo로 파일저장 처리
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
		}//end for
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		//스프링에서 제공하는 MultipartFile이라는 타입을 이용해서 손쉽게 파일 데이터를 처리한다.
		
		log.info("update ajax post...............");
		
		String uploadFolder = "C:\\upload"; //파일 저장 경로
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("upload File Size: " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			//IE의 경우 전체파일 경로가 전송되므로 마지막 '\'를 기준으로 잘라낸 문자열이 실제파일 이름이 된다.
			log.info("only file name: " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			 
			try {
				multipartFile.transferTo(saveFile); //transferTo로 파일저장 처리
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
		}//end for
	}
}

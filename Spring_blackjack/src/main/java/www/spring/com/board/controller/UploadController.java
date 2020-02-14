package www.spring.com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import www.spring.com.board.model.AttachFileDTO;

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
	
	private String getFolder() { //년 월 일 단위의 폴더를 생성
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		// └특정한 파일이 이미지 타입인지를 검사하는 메서드
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
	}
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		//스프링에서 제공하는 MultipartFile이라는 타입을 이용해서 손쉽게 파일 데이터를 처리한다.
		
		List<AttachFileDTO> list = new ArrayList<>(); //AttachFileDTO타입의 list를 생성
		String uploadFolder = "C:\\upload"; //파일 저장 경로

		String uploadFolderPath = getFolder();
		//make folder 폴더 만들기---------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs(); //java.io.File에 존재하는 mkdirs()를 이용하면 필요한 상위폴더까지 한번에 생성
		} // yyyy/MM/dd 폴더 만든다.
		
		
		for (MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO(); //AttachFileDTO를 생성해서 전달하는 구조로 변경
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// ┌IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			// └IE의 경우 전체파일 경로가 전송되므로 마지막 '\'를 기준으로 잘라낸 문자열이 실제파일 이름이 된다.
			
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID(); //임의의 값을 생성한다.
			
			uploadFileName = uuid.toString() + "_" + uploadFileName; 
			// └생성된 값은 원래 파일 이름과 구분짓기 위해 "_"를 추가한다.
						
			 
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); //transferTo로 파일저장 처리
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				
				// ┌체크파일 이미지 타입
				if (checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					// └Thumbnailator는 InputStream과 java.io.File 객체를 이용해서 파일을 생성하며 뒤에 사이즈를 지정할 수 있다.
					
					thumbnail.close();
				}
				
				//add to List
				list.add(attachDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
		}//end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	// 특정한 파일 이름을 받아서 이미지 데이터를 전송하는 코드를 우선 생성
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		// └getFile()은 문자열로 파일의 경로가 포함된 fileName을 파라미터로 받고 byte[]를 전송한다.
		
		
		
		log.info("fileName: " + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			// byte로 이미지 전송할때 주의점은  브라우저에 보내주는 MIME타입이 파일의 종류에 따라 달라지는 점
			// 이 부분을 해결하기 위해서 probeContentType()을 이용하여 MIME타입 데이터를 Http의 헤더 메시지에 포함할 수 있도록 처리
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {//파일 다운로드
		//org.springframework.core.io.Resource를 임포트 한다.
		
		log.info("download file: " + fileName);
		
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		log.info("resource: " + resource);
		
		return null;

	}
	
	
}

package www.spring.com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestHeader;
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
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		//파일 다운로드
		//org.springframework.core.io.Resource를 임포트 한다.
		/*@RequestHeader를 이용해서 필요한 HTTP 헤더 메시지의 내용을 수집할 수 있다.
		 이를 이용해서 User-Agent의 정보를 파악하고 값이  MSIE 혹은 TRident(IE브라우저의 엔진이름-IE11처리)인 
		 경우에는 다른 방식으로 처리하도록 한다.
		 */
		
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		
		//remove uuid 파일 다운받을때 uuid 를 지워준다.
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			String downloadName = null;
			
			if (userAgent.contains("Trident")) {
				log.info("IE browser");
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
						
			} else if(userAgent.contains("Edge")){

				log.info("Edge browser");
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
				
				log.info("Edge name " + downloadName);
				
			} else {
				
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			log.info("downloadName: " + downloadName);
			
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
			//다운로드시 저장되는 이름은 'Content-Disposition'을 이용해서 지정한다.

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);

	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		//전송하는 파일 이름과 종류를 파라미터로 받아서 파일의 종류에 따라 다르게 동작한다.
		
		log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if (type.equals("image")) {
				// 이미지의 경우 섬네일이 존재하기에 파일이름 중간에 s_가 들어있다. 일반 이미지 파일의 경우s_가 없으므로 
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				// 이 부분을 변경해서 원본이미지 파일도 같이 삭제하도록 처리 한다.
				log.info("largeFileName : " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
}

package www.spring.com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import www.spring.com.board.model.BoardVO;
import www.spring.com.board.service.BoardService;
/**
 * BoardController 는 BoardService에 의존적이므로
 * @AllArgsConstructor를 이용 해서 생성자를 만들고 자동으로 주입하도록 한다.
 *
 */
@Controller
@RequestMapping("/board") // /board로 시작하는 모든 처리를 BoardController가 한다.
@AllArgsConstructor
public class BoardController {
	
		
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) { //model을 파라미터로 지정하고 view로 넘겨준다.
		System.out.println("list");
		
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		// RedirectAttributes등록 작업이 끈난 후 다시 목록 화면으로 이동
		// 추가적으로 새롭게 등록된 게시물의 번호를 같이 전달하기 위해서 RedirectAttributes를 사용
		System.out.println("register: " + board);
		
		service.register(board);;
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list"; //String을 리턴 타입으로 지정
		//redirect:이 접두어는 스프링MVC가 내부적으로 response.sendRedirect()를 처리해주기때문에 편리
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		System.out.println("/get");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")//수정
	public String modify(BoardVO board, RedirectAttributes rttr) {
		System.out.println("modify: " + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		
		System.out.println("remove...." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list";
	}
	
}

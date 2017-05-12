package org.team.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.domain.BoardVO;
import org.team.domain.Criteria;
import org.team.domain.PageMaker;
import org.team.service.BoardService;

@Controller
public class BoardController {
	@Inject
	BoardService service;

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */

	/*
	 * // pageMaker 적용 전 list 코드
	 * 
	 * @GetMapping("/list") public void list(Criteria cri, Model model)throws
	 * Exception{
	 * 
	 * List<BoardVO> list = new ArrayList<>();
	 * 
	 * list = service.list(cri);
	 * 
	 * model.addAttribute("list", list); model.addAttribute("cri", cri);
	 * 
	 * }
	 */

	// pageMaker 적용
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		List<BoardVO> list = new ArrayList<>();

		int totalSize = service.getCount(cri);

		PageMaker pager = new PageMaker(cri, totalSize);

		list = service.list(cri);

		model.addAttribute("list", service.list(cri));
		model.addAttribute("pager", pager);

	}

	@GetMapping("/write")
	public void write(Criteria cri, Model model) throws Exception {
		model.addAttribute(cri);
	}

	@PostMapping("/write")
	public String write(BoardVO vo, Model model, RedirectAttributes rttr) throws Exception {

		service.register(vo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/list";

	}

	@GetMapping("/view")
	public void read(@RequestParam("bno") Integer bno, Model model, @ModelAttribute("cri")Criteria cri) throws Exception {

		BoardVO vo = new BoardVO();

		int totalSize = service.getCount(cri);

		PageMaker pager = new PageMaker(cri, totalSize);

		vo = service.findByBno(bno);		

		model.addAttribute("view", vo);
		model.addAttribute("pager", pager);
	}

	@PostMapping("/delete")
	public String delete(@RequestParam("bno") Integer bno, @ModelAttribute("Cri") Criteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno);
		

		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/list";
	}

	@GetMapping("/update")
	public void update(@RequestParam("bno") Integer bno, BoardVO vo, Criteria cri, Model model) throws Exception {



		model.addAttribute("vo", service.findByBno(bno));
		
		model.addAttribute(cri);

	}

	@PostMapping("/update")
	public String updatePost(BoardVO vo, Model model, RedirectAttributes rttr,@ModelAttribute("Cri") Criteria cri) throws Exception {
		


		service.modify(vo);

		
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/list";

	}

}

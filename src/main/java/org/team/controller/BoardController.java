package org.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.domain.BoardVO;
import org.team.domain.Criteria;
import org.team.service.BoardService;


@Controller
public class BoardController {
	@Inject
	BoardService service;
	
	
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	*/
	@GetMapping("/list")
	public void list(Criteria cri, Model model)throws Exception{
		
		List<BoardVO> list = new ArrayList<>();
		
		list = service.list(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
				
	}
	
	@GetMapping("/view")
	public void read(@RequestParam("bno") Integer bno, Model model)throws Exception{
		
		BoardVO vo = new BoardVO();
		
		
		
		vo = service.findByBno(bno);
		
		model.addAttribute("view", vo);
	}
}

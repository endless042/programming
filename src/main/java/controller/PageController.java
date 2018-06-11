package controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.DrinksService;
import vo.DrinksVO;
import vo.MilkVO;
import vo.SeasonVO;


@Controller
@RequestMapping("/page")
public class PageController {
	
	@Autowired
	DrinksService dpro;
	
	String pageNum = "1";
	String keyword="";
	String option="name";
	
	static final Logger log = LoggerFactory.getLogger(PageController.class);

	@ModelAttribute
	public void addAttributes(String keyword, String option, String pageNum) {
		if (keyword != null)
			this.keyword = keyword;
		if (option != null)
			this.option = option;
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
	}
	
	@RequestMapping("/main")
	public String main(Model model,  @RequestParam(value="keyword", required=false, defaultValue="" ) String keyword,
			@RequestParam(value="option", required=false, defaultValue="name" ) String option) throws Exception{
		
		System.out.println(keyword+"==="+option);
		
		int pageSize = 6;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<DrinksVO> drinklist = null;
		count = dpro.getDrinkCount(option,keyword);
		
		
		if (count > 0) {
			
			drinklist = dpro.getDrinklist(startRow, endRow,option,keyword);
			
			
		}
		//System.out.println(drinklist);
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("endPage", endPage);
		model.addAttribute("bottomLine", bottomLine);
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("drinklist", drinklist);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("keyword",keyword);
		model.addAttribute("option",option);
		
		
		log.info("성공적으로 메인 진입");
		return "page/main";
	}
	

	@RequestMapping("/content")
	public String content(Model model, String dnum) throws Exception{
		
		DrinksVO drink=dpro.getDrink(dnum);
		MilkVO milk=dpro.getMilk(dnum);
		SeasonVO season=dpro.getSeason(dnum);
		
		System.out.println(milk);
		System.out.println(season);
		
		model.addAttribute("drink",drink);
		model.addAttribute("milk",milk);
		model.addAttribute("season",season);
		
		return "page/content";
	}
	

	
}

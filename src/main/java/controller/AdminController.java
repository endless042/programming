package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.DrinksService;
import service.UserService;
import vo.DrinksVO;
import vo.MilkVO;
import vo.SeasonVO;
import vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	UserService upro;
	@Autowired
	DrinksService dpro;

	String pageNum = "1";
	String keyword = "";
	String option = "userid";

	static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@ModelAttribute
	public void addAttributes(String keyword, String option, String pageNum) {
		if (keyword != null)
			this.keyword = keyword;
		if (option != null)
			this.option = option;
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
	}

	@RequestMapping("/userlist")
	public String userlist(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "option", required = false, defaultValue = "userid") String option) throws Exception {

		int pageSize = 5;

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<UserVO> userlist = null;
		count = upro.getUserCount(option, keyword);
		if (count > 0) {

			userlist = upro.getUserlist(startRow, endRow, option, keyword);

			for (UserVO tmp : userlist) {

			}
		}

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
		model.addAttribute("userlist", userlist);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("keyword", keyword);
		model.addAttribute("option", option);

		return "page/admin/userlist";
	}

	@RequestMapping("/menulist")
	public String menulist(Model model,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "option", required = false, defaultValue = "name") String option) throws Exception {

		int pageSize = 5;

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<DrinksVO> menulist = null;
		count = dpro.getDrinkCount(option, keyword);
		if (count > 0) {

			menulist = dpro.getDrinklist(startRow, endRow, option, keyword);

		}

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
		model.addAttribute("menulist", menulist);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("keyword", keyword);
		model.addAttribute("option", option);

		return "page/admin/menulist";
	}

	@RequestMapping(value = "/addDrink", method = RequestMethod.GET)
	public String addDrink(@ModelAttribute DrinksVO drink) throws Exception {

		return "page/admin/addDrink";
	}

	@RequestMapping(value = "/addDrink", method = RequestMethod.POST)
	public String addDrink(@ModelAttribute DrinksVO drink, @ModelAttribute MilkVO milk, @ModelAttribute SeasonVO season,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		if ((request.getParameter("smallck")) != null && (request.getParameter("smallck") != "")) {
			drink.setSmall(Integer.parseInt(request.getParameter("smallck")));
		}
		if ((request.getParameter("regularck")) != null && (request.getParameter("regularck") != "")) {
			drink.setRegular(Integer.parseInt(request.getParameter("regularck")));
		}
		if ((request.getParameter("largeck")) != null && (request.getParameter("largeck") != "")) {
			drink.setLarge(Integer.parseInt(request.getParameter("largeck")));
		}

		String filename = file.getOriginalFilename();
		System.out.println("filename:[" + filename + "]");
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);
			try {
				FileCopyUtils.copy(file.getInputStream(),
						new FileOutputStream(uploadPath + "/" + file.getOriginalFilename()));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			drink.setFilename(filename);
			drink.setFilesize((int) file.getSize());
		} else {
			drink.setFilename("");
			drink.setFilesize(0);
		}

		int result = 0;
		if (dpro.addDrink(drink) > 0) {
			int dnum = dpro.getDnum();
			milk.setDnum(dnum);
			season.setDnum(dnum);

			if (drink.getMilk() == 1) {

				if (dpro.addMilkInfo(milk) > 0) {

					result = 1;
				}
				dpro.addSeasonInfo(season);
			}

		}

		log.info("상품 등록 완료");

		if (result == 1) {
			return "page/admin/addcomp";
		} else
			return "page/admin/addDrink";

	}

	@RequestMapping(value = "/modifyDrink", method = RequestMethod.GET)
	public String modifyDrink(@ModelAttribute DrinksVO drink, String dnum, Model model) throws Exception {

		DrinksVO tmp = dpro.getDrink(dnum);
		model.addAttribute("drink", drink);

		return "page/admin/modifyDrink";
	}
	
	
	@RequestMapping("/deleteDrink")
	public String deleteDrink(String dnum) throws Exception{
		
		dpro.deleteDrink(dnum);
		return "redirect:/admin/menulist";
	}

}

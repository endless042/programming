package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.DrinksService;
import service.UserService;
import vo.DrinksVO;
import vo.OrderVO;
import vo.UserVO;


@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService upro;
	@Autowired
	DrinksService dpro;
	static final Logger log = LoggerFactory.getLogger(UserController.class);


	String pageNum = "1";
	
	
	
	@ModelAttribute
	public void addAttributes(String pageNum) {
	
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
	}
	
	@RequestMapping("/login")
	public String login(Model model) throws Exception{
		
		return "page/user/login";
	}
	
	@RequestMapping(value="/loginprocess",method=RequestMethod.POST)
	public String loginprocess(HttpSession session, UserVO user, HttpServletRequest request) {
		//System.out.println(user);
		 String returnURL = "";
	      /*  if ( session.getAttribute("userid") != null ){
	            // 기존에 세션 값이 존재한다면
	            session.removeAttribute("userid"); // 기존값을 제거해 준다.
	            session.removeAttribute("level");
	        }*/
	         
	       
	        UserVO vo = upro.getUser(user.getUserid());
	 
	        if ( vo != null ){ // 로그인 성공
	            
	            if( upro.getOrderCount(user.getUserid())>=2) {
	            	vo.setGrade(2);
	            }else if ( upro.getOrderCount(user.getUserid())>=5) {
	            	vo.setGrade(3);
	            }else if ( upro.getOrderCount(user.getUserid())>=10) {
	            	vo.setGrade(4);
	            }
	           
	            session.setAttribute("userid", vo.getUserid()); 
	            session.setAttribute("user", vo); 
	            if(vo.getUserid().equals("admin")) {
	            	  log.info("관리자로 로그인 성공");
	            	session.setAttribute("level", 0);
	            }else {
	            	 log.info(vo.getUserid()+"로 로그인 성공");
	            	session.setAttribute("level", 1);
	            }
	          
	    			
	    			// 이전 요청을 가져오기-인터셉터에서 세션에 저장해뒀음
	    			Object dest = session.getAttribute("dest");
	    			// 이전 요청이 없으면 시작 페이지로 이동
	    			if (dest == null) {
	    				return "redirect:/page/main";
	    			}
	    			// 이전 요청이 있으면 그 페이지로 이동
	    			else {
	    				
	    				return "redirect:/" + dest.toString();

	    			
	    		}
	  
	            
	        }else { // 로그인에 실패한 경우
	            returnURL = "page/user/login"; // 로그인 폼으로 다시 가도록 함
	        }
	         
	       
		return returnURL;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) throws Exception{
		
		request.getSession().invalidate();
		
		return "redirect:/page/main";
	}
	
	@RequestMapping("/loginpage")
	public String loginpage(HttpServletRequest request, Model model) throws Exception{
		
	
		
		return "redirect:/page/main";
	}
	

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(@ModelAttribute UserVO vo) {
	  return "page/user/join";
	}

	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid UserVO user, BindingResult result) {
		  // 에러가 있는지 검사
		  if( result.hasErrors() ) {
		
		    // 에러를 List로 저장
		    List<ObjectError> list = result.getAllErrors();
		    for( ObjectError error : list ) {
		      System.out.println(error);
		    }
		    //에러 있는 경우 다시 회원가입 페이지로
		    return "page/user/join";
		  }
		   
		  //에러가 없는 경우
		 upro.addUser(user);
		  return "page/user/joincomp";
		}


	
	@RequestMapping("/leave")
	public String leave(Model model, HttpServletRequest request) throws Exception{
		
		String userid=request.getSession().getAttribute("userid")+"";
		
		
			upro.deleteUser(userid);
			request.getSession().invalidate();
			
			return "page/user/leavecomp";
		
		
	
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET, produces="application/json")
	public Map< String, Object> idcheck(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		boolean result=upro.idCheck(userid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", result);
		return map;

	
	}
	
	@ResponseBody
	@RequestMapping("/logincheck")
	public Map< String, Object> logincheck(HttpServletRequest request) {
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		
		
		
		UserVO user=new UserVO();
		user.setUserid(userid);
		user.setPasswd(passwd);
		boolean result=upro.isUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", result);
		return map;

	
	}
	
	

	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String info(@ModelAttribute UserVO user, String userid, Model model) throws Exception{
		
		UserVO tmp=upro.getUser(userid);
		model.addAttribute("user",tmp);
		
		
		return "page/user/info";
	}
	
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public String info(@ModelAttribute @Valid UserVO user, BindingResult result) {
		  // 에러가 있는지 검사
		  if( result.hasErrors() ) {
		 
		    // 에러를 List로 저장
		    List<ObjectError> list = result.getAllErrors();
		    for( ObjectError error : list ) {
		      System.out.println(error);
		    }
		    //에러 있는 경우 다시 등록 페이지로
		 
		    return "page/user/info";
		  }
		   
		  //에러가 없는 경우
		  upro.modifyUser(user);
		  return "page/user/infocomp";
		 
		}

	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String order(@ModelAttribute OrderVO order,String userid, HttpServletRequest request) {
		
	DrinksVO drink=dpro.getDrink(order.getDnum()+"");
	
	UserVO user=upro.getUser(userid);
	
	System.out.println("userid:"+userid);
		if(order.getDrinksize().equals("small")) {
			order.setPrice(drink.getSmall());
		}
		if(order.getDrinksize().equals("regular")) {
			order.setPrice(drink.getRegular());
		}
		if(order.getDrinksize().equals("large")) {
			order.setPrice(drink.getLarge());
		}
		
		
	int totalprice=order.getCount() * order.getPrice();
		
	if(order.getTemp().equals("ice")) {
		totalprice=totalprice+500;
	}
	
/*if(user.getGrade()==2) {
		totalprice=totalprice-500;
	}
if(user.getGrade()==3) {
	totalprice=totalprice-1000;
}
if(user.getGrade()==4) {
	totalprice=totalprice-1500;
}*/
	
	order.setPrice(totalprice);
	System.out.println(order);
		
	
		order.setUserid(userid);
		order.setState(1);
		dpro.getDrink(order.getDnum()+"");
		
		upro.addOrder(order);
		
		log.info(userid+"의 주문이 완료되었습니다.");
		
		  return "page/user/ordercomp";
		 
		}
	@RequestMapping("/orderlist")
	public String lendlist(Model model, HttpServletRequest request) throws Exception{
		String userid=request.getSession().getAttribute("userid")+"";
		
		int count=0;
		count=upro.getOrderCount(userid);
		List<OrderVO> orderlist=null;
		
		if(count>0) {
		orderlist=upro.getOrderlist(userid);
		
		for(OrderVO tmp:orderlist) {
			tmp.setDrink(dpro.getDrink(tmp.getDnum()+""));
		}
		}
		
		model.addAttribute("count",count);
		model.addAttribute("orderlist",orderlist);
		
		return "page/user/orderlist";
	}
	
	
	@RequestMapping("/cancelOrder")
	public String returnbook(Model model, String num, HttpServletRequest request) throws Exception{
		String userid=request.getSession().getAttribute("userid")+"";
		
		String onum=request.getParameter("onum");
		upro.cancelOrder(onum);
		
		
		return "redirect:/user/orderlist";
	}
	
}

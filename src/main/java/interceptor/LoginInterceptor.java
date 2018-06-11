package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import controller.UserController;
import dao.UserDAO;
import vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	
	
@Autowired
UserDAO upro;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		 
		   
		   HttpSession session = request.getSession();
	       
	        Object user = session.getAttribute("userid");
	         
	        if ( user == null ){
	        	
	        	
	        	// 클라이언트의 전체 요청주소
				String requestURI = request.getRequestURI();
				// 서버의 주소
				String contextpath = request.getContextPath();
				// 주소 만들기
				String uri = requestURI.substring(contextpath.length() + 1);

				// 주소 뒤에 파라미터를 가져오기
				String query = request.getQueryString();
				// 실제 주소 만들기
				// 브라우저의 경우 "null"자체가 올수도 있어서
				if (query == null || query.equals("null")) {
					query = "";
				} else {
					query = "?" + query;
				}
				// 세션에 주소 저장하기
				session.setAttribute("dest", uri + query);
			


	            //  로그인 폼으로 다시 
	            response.sendRedirect(request.getContextPath()+"/user/login");
	            return false; 
	        }
	         
	      //return true인경우 콘트롤러로 진행
	        return true;

		    
		    

	}




}

package com.it.ez.controller;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor{
	private static final Logger logger
	=LoggerFactory.getLogger(LoginInterceptor.class);

	
	@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			 String empName
			=(String) request.getSession().getAttribute("empName");
			if(empName==null) {
				logger.info("먼저 로그인하세요");
				request.setAttribute("msg", "먼저 로그인하세요");
				request.setAttribute("url", "/mainLogin");
				
				RequestDispatcher  dispatcher
				=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
				dispatcher.forward(request, response);
				return false;
			}
			return true;
		}
		
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
		}
		
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, @Nullable Exception arg3) throws Exception {
		}
	}



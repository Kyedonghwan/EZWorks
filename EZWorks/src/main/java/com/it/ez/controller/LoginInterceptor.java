package com.it.ez.controller;
import java.io.PrintWriter;

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
      public boolean preHandle(HttpServletRequest request, 
            HttpServletResponse response, Object handler)
            throws Exception {   
         String empName =(String) request.getSession().getAttribute("empName");      
         logger.info("preHandle 호출!, 세션 empName={}",empName);
         
         //컨트롤러 수행이전에 먼저 수행되는 메서드
         //- 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출됨
         
         //로그인 안된 경우 처리
         if(empName==null) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>alert('먼저 로그인하세요!!!');");
            out.print("location.href='"+ request.getContextPath() 
               + "/mainLogin';");
            out.print("</script>");
            
            return false; //컨트롤러를 수행하지 않음
         }else {  //로그인 된 경우
            return true;
         }
      }
      
      @Override
      public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
      }
      
      @Override
      public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, @Nullable Exception arg3) throws Exception {
      }
   }

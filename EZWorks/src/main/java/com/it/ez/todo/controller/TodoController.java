package com.it.ez.todo.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.it.ez.calendar.controller.CalController;
import com.it.ez.todo.model.EmployeeVO;
import com.it.ez.todo.model.TodoVO;
import com.it.ez.todo.service.InterTodoService;

@Controller
public class TodoController {
   
   @Autowired
   private InterTodoService service;
   
   private static final Logger logger = LoggerFactory.getLogger(CalController.class);
   
   
   @RequestMapping("/todo/testtodo")
   public void Todo() {
      logger.info("화면보여줘");
   }
   

   
   
   @RequestMapping(value = "/goTodo")
   public ModelAndView requiredLogin_goTodo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
      

         
         String fk_emp_no = "1";
         List<TodoVO> todoList = service.selectTodoList(fk_emp_no);
         
         mav.addObject("todoList", todoList);

      mav.setViewName("todo/testtodo");
      
      return mav;
   }
   
   // 즐겨찾기 불러오기
   @ResponseBody
   @RequestMapping(value="/readBookmark", produces="text/plain;charset=UTF-8")
   public String readBookmark(HttpServletRequest request)  {
      
      
      String fk_emp_no = "1";
      
      List<TodoVO> bookmarkList = service.readBookmark(fk_emp_no);
      
      JSONArray jsonArr = new JSONArray();
      
      if (bookmarkList != null) {
         for (TodoVO todo : bookmarkList) {
            JSONObject jsonObj = new JSONObject();
            
            jsonObj.put("todo_no", todo.getTodo_no());
            jsonObj.put("fk_emp_no", todo.getFk_emp_no());
            jsonObj.put("subject", todo.getSubject());
            jsonObj.put("content", todo.getContent());
            jsonObj.put("bookmark", todo.getBookmark());
            
            jsonArr.put(jsonObj);
         }
      }
      
      return jsonArr.toString();
   }
   
   // 즐겨찾기 스위치
   @ResponseBody
   @RequestMapping(value="/switchBookmark", produces="text/plain;charset=UTF-8")
   public String switchBookmark(HttpServletRequest request)  {
      
      String todo_no = request.getParameter("todo_no");
      
      // 할일 한개 가져오기
      TodoVO todovo = service.selectOneTodo(todo_no);
      
      Map<String, String> paraMap = new HashedMap<String, String>();
      paraMap.put("todo_no", todo_no);
      paraMap.put("bookmark", todovo.getBookmark());
      
      int n = service.switchBookmark(paraMap);
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("n", n);
      
      return jsonObj.toString();
   }
   
   // 할일 추가
   @ResponseBody
   @RequestMapping(value="/addEndTodo", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
   public String addEndTodo(HttpServletRequest request) {
      
      
      String fk_emp_no = "1";
      String subject = request.getParameter("subject");
      String content = request.getParameter("content");
      
      Map<String, String> paraMap = new HashedMap<String, String>();
      paraMap.put("fk_emp_no", fk_emp_no);
      paraMap.put("subject", subject);
      paraMap.put("content", content);
      
      int n = service.addEndTodo(paraMap);
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("n", n);
      
      return jsonObj.toString();
   }
   
   // 할일 수정
   @ResponseBody
   @RequestMapping(value="/editTodo", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
   public String editTodo(HttpServletRequest request) {
      
      String todo_no = request.getParameter("todo_no");
      String subject = request.getParameter("subject");
      String content = request.getParameter("content");
      
      Map<String, String> paraMap = new HashedMap<String, String>();
      paraMap.put("todo_no", todo_no);
      paraMap.put("subject", subject);
      paraMap.put("content", content);
      
      int n = service.editTodo(paraMap);
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("n", n);
      
      return jsonObj.toString();
   }
   
   // 할일 삭제
   @ResponseBody
   @RequestMapping(value="/deleteTodo", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
   public String deleteTodo(HttpServletRequest request) {
      
      String todo_no = request.getParameter("todo_no");
      
      int n = service.deleteTodo(todo_no);
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("n", n);
      
      return jsonObj.toString();
   }
   
   // 할일 1개 불러오기
   @ResponseBody
   @RequestMapping(value="/readOneTodo", produces="text/plain;charset=UTF-8")
   public String readOneTodo(HttpServletRequest request) throws JSONException {
      
      String todo_no = request.getParameter("todo_no");
      
      TodoVO todovo = service.selectOneTodo(todo_no);
      
      JSONObject jsonObj = new JSONObject();
      jsonObj.put("todo_no", todovo.getTodo_no());
      jsonObj.put("fk_emp_no", todovo.getFk_emp_no());
      jsonObj.put("subject", todovo.getSubject());
      jsonObj.put("content", todovo.getContent());
      jsonObj.put("bookmark", todovo.getBookmark());

      return jsonObj.toString();
   }
   
   
   
   
   
}
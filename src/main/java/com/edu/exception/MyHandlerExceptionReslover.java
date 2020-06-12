package com.edu.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class MyHandlerExceptionReslover implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		MyException exception=null;
		if(ex instanceof MyException) {
			exception=(MyException)ex;
		}else {
			exception=new MyException("发生未知错误");
		}
		ModelAndView model =new ModelAndView();
		model.addObject("message",exception.getMessage());
		model.setViewName("error");
		return model;
	}

}

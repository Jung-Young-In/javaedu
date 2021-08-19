package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//아무 내용도 안나온다는 것은 hook메서드로 이미 만들어져 있다는 의미(그러므로 반드시 메서드를 오버라이딩 하는 것은 아니고 선택하여 오버라이딩 하게 됨)
//이 클래스는 handler에 해당하기 때문에 return false 시키게 되면 컨트롤러가 실행하지 않게 됨(이벤트 핸들러에서 return false하게 되면 default를 실행하지 않는 것과 같은 원리)
public class PreInterceptor extends HandlerInterceptorAdapter {

	@Override
	//Object handler는 preHandle를 하기 위한 핸들러임(그러나 우리가 직접 만든 것이 아니고 Type까지 Object라 잘 모르기 때문에 사용하지 않음)
	//preHandle은 컨트롤러가 실행되기 전 과정
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean result = true;
		
		String state = request.getParameter("state");
		
		if (state == null || state.equals("go")) {
			response.sendRedirect(request.getContextPath());
			result = false;
		}
		return result;
	}

//	@Override
	//postHandle은 컨트롤러 실행된 후(이때 model에 무언가 담겨 올텐데 이것에 집중, 처리하는 과정)
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}

//	@Override
	//afterCompletion은 뷰가 다 넘어가고 exception을 핸들링 하는 과정인데 잘 사용하지 않음
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//		super.afterCompletion(request, response, handler, ex);
//	}

}

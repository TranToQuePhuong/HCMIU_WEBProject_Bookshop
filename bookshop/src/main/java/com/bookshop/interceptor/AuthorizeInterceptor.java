package com.bookshop.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bookshop.entity.Customer;


//Viết Interceptor để phân quyền truy cập trang
//Tránh trường hợp người ngoài sao chép đường dẫn và dễ dàng truy cập trang khi chưa có đủ quyền
//vD: chưa login mà vẫn dùng đường dẫn /account/changePasword để đổi mật khẩu được
@Component
public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//Security thì dùng pre, nghĩa là xét trước khi thao tác đến session
		//Đầu tiên kiểm tra trong session đã có user hay chưa
		HttpSession session=request.getSession();
		Customer user=(Customer)session.getAttribute("user");
		if(user==null) {
			//Nếu chưa đăng nhập
			//Ghi nhận đường dẫn ngta muốn truy xuất khi chưa đăng nhập (ghi nhận bằng request.getRequestURI())
			//cất vào attribute "back-url" 
			session.setAttribute("back-url", request.getRequestURI());
			//Chặn lại bắt ngta login trước (return false)
			//(More details) Nếu login thành công thì trả về đường dẫn đã ghi nhận ở "back-url"
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}


}

package com.ljm.web.filter;

import java.io.IOException;
import java.io.PrintWriter;
  
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
import org.springframework.web.filter.OncePerRequestFilter;

public class LoginFilter extends OncePerRequestFilter {
  
    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
    	
        String[] notFilter = new String[] { "/css/", "/fonts/", "/img/", "/jquery/", "/js/", "/locales/", "/index", 
        		"/User_doLogin", "/User_sendValiCode", "/User_checkUserNameExist", "/User_doRegister", 
        		"/BookMark_show", "/BookMark_getBookMarkListPage", "/Comment_getCommentsListPage", 
        		"/BookMark_getRecentBookMark", "/BookMark_getPopularBookMark", "/User_jumpFindPassword", 
        		"/User_checkEmailRgst", "/User_findPassword", "/User_userList", "/User_getUserListPage",
        		"/Admin_index", "/Admin_login", "/User_checkUserIsBan", "/User_viewUser"};
        
        String[] admin_filter = new String[]{ "/Admin_home", "/Admin_getUserListPage", "/Admin_banUser",
        		"/Admin_unBanUser", "/Admin_resetPWD", "/Admin_getBookMarkListPage", "/Admin_bookmarkImgUpload",
        		"/Admin_modifyBookMark", "/Admin_removeBookMark", "/Admin_getLogListPage", "/Admin_getUserAtyWeek",
        		"/Admin_getBookMarkAtyWeek", "/Admin_sendInformation"};
  
        String uri = request.getRequestURI();
        
        boolean doFilter = true;
        for (String s : notFilter) {
            if (uri.indexOf(s) != -1) {
                doFilter = false;
                break;
            }
        }
//        System.out.println(uri);
        //处理访问前台首页
        if(uri.equals("/BookMarkStation/")) doFilter = false;
        //处理访问后台首页
        if(uri.equals("/BookMarkStation/Admin")) doFilter = false;
        	
        if (doFilter) {
        	boolean flag = true;
        	for (String s : admin_filter) {
                if (uri.indexOf(s) != -1) {
                    flag = false;
                    break;
                }
            }
        	
        	if(flag){
        		//前台用户登录过滤
	            Object obj = request.getSession().getAttribute("loggedUser");
	            if (null == obj) {
	                request.setCharacterEncoding("UTF-8");
	                response.setContentType("text/html; charset=utf-8");
	                PrintWriter out = response.getWriter();
	                StringBuilder builder = new StringBuilder();
	                builder.append("<script type=\"text/javascript\">");
	                builder.append("alert('请先登录！');");
	//                builder.append("window.location.href = document.referrer;");
	                builder.append("window.location.href = '/BookMarkStation/index';");
	                builder.append("</script>");
	                out.print(builder.toString());
	            } else {
	                filterChain.doFilter(request, response);
	            }
        	}else{
        		//后台管理登录过滤
	            Object obj = request.getSession().getAttribute("admin");
	            if (null == obj) {
	                request.setCharacterEncoding("UTF-8");
	                response.setContentType("text/html; charset=utf-8");
	                PrintWriter out = response.getWriter();
	                StringBuilder builder = new StringBuilder();
	                builder.append("<script type=\"text/javascript\">");
	                builder.append("alert('请先登录！');");
	                builder.append("window.location.href = '/BookMarkStation/Admin_index';");
	                builder.append("</script>");
	                out.print(builder.toString());
	            } else {
	                filterChain.doFilter(request, response);
	            }
        	}
        } else {
            filterChain.doFilter(request, response);
        }
    }
  
}
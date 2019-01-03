package com.iteazer.servlets;

import com.iteazer.logic.Team;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.iteazer.logic.Constants.ADMIN_NAME;

/**
 *
 * @author Wsl_F@ITeazer
 */
public class LoggedInFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("login") == null) {
            response.sendRedirect("index.jsp");
        } else {
            String login = (String) session.getAttribute("login");
            if (!Team.exists(login)) {
                response.sendRedirect("index.jsp");
            } else {
                if (login.equals(ADMIN_NAME)) {
                    response.sendRedirect("admin.jsp");
                }
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

}

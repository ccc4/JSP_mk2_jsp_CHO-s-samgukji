

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

/**
 * Servlet implementation class UserRegisterCheckServlet
 */
@WebServlet("/UserNicknameCheckServlet")
public class UserNicknameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String nickname = request.getParameter("nickname");
		
		Dao dao = Dao.getInstance();
		response.getWriter().write(dao.uJoinCheckNickname(nickname) + "");
	}

//	servlet 을 사용하지 않는 방법은 또 어떤게 있을지? 
//	*.do 를 이용한 방법이 있을지..
//	xhr을 이용한 방법도 알아보기
}

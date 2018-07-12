

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
@WebServlet("/UserIDCheckServlet")
public class UserIDCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		
		Dao dao = Dao.getInstance();
		response.getWriter().write(dao.uJoinCheckID(id) + "");
	}

//	servlet �� ������� �ʴ� ����� �� ��� ������? 
//	*.do �� �̿��� ����� ������..
//	xhr�� �̿��� ����� �˾ƺ���
}

package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.UDto;

public class ULoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("userID");
		String pw = request.getParameter("userPassword");
		
		Dao dao = Dao.getInstance();
		int result = dao.ulogin(id, pw);
		System.out.println(result);
		
		if(result == 1) {
			request.setAttribute("okULogin", "1");
			UDto dto = dao.getUser(id);
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("userIDX", dto.getUserIDX());
			request.getSession().setAttribute("getUser", dto);
			System.out.println("getSession.getMaxInactiveInterval() : " + request.getSession().getMaxInactiveInterval());
		} else if(result == 0) {
			request.setAttribute("okULogin", "0");
		} else if(result == -1) {
			request.setAttribute("okULogin", "-1");
		}

	}

}

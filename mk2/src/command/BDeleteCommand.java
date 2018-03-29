package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

public class BDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		Object sessionUserIDX = request.getSession().getAttribute("userIDX");
		String userIDX = request.getParameter("bUserIDX");
		String idx = request.getParameter("bIDX");

		if(sessionUserIDX == null) {
			request.setAttribute("okBDelete", "-1"); // �߸��� ����
		} else {
			Dao dao = Dao.getInstance();
			int result = dao.bDelete(idx, userIDX);
			
			if(result == 1) {
				request.setAttribute("okBDelete", "1"); // ����
			} else if(result == 0) {
				request.setAttribute("okBDelete", "0"); // ����
				request.setAttribute("bIDX", idx);
			}
		}
	}

}

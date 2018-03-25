package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

public class BModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String idx = request.getParameter("bIDX");
		String id = request.getParameter("bID");
		String title = request.getParameter("bTitle");
		String content = request.getParameter("bContent");

		Dao dao = Dao.getInstance();
		int result = dao.bModify(idx, id, title, content);
		System.out.println(result);
		
		if(result == 1) {
			request.setAttribute("okBModify", "1");
			request.setAttribute("bIDX", idx);
		} else if(result == 0) {
			request.setAttribute("okBModify", "0");
			request.setAttribute("bIDX", idx);
		}
	}

}

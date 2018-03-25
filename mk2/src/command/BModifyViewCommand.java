package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.BDto;

public class BModifyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("bID");
		String idx = request.getParameter("bIDX");
		
		Dao dao = Dao.getInstance();
		BDto dto = dao.bContentModify(idx);
		request.setAttribute("bModify_view", dto);
		request.setAttribute("bID", id);
	}

}

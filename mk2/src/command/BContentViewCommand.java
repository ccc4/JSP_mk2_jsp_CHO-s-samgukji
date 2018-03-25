package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.BDto;

public class BContentViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String idx = request.getParameter("bIDX");
		
		Dao dao = Dao.getInstance();
		BDto dto = dao.bContentView(idx);
		request.setAttribute("bContentView", dto);
	}

}

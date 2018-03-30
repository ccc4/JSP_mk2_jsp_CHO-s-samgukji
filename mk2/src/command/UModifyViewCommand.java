package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.UDto;

public class UModifyViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int sessionIDX = (int) request.getSession().getAttribute("sessionIDX");
		
		Dao dao = Dao.getInstance();
		UDto dto = dao.getUser(sessionIDX);
		request.setAttribute("getUser", dto);

	}

}

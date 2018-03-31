package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.BDto;

public class BoardCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int pageNum = 1;
		if(request.getParameter("page") == null) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(request.getParameter("page"));
		}
		
		Dao dao = Dao.getInstance();
		String paging = dao.bPaging(pageNum);
		if(paging == "false") {
			request.setAttribute("paging", "false");
		} else {
			ArrayList<BDto> dtos = dao.bList(pageNum);
			
			request.setAttribute("paging", paging);
			request.setAttribute("bList", dtos);
		}
	}

}

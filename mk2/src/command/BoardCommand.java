package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.BDto;

public class BoardCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		Dao dao = Dao.getInstance();
		ArrayList<BDto> dtos = dao.bList();

		request.setAttribute("bList", dtos);
	}

}

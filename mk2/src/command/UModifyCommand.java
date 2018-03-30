package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.UDto;

public class UModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int sessionIDX = (int) request.getSession().getAttribute("sessionIDX");
		String pw = request.getParameter("userPassword");
		String name = request.getParameter("userName");
		String nickname = request.getParameter("userNickname");
		int gender = Integer.parseInt(request.getParameter("userGender"));
		int phone1 = Integer.parseInt(request.getParameter("userPhone1"));
		int phone2 = Integer.parseInt(request.getParameter("userPhone2"));
		String email1 = request.getParameter("userEmail1");
		String email2 = request.getParameter("userEmail2");
		String address = request.getParameter("userAddress");
		
		Dao dao = Dao.getInstance();
		int result = dao.uModify(sessionIDX, pw, name, nickname, gender, phone1, phone2, email1, email2, address);
		System.out.println(result);
		
		if(result == 1) {
			request.setAttribute("okUModify", "1");
			UDto dto = dao.getUser(sessionIDX);
			request.getSession().setAttribute("sessionNickname", dto.getUserNickname());
		} else if(result == 0) {
			request.setAttribute("okUModify", "0");
		}
	}

}

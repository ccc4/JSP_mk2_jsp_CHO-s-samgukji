package frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;

import command.UJoinCommand;
import command.ULoginCommand;
import command.UModifyCommand;

/**
 * Servlet implementation class mFrontcontroller
 */
@WebServlet("*.do")
public class Frontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Frontcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewpage = null;
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
//		if(com.equals("/index.do")) {
//			command = new MainCommand();
//			command.execute(request, response);
//			viewpage = "index.jsp";
//		}
		
//		회원정보
		
		if(com.equals("/uJoin.do")) {
			command = new UJoinCommand();
			command.execute(request, response);
			viewpage = "okUJoin.jsp";
		}
		else if(com.equals("/uLogin.do")) {
			command = new ULoginCommand();
			command.execute(request, response);
			viewpage = "okULogin.jsp";
		}
		else if(com.equals("/uModify.do")) {
			command = new UModifyCommand();
			command.execute(request, response);
			viewpage = "okUModify.jsp";
		}
		
//		게시판기능
		
//		else if(com.equals("/bWrite.do")) {
//			command = new BWriteCommand();
//			command.execute(request, response);
//			viewpage = "okBWrite.jsp";
//		}
//		else if(com.equals("/bContent_view.do")) {
//			command = new BContentViewCommand();
//			command.execute(request, response);
//			viewpage = "bContent_view.jsp";
//		}
//		else if(com.equals("/bModify_view.do")) {
//			command = new BModifyViewCommand();
//			command.execute(request, response);
//			viewpage = "bModify_view.jsp";
//		}
//		else if(com.equals("/bModify.do")) {
//			command = new BModifyCommand();
//			command.execute(request, response);
//			viewpage = "okBModify.jsp";
//		}
//		else if(com.equals("/bDelete.do")) {
//			command = new BDeleteCommand();
//			command.execute(request, response);
//			viewpage = "okBDeleteDone.jsp";
//		}
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
	}

	

}

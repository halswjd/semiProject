package today.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import today.model.service.TodayService;
import today.model.vo.Today;

/**
 * Servlet implementation class TogetherInsertController
 */
@WebServlet("/insert.tg")
public class TogetherInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String people = request.getParameter("people");
		String mountain = request.getParameter("mountain");
		String date = request.getParameter("date");
		String time = request.getParameter("ampm") + " " + request.getParameter("time");
		String course = request.getParameter("course");
		String vehicle = request.getParameter("transport");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Today t = new Today(title, content, mountain, date, time, course, people, vehicle, userNo+"");
		
		int result = new TodayService().insertTogether(t);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "같이등산행 글 작성에 성공하였습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "글 작성에 실패하였습니다.");
		}
		response.sendRedirect(request.getContextPath() + "/list.tg");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

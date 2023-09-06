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
 * Servlet implementation class TogetherUpdateController
 */
@WebServlet("/update.tg")
public class TogetherUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String boardNo = request.getParameter("boardNo");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String people = request.getParameter("people");
		String mountain = request.getParameter("mountain");
		String date = request.getParameter("date");
		String time = request.getParameter("ampm") + " " + request.getParameter("time");
		String course = request.getParameter("course");
		String vehicle = request.getParameter("transport");
		
		Today t = new Today();
		t.setTodayNo(boardNo);
		t.setTodayTitle(title);
		t.setTodayContent(content);
		t.setLev(people);
		t.setTodayName(mountain);
		t.setTodayDate(date);
		t.setTodayTime(time);
		t.setTodayCourse(course);
		t.setTodayVehicle(vehicle);
		
		int result = new TodayService().updateTogether(t);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "게시글 수정에 실패하였습니다.");			
		}
		response.sendRedirect(request.getContextPath() + "/detail.tg?tno=" + boardNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

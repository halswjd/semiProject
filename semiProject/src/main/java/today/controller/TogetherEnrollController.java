package today.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import today.model.service.TodayService;

/**
 * Servlet implementation class TogetherEnrollController
 */
@WebServlet("/enroll.tg")
public class TogetherEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tno = request.getParameter("tno");
		int uno = Integer.parseInt(request.getParameter("uno"));
		
		int result = new TodayService().enrollTogether(uno, tno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "모임 신청이 완료되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "모임 신청에 실패하였습니다.");
		}
		
		response.sendRedirect(request.getContextPath() + "/detail.tg?tno=" + tno);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

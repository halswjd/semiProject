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
 * Servlet implementation class TogetherDetailViewController
 */
@WebServlet("/detail.tg")
public class TogetherDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TogetherDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tno = "T" + request.getParameter("tno");
		
		int result = new TodayService().increaseCount(tno);
		
		if(result > 0) {
			Today t = new TodayService().selectTogether(tno);
			request.setAttribute("t", t);
			request.getRequestDispatcher("views/today/togetherDetailView.jsp").forward(request, response);;
			
		}else {
			request.getSession().setAttribute("alertMsg", "게시글 조회에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.tg");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

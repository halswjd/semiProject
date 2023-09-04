package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import common.MyFileRenamePolicy;
import oracle.net.aso.e;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// Board update
			Board b = new Board();
			b.setBoardWriter(multiRequest.getParameter("userNo"));
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("content"));
			b.setHashtag(multiRequest.getParameter("hashtagArr"));
			b.setCategory(multiRequest.getParameter("subject"));
			b.setBoardNo(Integer.parseInt(multiRequest.getParameter("boardNo")));
			
//			Attachment at = null; // 처음에는 null로 초기화, 넘어오는 값이 있으면 생성
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			ArrayList<Integer> deleteList = new ArrayList<Integer>();
					
			for(int i=1; i<=3; i++) {
				
				String key = "file" + i;
				
				// 삭제할 fileNo 뽑기
				if(multiRequest.getOriginalFileName(key) != null) {
					if(multiRequest.getParameter(key+"No")!=null) {
						deleteList.add(Integer.parseInt(multiRequest.getParameter(key+"No")));						
					}
				}
				
				// 새로 insert하기
				if(multiRequest.getOriginalFileName(key) != null) { // 수정한다고 선택했을 경우
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/board_upfiles");
					at.setRefBoardNo(Integer.parseInt(multiRequest.getParameter("boardNo")));
					
					list.add(at);
					
				}
			}
				
				int result = new BoardService().updateBoard(b, list, deleteList);
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "게시글 수정 성공");
					request.getRequestDispatcher("/detail.bo?bno=" + multiRequest.getParameter("boardNo")).forward(request, response);
				}
			
		
			
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

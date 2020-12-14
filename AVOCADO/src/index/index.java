package index;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExchangeRate_dao;
import dao.NoticeDao;
import dto.ExchangeRate_dto;
import dto.NoticeDto;

/**
 * Servlet implementation class index
 */
@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		
		ExchangeRate_dao exchangeRateDao = new ExchangeRate_dao();
		NoticeDao noticeDao = new NoticeDao();
		
		try {
			ArrayList<ExchangeRate_dto> exchangeRateArray = exchangeRateDao.getExchangeRate();
			ArrayList<NoticeDto> noticeArray = noticeDao.getNoticeList("", "");
			
			request.setAttribute("t_exchangeRateArray", exchangeRateArray);
			request.setAttribute("t_noticeArray", noticeArray);
			
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			
			e.printStackTrace();
		}
		
		
		
		
		
		
		//PrintExchangeRateResult
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

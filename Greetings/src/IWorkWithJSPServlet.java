

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IWorkWithJSPServlet
 */
@WebServlet("/greetingsServletNew")
public class IWorkWithJSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IWorkWithJSPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	     RequestDispatcher rs = request.getServletContext().getRequestDispatcher("/WEB-INF/NewGreetingsJSP.jsp");
	     
	     String counter =(String) request.getSession().getAttribute("counter");
	     
	     if (counter == null) {
	    	 counter = "1";
	     } else {
	    	 Integer counterInt = Integer.parseInt(counter);
	    	 counterInt++;
	    	 counter = counterInt.toString();
	     }
	     
	     request.getSession().setAttribute("counter", counter);
	     String wel = request.getParameter("name")+"\nYou visited " + counter + "times!!";
//	     welcome += "\nYou visited " + counter + "times!!";
	     request.setAttribute("personalizedGreeting", wel);
	     rs.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

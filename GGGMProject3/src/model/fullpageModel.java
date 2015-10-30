package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class fullpageModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		return "fullpageMain.jsp";
	}

}

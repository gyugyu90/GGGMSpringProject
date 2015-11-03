package model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdvertiseDAO;
import dao.AdvertiseDTO;
import dao.ReplyBoardDAO;
import dao.ReplyDTO;

public class Ad_IndexModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int adno=Integer.parseInt(req.getParameter("adno"));
		System.out.println("adno:"+adno);
		AdvertiseDTO d=AdvertiseDAO.ad_info(adno);
		req.setAttribute("adinfo", d);
		
		int[] sideposter=getRand(adno);
		List<AdvertiseDTO> sidelist=new ArrayList<AdvertiseDTO>();
		for(int i=0;i<sideposter.length;i++){
			AdvertiseDTO side=AdvertiseDAO.side_info(sideposter[i]);
			sidelist.add(side);
		}
		req.setAttribute("sidelist", sidelist);
		
		List<ReplyDTO> list = ReplyBoardDAO.replyListData(adno);
		System.out.println("list size:"+list.size());
		req.setAttribute("list", list);
		req.setAttribute("curpage", adno);
		req.setAttribute("jsp", "../adview/ad_index.jsp?adno="+adno);
		return "pages/main/main.jsp";
	}
	
	public int[] getRand(int no){
		int[] temp=new int[5];
		int su=0;
		boolean bDash=false;
		for(int i=0;i<5;i++){
			bDash=true;
			while(bDash){
				su=(int)(Math.random()*30)+1;
				if(su==no){
					continue;
				}
				bDash=false;
				for(int j=0;j<i;j++){
					if(temp[j]==su){
						bDash=true;
						break;
					}
				}
			}
			temp[i]=su;
		}
		return temp;
	}

}
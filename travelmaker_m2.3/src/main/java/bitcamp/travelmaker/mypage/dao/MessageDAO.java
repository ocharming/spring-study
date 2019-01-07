package bitcamp.travelmaker.mypage.dao;

import java.util.HashMap;
import java.util.List;


public interface MessageDAO {

	public int insertMessage(HashMap<String, Object> map);
	public List<HashMap<String, Object>> listMessage(String m_Semail);
	public List<HashMap<String, Object>> SlistMessage(String m_Semail);
	public void deleteMessage(int n_Num);
	
	/*public List<HashMap<String, Object>> frinedsList(String m_Email);*/

}

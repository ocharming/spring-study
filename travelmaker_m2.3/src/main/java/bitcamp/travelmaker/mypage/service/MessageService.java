package bitcamp.travelmaker.mypage.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.travelmaker.mypage.dao.MessageDAO;


@Service
public class MessageService {
	@Autowired
	private SqlSession sqlsession;

	public int insertMessage(HashMap<String, Object> map) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		int result = dao.insertMessage(map);
		return result;
	}

	
	public List<HashMap<String, Object>> listMessage(String m_Email){
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		
		List<HashMap<String, Object>> list = dao.listMessage(m_Email);
		
		return list;
	}
	public List<HashMap<String, Object>> SlistMessage(String m_Email){
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		
		List<HashMap<String, Object>> list = dao.SlistMessage(m_Email);
		
		return list;
	}
	
	
	public void deleteMessage(int n_Num) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.deleteMessage(n_Num);
		
			
	}
	
	
	
	
}


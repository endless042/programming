package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.OrderVO;
import vo.UserVO;
@Repository
public class UserDAO implements UserInterface{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace="user";
	
	public void addUser(UserVO user) {
		
		HashMap map=new HashMap();
	
		sqlSession.insert(namespace+".addUser", user);
		
	}
	
	public UserVO getUser(UserVO user) {
		
		HashMap map=new HashMap();
		map.put("userid", user.getUserid());
		map.put("passwd", user.getPasswd());
		UserVO vo=null;
		vo=sqlSession.selectOne(namespace+".getUser",map);
	
		return vo;
	}
	
	
	
	public boolean isUser(UserVO user) {
		
		HashMap map=new HashMap();
		map.put("userid", user.getUserid());
		map.put("passwd", user.getPasswd());
		
		int isUser=0;
		isUser=sqlSession.selectOne(namespace+".isUser",map);
		
		if(isUser==1) {
			return true;
		}else{
			return false;
		}
	
	}
	public int getUserCount() {
	
		
		int count=0;
		count=sqlSession.selectOne(namespace+".getUserCount");
	
		return count;
	}
	
	public int getUserCount(String option, String keyword) {
		
		HashMap map=new HashMap();
		map.put("option", option);
		map.put("keyword",keyword);
		int count=0;
		count=sqlSession.selectOne(namespace+".getUserCountSearch",map);
		
		return count;
	}
	
	public UserVO getUser(String userid) {
		
		HashMap map=new HashMap();
		map.put("userid", userid);
		UserVO user=null;
		user=sqlSession.selectOne(namespace+".getUserById",map);
		
		return user;
	}
	
	public List getUserlist(int startRow, int endRow, String option, String keyword) {
	
		HashMap map=new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("keyword",keyword);
		map.put("option",option);
		
		
		List li=sqlSession.selectList(namespace+".getUserlist", map);
	
		return li;
	}
	

public int modifyUser(UserVO user) {
	
	int result=0;
	result=sqlSession.update(namespace+".modifyUser",user);

	return result;
}

public int modifyUser(String userid, String email) {
	
	int result=0;
	HashMap map=new HashMap();
	map.put("userid", userid);
	map.put("email", email);
	
	result=sqlSession.update(namespace+".modifyUserAdmin",map);
	
	return result;
}

public int deleteUser(String userid) {
	
	
	int result=0;
	HashMap map=new HashMap();
	map.put("userid", userid);
	result=sqlSession.update(namespace+".deleteUser",map);
	
	
	return result;
}
	
public boolean idCheck(String userid) {
	
	boolean result=false;
	int tmp=0;
	HashMap map=new HashMap();
	map.put("userid", userid);
	tmp=sqlSession.selectOne(namespace+".idCheck",map);
	
	if(tmp==0) {
		result=true;
	}
	

	return result;
}


public int addOrder(OrderVO order) {
	
	
	int result=sqlSession.insert(namespace+".addOrder", order);
	
	return result;
}


public List getOrderlist(String userid) {
	
	HashMap map=new HashMap();
	
	map.put("userid",userid);
	
	
	List li=sqlSession.selectList(namespace+".getOrderlist", map);

	return li;
}



public int getOrderCount(String userid) {
	
	HashMap map=new HashMap();
	map.put("userid", userid);
	
	int count=0;
	count=sqlSession.selectOne(namespace+".getOrderCount",map);

	return count;
}
	
public int cancelOrder(String onum) {
	
	
	int result=0;
	HashMap map=new HashMap();
	map.put("onum", onum);
	result=sqlSession.update(namespace+".cancelOrder",map);
	
	
	return result;
}




}

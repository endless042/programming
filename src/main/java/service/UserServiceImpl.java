package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserInterface;
import vo.OrderVO;
import vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserInterface upro;

	public void addUser(UserVO user) {
		upro.addUser(user);

	}

	public UserVO getUser(UserVO user) {
		// TODO Auto-generated method stub
		return upro.getUser(user);
	}

	public boolean isUser(UserVO user) {
		// TODO Auto-generated method stub
		return upro.isUser(user);
	}

	public int getUserCount() {
		// TODO Auto-generated method stub
		return upro.getUserCount();
	}

	public int getUserCount(String option, String keyword) {
		// TODO Auto-generated method stub
		return upro.getUserCount(option, keyword);
	}

	public UserVO getUser(String userid) {
		// TODO Auto-generated method stub
		return upro.getUser(userid);
	}

	public List getUserlist(int startRow, int endRow, String option, String keyword) {
		// TODO Auto-generated method stub
		return upro.getUserlist(startRow, endRow, option, keyword);
	}

	public int modifyUser(UserVO user) {
		// TODO Auto-generated method stub
		return upro.modifyUser(user);
	}

	public int modifyUser(String userid, String email) {
		// TODO Auto-generated method stub
		return upro.modifyUser(userid, email);
	}

	public int deleteUser(String userid) {
		// TODO Auto-generated method stub
		return upro.deleteUser(userid);
	}

	public boolean idCheck(String userid) {
		// TODO Auto-generated method stub
		return upro.idCheck(userid);
	}

	public int addOrder(OrderVO order) {
		// TODO Auto-generated method stub
		return upro.addOrder(order);
	}

	public List getOrderlist(String userid) {
		// TODO Auto-generated method stub
		return upro.getOrderlist(userid);
	}

	public int getOrderCount(String userid) {
		// TODO Auto-generated method stub
		return upro.getOrderCount(userid);
	}

	public int cancelOrder(String onum) {
		// TODO Auto-generated method stub
		return upro.cancelOrder(onum);
	}
}

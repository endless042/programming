package service;

import java.util.HashMap;
import java.util.List;

import vo.OrderVO;
import vo.UserVO;

public interface UserService {
	public void addUser(UserVO user);

	public UserVO getUser(UserVO user);

	public boolean isUser(UserVO user);

	public int getUserCount();

	public int getUserCount(String option, String keyword);

	public UserVO getUser(String userid);

	public List getUserlist(int startRow, int endRow, String option, String keyword);

	public int modifyUser(UserVO user);

	public int modifyUser(String userid, String email);

	public int deleteUser(String userid);

	public boolean idCheck(String userid);
	public int addOrder(OrderVO order);
	public List getOrderlist(String userid);

	public int getOrderCount(String userid);
	public int cancelOrder(String onum);
}

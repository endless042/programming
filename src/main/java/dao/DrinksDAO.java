package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.DrinksVO;
import vo.MilkVO;
import vo.SeasonVO;
@Repository
public class DrinksDAO implements DrinksInterface{

	@Autowired
	private SqlSession sqlSession;
	private final String namespace="drinks";
	

public List getDrinklist(int startRow, int endRow, String option, String keyword) {
		
		HashMap map=new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("keyword",keyword);
		map.put("option",option);
		
		
		List li=sqlSession.selectList(namespace+".getDrinklist", map);
	
		return li;
	}
	
	public int getDrinkCount() {
		
		
		int count=0;
		count=sqlSession.selectOne(namespace+".getDrinkCount");
		
		return count;
	}
	
	public int getDrinkCount(String option, String keyword) {
		
		HashMap map=new HashMap();
		map.put("option", option);
		map.put("keyword",keyword);
		int count=0;
		count=sqlSession.selectOne(namespace+".getDrinkCountSearch",map);
	
		return count;
	}
	
	public DrinksVO getDrink(String dnum) {
		
		HashMap map=new HashMap();
		map.put("dnum", dnum);
		DrinksVO Drink=null;
		Drink=sqlSession.selectOne(namespace+".getDrink",map);
		
		return Drink;
	}
	
	public MilkVO getMilk(String dnum) {
		
		HashMap map=new HashMap();
		map.put("dnum", dnum);
		MilkVO milk=null;
		milk=sqlSession.selectOne(namespace+".getMilk",map);
		
		return milk;
	}
	
	public SeasonVO getSeason(String dnum) {
		
		HashMap map=new HashMap();
		map.put("dnum", dnum);
		SeasonVO season=null;
		season=sqlSession.selectOne(namespace+".getSeason",map);
		
		return season;
	}
	
	
	
public int addDrink(DrinksVO drink) {
	
		int result=sqlSession.insert(namespace+".addDrink",drink);
		
		
		return result;
	}

public int getDnum() {
	int dnum=sqlSession.selectOne(namespace+".getDnum");
	
	return dnum;
}


public int modifyDrink(DrinksVO drink) {
	System.out.println(drink);
	
	int result=0;
	result=sqlSession.update(namespace+".modifyDrink",drink);
	
	return result;
}

public int deleteDrink(String dnum) {
	
	
	int result=0;
	HashMap map=new HashMap();
	map.put("dnum", dnum);
	result=sqlSession.update(namespace+".deleteDrink",map);
	
	return result;
}
	
	
public int addMilkInfo(MilkVO milk) {

	int result=0;
	
	result=sqlSession.insert(namespace+".addMilkInfo",milk);
	
	return result;
}

public int addSeasonInfo(SeasonVO season) {

	int result=0;
	
	result=sqlSession.insert(namespace+".addSeasonInfo",season);
	
	return result;
}


}

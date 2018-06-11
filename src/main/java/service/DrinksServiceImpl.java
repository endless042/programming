package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.DrinksInterface;
import vo.DrinksVO;
import vo.MilkVO;
import vo.SeasonVO;

public class DrinksServiceImpl implements DrinksService{

	@Autowired
	DrinksInterface dpro;
	
	public List getDrinklist(int startRow, int endRow, String option, String keyword) {
		// TODO Auto-generated method stub
		return dpro.getDrinklist(startRow, endRow, option, keyword);
	}

	public int getDrinkCount() {
		// TODO Auto-generated method stub
		return dpro.getDrinkCount();
	}

	public int getDrinkCount(String option, String keyword) {
		// TODO Auto-generated method stub
		return dpro.getDrinkCount(option, keyword);
	}

	public DrinksVO getDrink(String dnum) {
		// TODO Auto-generated method stub
		return dpro.getDrink(dnum);
	}

	public int addDrink(DrinksVO drink) {
		// TODO Auto-generated method stub
		return dpro.addDrink(drink);
	}

	public int modifyDrink(DrinksVO drink) {
		// TODO Auto-generated method stub
		return dpro.modifyDrink(drink);
	}

	public int deleteDrink(String dnum) {
		// TODO Auto-generated method stub
		return dpro.deleteDrink(dnum);
	}

	public int getDnum() {
		// TODO Auto-generated method stub
		return dpro.getDnum();
	}

	public int addMilkInfo(MilkVO milk) {
		// TODO Auto-generated method stub
		return dpro.addMilkInfo(milk);
	}

	public int addSeasonInfo(SeasonVO season) {
		// TODO Auto-generated method stub
		return dpro.addSeasonInfo(season);
	}

	public MilkVO getMilk(String dnum) {
		// TODO Auto-generated method stub
		return dpro.getMilk(dnum);
	}

	public SeasonVO getSeason(String dnum) {
		// TODO Auto-generated method stub
		return dpro.getSeason(dnum);
	}

}

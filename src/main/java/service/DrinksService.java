package service;

import java.util.List;

import vo.DrinksVO;
import vo.MilkVO;
import vo.SeasonVO;

public interface DrinksService {

	public List getDrinklist(int startRow, int endRow, String option, String keyword);

	public int getDrinkCount();

	public int getDrinkCount(String option, String keyword);

	public DrinksVO getDrink(String dnum);

	public int addDrink(DrinksVO drink);

	public int modifyDrink(DrinksVO drink);

	public int deleteDrink(String dnum);
	public int getDnum();
	public int addMilkInfo(MilkVO milk);
	public int addSeasonInfo(SeasonVO season);
public MilkVO getMilk(String dnum);
	
	public SeasonVO getSeason(String dnum);
}

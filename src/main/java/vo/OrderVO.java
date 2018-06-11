package vo;

import java.util.Date;

public class OrderVO {

	private int onum;
	private int dnum;
	private String userid;
	private Date regdate;
	private String temp;
	private String addopt;
	private String milk;
	private int count;
	private int price;
	private String drinksize;
	private DrinksVO drink;
	private int state;
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public DrinksVO getDrink() {
		return drink;
	}
	public void setDrink(DrinksVO drink) {
		this.drink = drink;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDrinksize() {
		return drinksize;
	}
	public void setDrinksize(String drinksize) {
		this.drinksize = drinksize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getAddopt() {
		return addopt;
	}
	public void setAddopt(String addopt) {
		this.addopt = addopt;
	}
	public String getMilk() {
		return milk;
	}
	public void setMilk(String milk) {
		this.milk = milk;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "OrderVO [onum=" + onum + ", dnum=" + dnum + ", userid=" + userid + ", regdate=" + regdate + ", temp="
				+ temp + ", addopt=" + addopt + ", milk=" + milk + ", count=" + count + ", price=" + price
				+ ", drinksize=" + drinksize + ", drink=" + drink + ", state=" + state + "]";
	}

	
	
}

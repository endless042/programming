package vo;

import java.util.Date;

public class SeasonVO {

	private int dnum;
	private String sdate;
	private String edate;
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	

	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	@Override
	public String toString() {
		return "SeasonVO [dnum=" + dnum + ", sdate=" + sdate + ", edate=" + edate + "]";
	}
	
	
}

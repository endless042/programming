package vo;

public class MilkVO {

	private int dnum;
	private int lowfat;
	private int soymilk;
	private int lactofree;
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public int getLowfat() {
		return lowfat;
	}
	public void setLowfat(int lowfat) {
		this.lowfat = lowfat;
	}
	public int getSoymilk() {
		return soymilk;
	}
	public void setSoymilk(int soymilk) {
		this.soymilk = soymilk;
	}
	public int getLactofree() {
		return lactofree;
	}
	public void setLactofree(int lactofree) {
		this.lactofree = lactofree;
	}
	@Override
	public String toString() {
		return "MilkVO [dnum=" + dnum + ", lowfat=" + lowfat + ", soymilk=" + soymilk + ", lactofree=" + lactofree
				+ "]";
	}
	
	
}

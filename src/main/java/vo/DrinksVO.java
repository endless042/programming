package vo;

import java.util.Date;

public class DrinksVO {

	
	private int dnum;
	private String name;
	private int hot;
	private int ice;
	private int small;
	private int regular;
	private int large;
	private String category;
	private int shot;
	private int whip;
	private int milk;
	private String content;
	private Date regdate;
	private String filename;
	private int filesize;
	private MilkVO milkvo;
	private SeasonVO seasonvo;
	
	
	
	
	public MilkVO getMilkvo() {
		return milkvo;
	}
	public void setMilkvo(MilkVO milkvo) {
		this.milkvo = milkvo;
	}
	public SeasonVO getSeasonvo() {
		return seasonvo;
	}
	public void setSeasonvo(SeasonVO seasonvo) {
		this.seasonvo = seasonvo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public int getIce() {
		return ice;
	}
	public void setIce(int ice) {
		this.ice = ice;
	}
	public int getSmall() {
		return small;
	}
	public void setSmall(int small) {
		this.small = small;
	}
	public int getRegular() {
		return regular;
	}
	public void setRegular(int regular) {
		this.regular = regular;
	}
	public int getLarge() {
		return large;
	}
	public void setLarge(int large) {
		this.large = large;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getShot() {
		return shot;
	}
	public void setShot(int shot) {
		this.shot = shot;
	}
	public int getWhip() {
		return whip;
	}
	public void setWhip(int whip) {
		this.whip = whip;
	}
	public int getMilk() {
		return milk;
	}
	public void setMilk(int milk) {
		this.milk = milk;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "DrinksVO [dnum=" + dnum + ", name=" + name + ", hot=" + hot + ", ice=" + ice + ", small=" + small
				+ ", regular=" + regular + ", large=" + large + ", category=" + category + ", shot=" + shot + ", whip="
				+ whip + ", milk=" + milk + ", content=" + content + ", regdate=" + regdate + ", filename=" + filename
				+ ", filesize=" + filesize + ", milkvo=" + milkvo + ", seasonvo=" + seasonvo + "]";
	}
	

}

package vo;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class UserVO {
	//제약조건은 VO에서 설정
		private int num;
     
	   
		@NotEmpty
	    @Length(min=5, max=20)
	    private String userid;
	      
	    @NotEmpty
	    @Email
	    private String email;
	      
	    @NotEmpty
	    @Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}")	//정규화패턴
	    private String passwd;
	      
	    private int grade;
	    
	    private Date regdate;
	    
	

		public int getGrade() {
			return grade;
		}


		public void setGrade(int grade) {
			this.grade = grade;
		}


		public int getNum() {
			return num;
		}


		public void setNum(int num) {
			this.num = num;
		}


		public String getUserid() {
			return userid;
		}


		public void setUserid(String userid) {
			this.userid = userid;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public String getPasswd() {
			return passwd;
		}


		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}


		public Date getRegdate() {
			return regdate;
		}


		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}


		@Override
		public String toString() {
			return "UserVO [num=" + num + ", userid=" + userid + ", email=" + email + ", passwd=" + passwd + ", grade="
					+ grade + ", regdate=" + regdate + "]";
		}

		
}

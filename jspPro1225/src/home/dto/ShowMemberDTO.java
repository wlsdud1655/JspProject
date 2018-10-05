package home.dto;

import java.sql.Date;

public class ShowMemberDTO {
	private String userid;
	private String passwd;
	private String name;
	private String jumin;
	private String email;
	private String hp;
	private String juso;
	private Date post_date;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "ShowMemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", jumin=" + jumin
				+ ", email=" + email + ", hp=" + hp + ", juso=" + juso + ", post_date=" + post_date + "]";
	}
	public ShowMemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShowMemberDTO(String userid, String passwd, String name, String jumin, String email, String hp, String juso,
			Date post_date) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.jumin = jumin;
		this.email = email;
		this.hp = hp;
		this.juso = juso;
		this.post_date = post_date;
	}
}

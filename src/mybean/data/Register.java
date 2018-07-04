package mybean.data;

//import com.mysql.cj.jdbc.Driver;

public class Register {
	//Driver driver = new com.mysql.jdbc.Driver();
	String logname = "",phone = "",address = "",realname = "",backNews = "«Î ‰»Î◊¢≤·–≈œ¢";
	
			public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getBackNews() {
		return backNews;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
}

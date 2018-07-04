package mybean.data;

import java.util.LinkedList;

public class Login {
	String logname = "",backNews = "Î´µÇÂ¼";
	
	LinkedList<String> car;
	
	public Login() {
		car = new LinkedList<String>();
	}

	public String getlogname() {
		return logname;
	}

	public void setlogname(String logname) {
		this.logname = logname;
	}

	public String getBackNews() {
		return backNews;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
	
	public LinkedList <String> getCar(){
		return car;
	}
}

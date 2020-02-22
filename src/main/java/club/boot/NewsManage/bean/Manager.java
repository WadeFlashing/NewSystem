package club.boot.NewsManage.bean;

import java.io.Serializable;

public class Manager implements Serializable{

	private static final long serialVersionUID = 1L;
	
	int id;
	String name;
	String password;
	
	public Manager() {
		super();
		
	}

	public Manager(int id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Manager [id=" + id + ", name=" + name + ", password=" + password + "]";
	}
	
}

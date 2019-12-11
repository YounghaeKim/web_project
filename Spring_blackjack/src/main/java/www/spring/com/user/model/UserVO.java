package www.spring.com.user.model;

import java.sql.Date;

public class UserVO {
	
	private int customerNumber;
	private String id;	
	private String password;
	private String phoneNumber;
	private String email;
	private String name;
	private String gender;
	private long currentCash;
	private long totalAmount;
	private int winRate;
	private Date registrationDate;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + customerNumber;
		return result;
	} //
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserVO other = (UserVO) obj;
		if (customerNumber != other.customerNumber)
			return false;
		return true;
	} //set할때 중복 검사 한다. 
	public int getCustomerNumber() {
		return customerNumber;
	}
	public void setCustomerNumber(int customerNumber) {
		this.customerNumber = customerNumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public long getCurrentCash() {
		return currentCash;
	}
	public void setCurrentCash(long currentCash) {
		this.currentCash = currentCash;
	}
	public long getTotalCash() {
		return totalAmount;
	}
	public void setTotalCash(long totalCash) {
		this.totalAmount = totalCash;
	}
	public int getWinRate() {
		return winRate;
	}
	public void setWinRate(int winRate) {
		this.winRate = winRate;
	}
	public Date getRegistDate() {
		return registrationDate;
	}
	public void setRegistDate(Date registDate) {
		this.registrationDate = registDate;
	}
	
}

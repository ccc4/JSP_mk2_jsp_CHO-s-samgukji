package dto;

public class UDto {

	String userID;
	String userPassword;
	String userName;
	String userNickname;
	int userGender;
	int userPhone1;
	int userPhone2;
	String userEmail1;
	String userEmail2;
	String userAddress;
	
	public UDto() {
		// TODO Auto-generated constructor stub
	}
	
	public UDto(String userPassword, String userName, String userNickname, int userGender, int userPhone1, int userPhone2, String userEmail1, String userEmail2, String userAddress) {
		
		this.userPassword = userPassword;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userGender = userGender;
		this.userPhone1 = userPhone1;
		this.userPhone2 = userPhone2;
		this.userEmail1 = userEmail1;
		this.userEmail2 = userEmail2;
		this.userAddress = userAddress;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public int getUserGender() {
		return userGender;
	}

	public void setUserGender(int userGender) {
		this.userGender = userGender;
	}

	public int getUserPhone1() {
		return userPhone1;
	}

	public void setUserPhone1(int userPhone1) {
		this.userPhone1 = userPhone1;
	}

	public int getUserPhone2() {
		return userPhone2;
	}

	public void setUserPhone2(int userPhone2) {
		this.userPhone2 = userPhone2;
	}

	public String getUserEmail1() {
		return userEmail1;
	}

	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}

	public String getUserEmail2() {
		return userEmail2;
	}

	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserID() {
		return userID;
	}

}
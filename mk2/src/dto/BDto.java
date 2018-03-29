package dto;

import java.sql.Timestamp;

public class BDto {

	int bIDX;
	int bUserIDX;
	String bNickname;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bHit;

	public BDto() {

	}
	
public BDto(int bIDX, int bUserIDX, String bNickname, String bTitle, Timestamp bDate, int bHit) {
		
		this.bIDX = bIDX;
		this.bUserIDX = bUserIDX;
		this.bNickname = bNickname;
		this.bTitle = bTitle;
		this.bDate = bDate;
		this.bHit = bHit;
	}
	
public BDto(int bIDX, int bUserIDX, String bNickname, String bTitle, String bContent, Timestamp bDate, int bHit) {
		
		this.bIDX = bIDX;
		this.bUserIDX = bUserIDX;
		this.bNickname = bNickname;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public int getbIDX() {
		return bIDX;
	}

	public int getbUserIDX() {
		return bUserIDX;
	}

	public String getbNickname() {
		return bNickname;
	}

	public Timestamp getbDate() {
		return bDate;
	}
	
	
}

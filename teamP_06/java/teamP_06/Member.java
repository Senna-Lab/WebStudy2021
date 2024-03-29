package teamP_06;

public class Member {
	private String memNum;
	private String mID;
	private String mPW;
	private String mName;
	private String mEmail;
	private String mImage;
	private String joinDate;
	private int mPoint;
	private int auth;
	
	
	public Member() {
		super();
	}
	public Member(String id) {
		super();
		this.mID = id;
	}

	public Member(String memNum, String mID, String mPW, String mName, String mEmail, String mImage, String joinDate,
			int mPoint, int auth) {
		super();
		this.memNum = memNum;
		this.mID = mID;
		this.mPW = mPW;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mImage = mImage;
		this.joinDate = joinDate;
		this.mPoint = mPoint;
		this.auth = auth;
	}

	public String getMemNum() {
		return memNum;
	}

	public String getmID() {
		return mID;
	}

	public String getmPW() {
		return mPW;
	}

	public String getmName() {
		return mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public String getmImage() {
		return mImage;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public int getmPoint() {
		return mPoint;
	}

	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public void setmPW(String mPW) {
		this.mPW = mPW;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public void setmImage(String mImage) {
		this.mImage = mImage;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}
	
	
}

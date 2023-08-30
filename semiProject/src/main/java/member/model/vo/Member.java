package member.model.vo;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickname;
	private String email;
	private String gender;
	private String phone;
	private String description;
	private String profileImg;
	private int gradeNo;
	private String status;
	private String completeMt;
	private String instaId;
	
	public Member() {}

	public Member(int userNo, String userId, String userPwd, String userName, String nickname, String email,
			String gender, String phone, String description, String profileImg, int gradeNo, String status,
			String completeMt, String instaId) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.description = description;
		this.profileImg = profileImg;
		this.gradeNo = gradeNo;
		this.status = status;
		this.completeMt = completeMt;
		this.instaId = instaId;
	}
	
	

	public Member(String userId, String userPwd, String userName, String nickname, String email, String gender,
			String phone, String description, String profileImg, int gradeNo, String instaId) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.description = description;
		this.profileImg = profileImg;
		this.gradeNo = gradeNo;
		this.instaId = instaId;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompleteMt() {
		return completeMt;
	}

	public void setCompleteMt(String completeMt) {
		this.completeMt = completeMt;
	}

	public String getInstaId() {
		return instaId;
	}

	public void setInstaId(String instaId) {
		this.instaId = instaId;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickname=" + nickname + ", email=" + email + ", gender=" + gender + ", phone=" + phone
				+ ", description=" + description + ", profileImg=" + profileImg + ", gradeNo=" + gradeNo + ", status="
				+ status + ", completeMt=" + completeMt + ", instaId=" + instaId + "]";
	}

	
	
	
}

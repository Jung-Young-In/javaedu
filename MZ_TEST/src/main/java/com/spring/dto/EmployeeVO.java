package com.spring.dto;

import java.util.Date;

public class EmployeeVO {
	
	private String empNo;  // 사번
	private String empName; // 이름
	private String empPwd; // 비밀번호
	private String empEmail; // 이메일
	private String empRegNo; // 주민번호
	private String empHp; // 핸드폰번호
	private String empPhone;  // 내선번호
	private String empPhoto; // 입사사진
	private Date empCreateDate; // 입사일
	private Date statusDate; // 상태변경일
	private int appPwd; // 결재비밀번호
	private String deptCode; // 부서코드
	private String psCode; // 직위코드
	private String empStatus; // 재직여부
	private String authority; // 권한
	
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpRegNo() {
		return empRegNo;
	}
	public void setEmpRegNo(String empRegNo) {
		this.empRegNo = empRegNo;
	}
	public String getEmpHp() {
		return empHp;
	}
	public void setEmpHp(String empHp) {
		this.empHp = empHp;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public String getEmpPhoto() {
		return empPhoto;
	}
	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}
	public Date getEmpCreateDate() {
		return empCreateDate;
	}
	public void setEmpCreateDate(Date empCreateDate) {
		this.empCreateDate = empCreateDate;
	}
	public Date getStatusDate() {
		return statusDate;
	}
	public void setStatusDate(Date statusDate) {
		this.statusDate = statusDate;
	}
	public int getAppPwd() {
		return appPwd;
	}
	public void setAppPwd(int appPwd) {
		this.appPwd = appPwd;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getPsCode() {
		return psCode;
	}
	public void setPsCode(String psCode) {
		this.psCode = psCode;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}

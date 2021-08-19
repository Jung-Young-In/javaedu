package com.spring.dto;

public class MenuVO {
	private String menuCode;
	private String menuName;
	private String menuUrl;
	private String menUpcode;
	private int menuIsnav;
	private String MenuIcon;
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenUpcode() {
		return menUpcode;
	}
	public void setMenUpcode(String menUpcode) {
		this.menUpcode = menUpcode;
	}
	public int getMenuIsnav() {
		return menuIsnav;
	}
	public void setMenuIsnav(int menuIsnav) {
		this.menuIsnav = menuIsnav;
	}
	public String getMenuIcon() {
		return MenuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		MenuIcon = menuIcon;
	}
	
}

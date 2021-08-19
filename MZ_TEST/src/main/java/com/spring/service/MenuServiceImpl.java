package com.spring.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.dao.MenuDAO;
import com.spring.dto.MenuVO;

public class MenuServiceImpl implements MenuService {
	
	private MenuDAO menuDAO;

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectMainMenu();
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String menuCode) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectSubMenu(menuCode);
		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String menuCode) throws SQLException {
		MenuVO menuVO = menuDAO.selectMenuByMcode(menuCode);
		return menuVO;
	}

	@Override
	public MenuVO getMenuByMname(String menuName) throws SQLException {
		MenuVO menu = menuDAO.selectMenuByMname(menuName);
		return menu;
	}
}

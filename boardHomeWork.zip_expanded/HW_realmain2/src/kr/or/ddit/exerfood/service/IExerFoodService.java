package kr.or.ddit.exerfood.service;

import java.util.List;

import kr.or.ddit.exerfood.vo.ExerVO;
import kr.or.ddit.exerfood.vo.FoodVO;


public interface IExerFoodService {
	public List<ExerVO> selectExerList(ExerVO ev);
	
	public List<FoodVO> selectFoodList(FoodVO fv);
	
}

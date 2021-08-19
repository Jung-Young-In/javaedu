package kr.or.ddit.mission.service;

import java.util.List;

import kr.or.ddit.mission.vo.missionVO;

public interface IMissionService {

	public int insertMission(missionVO mv);
	
	public List<missionVO> getMissionInfo(missionVO mv);
	
	
}

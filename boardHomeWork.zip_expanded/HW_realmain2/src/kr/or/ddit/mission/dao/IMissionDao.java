package kr.or.ddit.mission.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.mission.vo.missionVO;
import kr.or.ddit.video.vo.VideoVO;

public interface IMissionDao {

	
	
	
	public int insertExerciseNotice(SqlMapClient smc,missionVO mv)throws SQLException;
	
	public List<missionVO> getMissionInfo(SqlMapClient smc,missionVO mv)throws SQLException;
	
	
	
	
	
	
	
}

package kr.or.ddit.mission.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.mission.vo.missionVO;

public class MissionDaoImpl implements IMissionDao{

	
	private static IMissionDao missionDao;
	
	private MissionDaoImpl() {
		
	}
	
	public static IMissionDao getInstance() {
		if(missionDao == null) {
			missionDao = new MissionDaoImpl();
		}
		return missionDao;
	}
	
	
	@Override
	public int insertExerciseNotice(SqlMapClient smc, missionVO mv) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("mission.insertmission", mv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<missionVO> getMissionInfo(SqlMapClient smc, missionVO mv) throws SQLException {
		List<missionVO> missionList = smc.queryForList("mission.getMissionInfo",mv);
		return missionList;
	}
	
	
	
	
	
	
	

}

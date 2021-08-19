package kr.or.ddit.mission.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerciseNotice.service.ExerciseNoticeServiceImpl;
import kr.or.ddit.mission.dao.IMissionDao;
import kr.or.ddit.mission.dao.MissionDaoImpl;
import kr.or.ddit.mission.vo.missionVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class MissionServiceImpl implements IMissionService{

	private IMissionDao missionDao;
	private SqlMapClient smc;
	
	private static IMissionService missionService;
	
	private MissionServiceImpl() {
		
		missionDao = MissionDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
		
	}
	
	public static IMissionService getInstance() {
		if(missionService==null) {
			missionService = new MissionServiceImpl();
		}
		return missionService;
	}
	
	
	
	@Override
	public int insertMission(missionVO mv) {
		int cnt = 0;
		
		try {
			cnt = missionDao.insertExerciseNotice(smc, mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<missionVO> getMissionInfo(missionVO mv) {
		List<missionVO> missionList = new ArrayList<>();
		
		try {
			missionList = missionDao.getMissionInfo(smc, mv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return missionList;
	}

}

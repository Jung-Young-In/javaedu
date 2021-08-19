package kr.or.ddit.exerciseNotice.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerciseNotice.Dao.ExerciseNoticeDaoImpl;
import kr.or.ddit.exerciseNotice.Dao.IExerciseNoticeDao;
import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;
import kr.or.ddit.util.SqlMapClientUtil;
import kr.or.ddit.video.vo.VideoVO;

public class ExerciseNoticeServiceImpl implements IExerciseNoticeService{

	private IExerciseNoticeDao exerciseNoticeDao;
	private SqlMapClient smc;
	
	
	private static IExerciseNoticeService exerciseNoticeService;
	
	private ExerciseNoticeServiceImpl() {
		exerciseNoticeDao = ExerciseNoticeDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IExerciseNoticeService getInstance() {
		if(exerciseNoticeService==null) {
			exerciseNoticeService = new ExerciseNoticeServiceImpl();
		}
		return exerciseNoticeService;
	}
	
	
	@Override
	public int insertExerciseNotice(ExerciseNoticeVO ev) {
		int cnt = 0;
		
		try {
			cnt = exerciseNoticeDao.insertExerciseNotice(smc, ev);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ExerciseNoticeVO> retrieveExerciseList(ExerciseNoticeVO vv) {
		List<ExerciseNoticeVO> exerciseNoticeList = new ArrayList<>();
		
		try {
			exerciseNoticeList = exerciseNoticeDao.retrieveExerciseList(smc, vv);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return exerciseNoticeList;
	}

	
	
	
	
	
	
	
	
	
}

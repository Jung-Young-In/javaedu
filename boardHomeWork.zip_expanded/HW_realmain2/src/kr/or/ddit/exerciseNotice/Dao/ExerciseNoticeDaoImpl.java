package kr.or.ddit.exerciseNotice.Dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;
import kr.or.ddit.video.vo.VideoVO;

public class ExerciseNoticeDaoImpl implements IExerciseNoticeDao{

	
	private static IExerciseNoticeDao exerciseNoticeDao;
	
	private ExerciseNoticeDaoImpl() { //외부에서 객체생성 방지 메서드 
	}
	
	public static IExerciseNoticeDao getInstance() { //내부에서는 객체를 만들수있어서 여기서 만들어 준다 ,이미 있다면 만들었던 객체를 리턴해준다
		if(exerciseNoticeDao == null) {
			exerciseNoticeDao = new ExerciseNoticeDaoImpl();
		}
		return exerciseNoticeDao;
	}
	
	
	@Override
	public int insertExerciseNotice(SqlMapClient smc, ExerciseNoticeVO ev) throws SQLException {
		int cnt = 0;
		
		Object obj=smc.insert("exerciseNotice.insertexerciseNotice", ev);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public List<ExerciseNoticeVO> retrieveExerciseList(SqlMapClient smc, ExerciseNoticeVO vv) throws SQLException {
		List<ExerciseNoticeVO> exerciseNoticeList = smc.queryForList("exerciseNotice.retrieveExerciseList", vv);
		
		return exerciseNoticeList;
	}

	
	
	
	
}

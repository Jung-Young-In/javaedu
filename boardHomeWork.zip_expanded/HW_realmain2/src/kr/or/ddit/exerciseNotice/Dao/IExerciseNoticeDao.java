package kr.or.ddit.exerciseNotice.Dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;

public interface IExerciseNoticeDao {
	
	
	public int insertExerciseNotice(SqlMapClient smc,ExerciseNoticeVO ev)throws SQLException;
	
	public List<ExerciseNoticeVO> retrieveExerciseList(SqlMapClient smc, ExerciseNoticeVO vv) throws SQLException;

}

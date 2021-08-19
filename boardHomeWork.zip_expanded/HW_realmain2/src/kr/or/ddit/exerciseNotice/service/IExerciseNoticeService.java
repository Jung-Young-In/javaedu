package kr.or.ddit.exerciseNotice.service;

import java.util.List;

import kr.or.ddit.exerciseNotice.vo.ExerciseNoticeVO;
import kr.or.ddit.video.vo.VideoVO;

public interface IExerciseNoticeService {

	
	public int insertExerciseNotice(ExerciseNoticeVO ev);
	
	public List<ExerciseNoticeVO> retrieveExerciseList(ExerciseNoticeVO vv);
	
	
	
}

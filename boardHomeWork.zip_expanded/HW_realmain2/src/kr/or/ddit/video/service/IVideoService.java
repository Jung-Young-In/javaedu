package kr.or.ddit.video.service;

import java.util.List;

import kr.or.ddit.video.vo.VideoVO;

public interface IVideoService {
	public List<VideoVO> selectVideoPathList(VideoVO vv);
	
	public List<VideoVO> selectPrimiumVideoPathList(VideoVO vv);
	
}

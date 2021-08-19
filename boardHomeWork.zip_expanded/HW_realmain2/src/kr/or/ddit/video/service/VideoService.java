package kr.or.ddit.video.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientUtil;
import kr.or.ddit.video.dao.IVideoDao;
import kr.or.ddit.video.dao.VideoDao;
import kr.or.ddit.video.vo.VideoVO;



public class VideoService implements IVideoService {

	private IVideoDao videoDao;
	private SqlMapClient smc;
	
	private static IVideoService videoService;
	
	public VideoService() {
		videoDao = VideoDao.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IVideoService getInstance() {
		if(videoService == null) {
			videoService = new VideoService();
		}
		return videoService;
	}
	@Override
	public List<VideoVO> selectVideoPathList(VideoVO vv) {
		List<VideoVO> videoList = new ArrayList<>();
		
		try {
			videoList = videoDao.selectVideoPathList(smc, vv);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return videoList;
	}
	@Override
	public List<VideoVO> selectPrimiumVideoPathList(VideoVO vv) {
		List<VideoVO> videoList = new ArrayList<>();
		
		try {
			videoList = videoDao.selectPrimiumVideoPathList(smc, vv);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return videoList;
	}
	
	
}

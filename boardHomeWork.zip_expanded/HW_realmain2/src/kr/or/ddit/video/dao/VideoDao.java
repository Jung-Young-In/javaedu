package kr.or.ddit.video.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.video.vo.VideoVO;
public class VideoDao implements IVideoDao{
	private static IVideoDao videoDao;
	
	private VideoDao() {
		
	}
	
	public static IVideoDao getInstance() {
		if(videoDao == null) {
			videoDao = new VideoDao();
		}
		
		return videoDao;
	}

	@Override
	public List<VideoVO> selectVideoPathList(SqlMapClient smc, VideoVO vv) throws SQLException {
		List<VideoVO> videoPathList = smc.queryForList("video.selectVideoPathList", vv);
		
		return videoPathList;
	}
	
	@Override
	public List<VideoVO> selectPrimiumVideoPathList(SqlMapClient smc, VideoVO vv) throws SQLException {
		List<VideoVO> videoPathList = smc.queryForList("video.selectPrimiumVideoPathList", vv);
		
		return videoPathList;
	}
	
}

	
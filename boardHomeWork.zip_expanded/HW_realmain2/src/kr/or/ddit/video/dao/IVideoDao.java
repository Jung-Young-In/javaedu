package kr.or.ddit.video.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.video.vo.VideoVO;

public interface IVideoDao {
	public List<VideoVO> selectVideoPathList(SqlMapClient smc, VideoVO vv) throws SQLException;
	
	public List<VideoVO> selectPrimiumVideoPathList(SqlMapClient smc, VideoVO vv) throws SQLException;
}

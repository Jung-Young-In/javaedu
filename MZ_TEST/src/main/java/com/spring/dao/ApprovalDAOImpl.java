package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteria;
import com.spring.dto.ApprovalVO;

public class ApprovalDAOImpl implements ApprovalDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApprovalVO> selectSearchApprovalList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectSearchApprovalList", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public List<ApprovalVO> selectSearchApprovalByCategory(SearchCriteria cri, ApprovalVO approval) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ApprovalVO> approvalList = session.selectList("Approval-Mapper.selectSearchApprovalByCategory", cri, rowBounds);
		
		return approvalList;
	}

	@Override
	public int selectSearchApprovalListCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("Approval-Mapper.selectSearchApprovalListCount", cri);
		
		return count;
	}

	@Override
	public ApprovalVO selectApprovalByAppNo(String appNo) throws SQLException {
		
		ApprovalVO approval = session.selectOne("Approval-Mapper.selectApprovalByAppNo", appNo);
		
		return approval;
	}

	@Override
	public ApprovalVO selectApprovalByFileName(String FileName) throws SQLException {

		ApprovalVO approval = session.selectOne("Approval-Mapper.selectApprovalByFileName", FileName);
		
		return approval;
	}

	@Override
	public String selectApprovalSequenceNextValue() throws SQLException {

		String seq_num = session.selectOne("Approval-Mapper.selectApprovalSequenceNextValue");
		
		return seq_num;
	}

	@Override
	public void insertApproval(ApprovalVO approval) throws SQLException {

		session.update("Approval-Mapper.insertApproval", approval);
	}

	@Override
	public void updateApproval(ApprovalVO approval) throws SQLException {

		session.update("Approval-Mapper.updateApproval", approval);
	}

	@Override
	public void deleteApproval(String appNo) throws SQLException {

		session.update("Approval-Mapper.deleteApproval", appNo);
	}
}

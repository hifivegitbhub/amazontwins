package com.teamproject.amazontwins.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.teamproject.amazontwins.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO selectTestMember() throws DataAccessException {
		MemberVO member = (MemberVO)sqlSession.selectOne("mapper.member.selectTestMember");
		return member;
	}

}

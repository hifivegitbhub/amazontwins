package com.teamproject.amazontwins.member.dao;

import org.springframework.dao.DataAccessException;

import com.teamproject.amazontwins.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO selectTestMember() throws DataAccessException;
}

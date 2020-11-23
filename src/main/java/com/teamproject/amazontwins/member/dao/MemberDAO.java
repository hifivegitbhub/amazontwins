package com.teamproject.amazontwins.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.teamproject.amazontwins.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
}

package com.teamproject.amazontwins.member.service;

import java.util.Map;

import com.teamproject.amazontwins.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map loginMap) throws Exception;
	public String overlapped(String id) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
}

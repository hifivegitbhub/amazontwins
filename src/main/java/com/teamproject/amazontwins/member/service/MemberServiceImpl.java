package com.teamproject.amazontwins.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.amazontwins.member.dao.MemberDAO;
import com.teamproject.amazontwins.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO selectTestMember() throws Exception {
		return memberDAO.selectTestMember();
	}

}

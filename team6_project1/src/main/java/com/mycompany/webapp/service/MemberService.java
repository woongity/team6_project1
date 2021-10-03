package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.Member;

@Service
public class MemberService {
	@Resource
	private MemberDao memberDao;

	public List<Member> selectByMid(String mid){
		return memberDao.selectByMid(mid);
	}
}

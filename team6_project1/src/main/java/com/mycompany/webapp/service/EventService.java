package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.EventDao;

@Service
public class EventService {
	@Resource private EventDao eventDao;
	public int selectCount(String ecode) {
		return eventDao.selectCount(ecode);
	}
	public void decrementCount() {
		// 임의로 이벤트 코드를 1로 지정함
		eventDao.decrementCount();
	}
}

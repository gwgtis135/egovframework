package egovframework.join.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.join.service.JoinMapper;
import egovframework.join.service.JoinService;
import egovframework.join.service.JoinVO;

@Service
public class joinServiceImpl implements JoinService {

	@Autowired JoinMapper joinMapper;
	
	@Override
	public int joinInsert(JoinVO joinVO)  {
		System.out.println("서비스");
		System.out.println(joinVO.toString());
		return joinMapper.joinInsert(joinVO);
	}

}

package egovframework.join.service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("JoinMapper")
public interface JoinMapper {

	int joinInsert(JoinVO joinVO);
}

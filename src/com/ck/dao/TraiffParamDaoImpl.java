package com.ck.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.TraiffParam;

public class TraiffParamDaoImpl extends SqlSessionDaoSupport implements TraiffParamDao {

	@Override
	public TraiffParam selectTraiffParam() {
		String statement="com.ck.Mapper.TraiffParam.selectTraiffParam";
		return getSqlSession().selectOne(statement);
	}

}

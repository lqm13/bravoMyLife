package kr.co.bravomylife.front.common.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BaseDao {
	
	@Inject
	protected SqlSession sqlSessionFront;
	
	
	public SqlSession getSqlSessionFront() {
		return sqlSessionFront;
	}
	public void setSqlSessionFront(SqlSession sqlSessionFront) {
		this.sqlSessionFront = sqlSessionFront;
	}
}

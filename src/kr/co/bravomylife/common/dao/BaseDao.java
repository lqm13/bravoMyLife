package kr.co.bravomylife.common.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BaseDao {
	
	@Inject
	protected SqlSession sqlSessionCommon;
	
	
	public SqlSession getSqlSessionCommon() {
		return sqlSessionCommon;
	}
	public void setSqlSessionCommon(SqlSession sqlSessionCommon) {
		this.sqlSessionCommon = sqlSessionCommon;
	}
}

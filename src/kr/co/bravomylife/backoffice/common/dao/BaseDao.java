package kr.co.bravomylife.backoffice.common.dao;

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
	protected SqlSession sqlSessionBackoffice;
	
	
	public SqlSession getSqlSessionBackoffice() {
		return sqlSessionBackoffice;
	}
	public void setSqlSessionBackoffice(SqlSession sqlSessionBackoffice) {
		this.sqlSessionBackoffice = sqlSessionBackoffice;
	}
}


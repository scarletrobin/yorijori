package kr.or.mlikit.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MilkitDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}

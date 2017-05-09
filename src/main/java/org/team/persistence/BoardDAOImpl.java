package org.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.team.domain.BoardVO;
import org.team.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	static final String namespace = "org.team.mappers.boardMapper";
	
	@Inject
	SqlSession ses;
	
	
	@Override
	public void create(BoardVO vo) throws Exception {
		ses.selectOne(namespace + ".create", vo);

	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace + ".read", bno);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		ses.selectOne(namespace + ".delete" , bno);
		
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		ses.selectOne(namespace + ".update", vo);
	}

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(namespace + ".list",cri);
	}
	
	

}

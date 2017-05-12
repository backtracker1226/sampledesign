package org.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.team.domain.BoardVO;
import org.team.domain.Criteria;
import org.team.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO dao;

	@Override
	public void register(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);
		

	}

	@Override
	public BoardVO findByBno(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);

	}

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(cri);
	}

	@Override
	public Integer getCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getCount(cri);
	}

}

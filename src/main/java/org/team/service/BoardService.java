package org.team.service;

import java.util.List;

import org.team.domain.BoardVO;
import org.team.domain.Criteria;


public interface BoardService {
	
	// register<새글쓰기>, modify<수정>, findByBno<조회>, remove<삭제> 
	
/*	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Integer bno)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BoardVO> list(BoardVO vo)throws Exception;*/
	
	public void register(BoardVO vo)throws Exception;
	
	public BoardVO findByBno(Integer bno)throws Exception;
	
	public void modify(BoardVO vo)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<BoardVO> list(Criteria cri)throws Exception;
	
	public Integer getCount(Criteria cri)throws Exception;
	

}

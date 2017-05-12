package org.team.persistence;

import java.util.List;

import org.team.domain.BoardVO;
import org.team.domain.Criteria;

public interface BoardDAO {
	
	//CRUD + list
	//create, read, update, delete, list
	
	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(Integer bno)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BoardVO> list(Criteria cri)throws Exception;
	
	public Integer getCount(Criteria cri)throws Exception;

	
	
}

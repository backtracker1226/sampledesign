package org.team.web;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.team.domain.BoardVO;
import org.team.domain.Criteria;
import org.team.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
@WebAppConfiguration
public class allTest {
	
	@Inject
	DataSource ds;
	
	@Inject
	BoardDAO dao;
	
	@Test
	public void conTest(){
		
		Connection con;
		try {
			con = ds.getConnection();
			System.out.println(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	@Test
	public void createTest()throws Exception{
		BoardVO vo = new BoardVO();
		
		vo.setTitle("자바에서 보낸 제목4");
		vo.setContent("자바에서 보낸 내4용");
		vo.setWriter("자바4");
		dao.create(vo);
	}
	
	@Test
	public void read(){
		try {
			dao.read(3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void del(){
		try {
			dao.delete(3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void update()throws Exception{
		
		BoardVO vo = new BoardVO();
		vo.setBno(3);
		vo.setTitle("제목123123");
		vo.setContent("자바내용");
		dao.update(vo);
		
	}
	
	@Test
	public void listpage()throws Exception{
		
		Criteria cri = new Criteria();
		
		cri.setPage(2);
		cri.setPerPageNum(10);
		dao.list(cri);
	}
	
	
	

}

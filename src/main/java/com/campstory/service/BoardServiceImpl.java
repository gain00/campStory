package com.campstory.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.campstory.bean.BoardDTO;
import com.campstory.bean.BoardpageDTO;
import com.campstory.mybatis.BoardMapper;



@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public int count() {
		return mapper.getArticleCount();
	}
	
	@Override
	public int getSearchlistCount() {
		return mapper.getSearchlistCount();
	}
	
	@Override
	public List<BoardDTO> getList(int startRow, int endRow, String searchType,
			String keyword) throws Exception {
		return mapper.getArticles(startRow, endRow,searchType,keyword);
	}
	

	
	@Override
	public int maxNum() {
		return mapper.maxNum();
	}

	@Override
	public BoardDTO getArticle(int num_tip) {
		return mapper.getArticle(num_tip);
	}
	@Override
	public BoardDTO camp_tip2(int num_tip) {
		return mapper.camp_tip2(num_tip);
	}
	
	
	@Override
	public void readcountUpdate(int num_tip) {
		mapper.readcountUpdate(num_tip);
		
	}
	@Override
	public int insert(BoardDTO dto) throws Exception {
		
		return mapper.insert(dto);
	}
	

	@Override
	public int update(BoardDTO dto) throws Exception {
		
		return mapper.update(dto);
	}

	// 게시물 삭제
	@Override
	public int delete(int num_tip) throws Exception {
		
		return mapper.delete(num_tip);
	}
	


}

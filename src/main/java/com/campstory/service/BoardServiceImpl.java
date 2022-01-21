package com.campstory.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.campstory.bean.BoardDTO;
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
	public List<BoardDTO> getList(int startRow, int endRow) {
		return mapper.getArticles(startRow, endRow);
	}
	@Override
	public int maxNum() {
		return mapper.maxNum();
	}

	@Override
	public BoardDTO getArticle(int num_tip) {
		return mapper.getArticle(num_tip);
	}


}

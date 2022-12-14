package com.shop.myapp;


import static org.assertj.core.api.Assertions.assertThat;


import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.shop.myapp.dto.BoardRequestDto;
import com.shop.myapp.entity.Board;
import com.shop.myapp.repository.BoardRepository;

@SpringBootTest
class BoardTests {
	@Autowired
	BoardRepository boardRepository;

	@Test
	void save() {
		Board params = Board.builder()
				.title("테스트 제목")
				.content("테스트 내용")
				.writer("작성자")
				.hits(0)
				.deleteYn('N')
				.build();
		boardRepository.save(params);
	}
	
	
	@Test
	void update(final Long id, BoardRequestDto params) {
		Board entity = boardRepository.findById(id).orElseThrow();
		entity.update(params.getTitle(), params.getContent(), params.getWriter());
	}
	
	@Test
	void loadingData() {
		Board entity = boardRepository.findById((long) 2).get();
		assertThat(entity.getTitle()).isEqualTo("1번 게시글 테스트 제목");
		assertThat(entity.getContent()).isEqualTo("1번 게시글 테스트 내용");
		assertThat(entity.getWriter()).isEqualTo("작성자");
		
	}
	
	@Test
	void findAll() {
		long boardsCount = boardRepository.count();
		List<Board> boards = boardRepository.findAll();
	}
	
	@Test
	void delete() {
		Board entity = boardRepository.findById((long) 2).get();
		boardRepository.delete(entity);
	}
}

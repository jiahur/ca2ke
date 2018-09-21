package category.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import category.bean.CategoryDTO;

@Repository
public class CategoryDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	public int insert(CategoryDTO dto) {
		return session.insert("mybatis.categoryMapper.insert", dto);
	}
	
	public int update(CategoryDTO dto) {
		return session.update("mybatis.categoryMapper.update", dto);
	}
	
	public List<CategoryDTO> getAllCategory() {
		System.out.println("hello");
		return session.selectList("mybatis.categoryMapper.getAll");
	}
}

package item.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import item.bean.ItemDTO;
@Repository
public class ItemDAO {
	@Autowired	
	private SqlSessionTemplate sqlSession;

	public List<ItemDTO> itemList(int i_category) {
		return sqlSession.selectList("mybatis.item.itemList", i_category);
	
	}
	
	public int getTotalA(int i_category) {
		System.out.println(i_category); 
		return sqlSession.selectOne("mybatis.item.getTotalA", i_category); 

	}

	public int itemAdd(ItemDTO itemDTO) {
		return sqlSession.insert("mybatis.item.itemAdd", itemDTO);
	}
}

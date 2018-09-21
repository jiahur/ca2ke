package item.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import item.bean.ItemDTO;
import item.dao.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	ItemDAO dao;

	public List<ItemDTO> itemList(int i_category) {
		return dao.itemList(i_category);
	}

	public int getTotalA(int i_category) {
		return dao.getTotalA(i_category);
	}

	@Override
	public int itemAdd(ItemDTO itemDTO) {
		return dao.itemAdd(itemDTO);
	}

}

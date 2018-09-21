package item.controller;

import java.util.ArrayList;
import java.util.List;

import item.bean.ItemDTO;

public interface ItemService {
	public List<ItemDTO> itemList(int i_category);

	public int getTotalA(int i_category);

	public int itemAdd(ItemDTO itemDTO);
}

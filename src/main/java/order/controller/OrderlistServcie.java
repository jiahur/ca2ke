package order.controller;

import java.util.List;

import cart.bean.CartInDTO;
import order.bean.OrderlistInDTO;
import order.bean.OrderlistListDTO;

public interface OrderlistServcie {
	
	int addOrderlist1(OrderlistInDTO orderlistInDTO);
	
	int addOrderlist2(CartInDTO cartInDTO);
	
	int updateStatus(int o_status, int o_num);
	
	int cancelOrder();
	
	int pickup (int o_num);
	
	List<OrderlistListDTO> listOrderlist();
	
	OrderlistListDTO orderlist_cart (int cart_num);
	
	List<OrderlistListDTO> orderlist_id(String m_id);
	
	List<OrderlistListDTO> orderlist_date(String startDate, String endDate);
	
	List<OrderlistListDTO> orderlist_category(int i_category);

	List<OrderlistListDTO> orderlist_item(int item_num);
	
}

package order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.bean.CartInDTO;
import order.bean.OrderlistInDTO;
import order.bean.OrderlistListDTO;
import order.dao.OrderlistDAO;

@Service
public class OrderlistServiceImpl implements OrderlistServcie{

	@Autowired
	private OrderlistDAO orderlistDAO;

	@Override
	public int addOrderlist1(OrderlistInDTO orderlistInDTO) {
		return orderlistDAO.addOrderlist1(orderlistInDTO);
	}

	@Override
	public int addOrderlist2(CartInDTO cartInDTO) {
		return orderlistDAO.addOrderlist2(cartInDTO);
	}

	@Override
	public int updateStatus(int o_status, int o_num) {
		return orderlistDAO.updateStatus(o_status, o_num);
	}

	@Override
	public int cancelOrder() {
		return orderlistDAO.cancleOrder();
	}

	@Override
	public int pickup(int o_num) {
		return orderlistDAO.pickup(o_num);
	}
	
	@Override
	public List<OrderlistListDTO> listOrderlist() {
		return orderlistDAO.listOrderlist();
	}

	@Override
	public List<OrderlistListDTO> orderlist_id(String m_id) {
		return orderlistDAO.orderlist_id(m_id);
	}

	@Override
	public List<OrderlistListDTO> orderlist_date(String startDate, String endDate) {
		return orderlistDAO.orderlist_date(startDate, endDate);
	}

	@Override
	public List<OrderlistListDTO> orderlist_category(int i_category) {
		return orderlistDAO.orderlist_category(i_category);
	}

	@Override
	public List<OrderlistListDTO> orderlist_item(int item_num) {
		return orderlistDAO.orderlist_item(item_num);
	}

	@Override
	public OrderlistListDTO orderlist_cart(int cart_num) {
		return orderlistDAO.orderlist_cart(cart_num);
	}

}

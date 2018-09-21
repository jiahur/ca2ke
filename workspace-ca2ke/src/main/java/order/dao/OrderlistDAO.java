package order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.bean.CartInDTO;
import order.bean.OrderlistInDTO;
import order.bean.OrderlistListDTO;

@Repository
public class OrderlistDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	//오더리스트 추가 1
	public int addOrderlist1(OrderlistInDTO orderlistInDTO) {
		return sqlsession.insert("mybatis.orderlistMapper.addOrderlist1", orderlistInDTO);
	}
	
	//오더리스트 추가 2
	public int addOrderlist2(CartInDTO cartInDTO) {
		return sqlsession.update("mybatis.orderlistMapper.addOrderlist2", cartInDTO);
	}
	
	
	
	//준비현황 업데이트
	public int updateStatus(int o_status, int o_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("o_status", o_status);
		map.put("o_num", o_num);
		return sqlsession.update("mybatis.orderlistMapper.updateStatus", map);
	}
	
	//주문 취소 시 아이템 수량 & 총액을 0으로 변경 - 주문현황코드를 0으로 변경한 후 실행할 것
	public int cancleOrder() {
		return sqlsession.update("mybatis.orderlistMapper.cancelOrder");
	}
	
	//실제 픽업시간 업데이트
	public int pickup(int o_num) {
		return sqlsession.update("mybatis.orderlistMapper.pickup", o_num);
	}
	
	
	//오더리스트 전체 목록 가져오기
	public List<OrderlistListDTO> listOrderlist(){
		return sqlsession.selectList("mybatis.orderlistMapper.listOrderlist");
	}
	
	//오더리스트 목록 가져오기 - 장바구니# 기준
	public OrderlistListDTO orderlist_cart (int cart_num) {
		return sqlsession.selectOne("mybatis.orderlistMapper.orderlist_cart",cart_num);
	}
	
	//오더리스트 목록 가져오기 - 특정 아이디 기준
	public List<OrderlistListDTO> orderlist_id(String m_id){
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_id", m_id);
	}
	
	//오더리스트 목록 가져오기 - 특정 기간 기준
	public List<OrderlistListDTO> orderlist_date(String startDate, String endDate){
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_date", map);
	}
	
	//오더리스트 목록 가져오기 - 특정 카테고리 기준
	public List<OrderlistListDTO> orderlist_category(int i_category){
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_category", i_category);
	}
	
	//오더리스트 목록 가져오기 - 특정 아이템 기준
	public List<OrderlistListDTO> orderlist_item(int item_num){
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_item", item_num);
	}
}

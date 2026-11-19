package DAO;

import java.util.List;

import entity.Book_order;

public interface OrderDAO {

	public int getOrderNo();
	
	public boolean saveOrder(List<Book_order> blist);
	
	public List <Book_order> getAllOrder();
	
}

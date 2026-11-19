package DAO;

import java.util.List;

import entity.BookDtls;
import entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userid);
	
	boolean deleteBook(int cid);
	
	public boolean deleteCartByUserId(int uid);
	
}

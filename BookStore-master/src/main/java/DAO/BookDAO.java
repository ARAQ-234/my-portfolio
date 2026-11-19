package DAO;

import java.util.ArrayList;
import java.util.List;

import entity.BookDtls;

public interface BookDAO {
	
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBook();
	
	public List<BookDtls> getOldBook();
	
	public List<BookDtls> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email, String category, int id);
	
}

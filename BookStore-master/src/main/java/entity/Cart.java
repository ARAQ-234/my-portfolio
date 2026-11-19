package entity;

public class Cart {
	
	
    private int cid;        // Cart ID
    private int bid;        // Book ID
    private int uid;        // User ID
    private String bookName;
    private String author;
    private Double price;
    private Double totalPrice;

    // Default Constructor
    public Cart() {
        super();
    }

    // Getters and Setters
    public int getCid() { return cid; }
    public void setCid(int cid) { this.cid = cid; }

    public int getBid() { return bid; }
    public void setBid(int bid) { this.bid = bid; }

    public int getUid() { return uid; }
    public void setUid(int uid) { this.uid = uid; }

    public String getBookName() { return bookName; }
    public void setBookName(String bookName) { this.bookName = bookName; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public Double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(Double totalPrice) { this.totalPrice = totalPrice; }
}

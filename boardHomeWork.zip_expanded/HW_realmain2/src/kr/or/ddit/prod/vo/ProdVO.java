package kr.or.ddit.prod.vo;

public class ProdVO {
	private String prodNum;
	private String prodCategori;
	private String prodName;
	private String prodChoice;
	private int prodRemianQty;
	private String prodSell;
	private int prodPrice;
	private int prodMemberPrice;
	private String prodImgPath;
	private String prodDetailInfo;
	private long atchFileId = -1;
	
	
	public String getProdCategori() {
		return prodCategori;
	}
	public void setProdCategori(String prodCategori) {
		this.prodCategori = prodCategori;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId2) {
		// TODO Auto-generated method stub
		
	}
	public String getProdNum() {
		return prodNum;
	}
	public void setProdNum(String prodNum) {
		this.prodNum = prodNum;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdChoice() {
		return prodChoice;
	}
	public void setProdChoice(String prodChoice) {
		this.prodChoice = prodChoice;
	}
	public int getProdRemianQty() {
		return prodRemianQty;
	}
	public void setProdRemianQty(int prodRemianQty) {
		this.prodRemianQty = prodRemianQty;
	}
	public String getProdSell() {
		return prodSell;
	}
	public void setProdSell(String prodSell) {
		this.prodSell = prodSell;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public int getProdMemberPrice() {
		return prodMemberPrice;
	}
	public void setProdMemberPrice(int prodMemberPrice) {
		this.prodMemberPrice = prodMemberPrice;
	}
	public String getProdImgPath() {
		return prodImgPath;
	}
	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}
	public String getProdDetailInfo() {
		return prodDetailInfo;
	}
	public void setProdDetailInfo(String prodDetailInfo) {
		this.prodDetailInfo = prodDetailInfo;
	}
	
	
}

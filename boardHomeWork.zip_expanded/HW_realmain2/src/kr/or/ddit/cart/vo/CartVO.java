package kr.or.ddit.cart.vo;

public class CartVO {

		private String cartNum;
		private String memId;
		private long cartQty;
		private long cartOrder;
		private String prodNum;
		private String prodName;
		private long prodPrice;
		private long prodMemberPrice;
		private String prodImgPath;
		
		
		
		public String getCartNum() {
			return cartNum;
		}
		public void setCartNum(String cartNum) {
			this.cartNum = cartNum;
		}
		public String getMemId() {
			return memId;
		}
		public void setMemId(String memId) {
			this.memId = memId;
		}
		public long getCartQty() {
			return cartQty;
		}
		public void setCartQty(long cartQty) {
			this.cartQty = cartQty;
		}
		public long getCartOrder() {
			return cartOrder;
		}
		public void setCartOrder(long cartOrder) {
			this.cartOrder = cartOrder;
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
		public long getProdPrice() {
			return prodPrice;
		}
		public void setProdPrice(long prodPrice) {
			this.prodPrice = prodPrice;
		}
		public long getProdMemberPrice() {
			return prodMemberPrice;
		}
		public void setProdMemberPrice(long prodMemberPrice) {
			this.prodMemberPrice = prodMemberPrice;
		}
		public String getProdImgPath() {
			return prodImgPath;
		}
		public void setProdImgPath(String prodImgPath) {
			this.prodImgPath = prodImgPath;
		}
	
	
}

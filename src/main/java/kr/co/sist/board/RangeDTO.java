package kr.co.sist.board;

public class RangeDTO {

	private int startNum, endNum;
	private int totalPage = 0;
	private int currentPage = 1;
	private String field, fieldStr, keyword, url;

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFieldStr() {
		String[] fieldTitle = { "title", "content", "id" };
		int tempField = Integer.parseInt(field);

		if (!(tempField > 0 && tempField < 4)) { // 1~3 사이가 아닌 경우
			tempField = 1;
		} // end if

		fieldStr = fieldTitle[Integer.parseInt(field) - 1];

		return fieldStr;
	}// getFieldStr

	@Override
	public String toString() {
		return "RangeDTO [startNum=" + startNum + ", endNum=" + endNum + ", totalPage=" + totalPage + ", currentPage="
				+ currentPage + ", field=" + field + ", fieldStr=" + fieldStr + ", keyword=" + keyword + ", url=" + url
				+ "]";
	}

}// class

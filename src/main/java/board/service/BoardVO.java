package board.service;

public class BoardVO {

    private Integer boardNo;
    private String title;
    private String content;
    private String userNo;
    private String regDttm;
    private String regDt;
    private String modDttm;
    private int viewCnt;
    private int parentNo;
    private int groupNo;
    private int depth;
    private int sortNo;
    private String useYn;

    private String nickname;
    private String userId;

    private int totalCnt; // 총 게시글 수
    private int perPage; // 한 페이지에 보여 줄 게시글 수
    private int totalPage; // 총 페이지 수
    private int currentPage; // 현재 페이지
    private int offset; // 건너뛸 게시글 수

    private String searchCategory;
    private String searchKeyword;

    public Integer getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(Integer boardNo) {
        this.boardNo = boardNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getRegDttm() {
        return regDttm;
    }

    public void setRegDttm(String regDttm) {
        this.regDttm = regDttm;
    }

    public String getModDttm() {
        return modDttm;
    }

    public void setModDttm(String modDttm) {
        this.modDttm = modDttm;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public int getParentNo() {
        return parentNo;
    }

    public void setParentNo(int parentNo) {
        this.parentNo = parentNo;
    }

    public int getGroupNo() {
        return groupNo;
    }

    public void setGroupNo(int groupNo) {
        this.groupNo = groupNo;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getSortNo() {
        return sortNo;
    }

    public void setSortNo(int sortNo) {
        this.sortNo = sortNo;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getNickname() {
        return nickname;
    }

    public String getUserId() {
        return userId;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRegDt() {
        return regDt;
    }

    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getPerPage() {
        return perPage;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
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

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public String getSearchCategory() {
        return searchCategory;
    }

    public void setSearchCategory(String searchCategory) {
        this.searchCategory = searchCategory;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "boardNo=" + boardNo +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", userNo='" + userNo + '\'' +
                ", regDttm='" + regDttm + '\'' +
                ", regDt='" + regDt + '\'' +
                ", modDttm='" + modDttm + '\'' +
                ", viewCnt=" + viewCnt +
                ", parentNo=" + parentNo +
                ", groupNo=" + groupNo +
                ", depth=" + depth +
                ", sortNo=" + sortNo +
                ", useYn='" + useYn + '\'' +
                ", nickname='" + nickname + '\'' +
                ", userId='" + userId + '\'' +
                ", totalCnt=" + totalCnt +
                ", perPage=" + perPage +
                ", totalPage=" + totalPage +
                ", currentPage=" + currentPage +
                ", offset=" + offset +
                ", searchKeyword='" + searchKeyword + '\'' +
                ", searchCategory='" + searchCategory + '\'' +
                '}';
    }
}

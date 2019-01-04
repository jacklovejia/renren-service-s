package io.renren.common.utils;

/**
 *  自定义mybatis 拦截器专用分页
 */
public class MyPage {
    /**
     * 总数
     */
    private int totalCount;
    /**
     * 当前页
     */
    private int currentPage;
    /**
     * 总页数
     */
    private int totalPage;
    /**
     * limit 参数 从哪开始
     */
    private int dbIndex;
    /**
     * limit 参数 读多少条
     */
    private int dbNumber;
    /**
     * 每页条数
     */
    private int pageNumber = 10;

    public void count(){
        int totalPageTemp = this.totalCount/this.pageNumber;
        int plus = (this.totalCount % this.pageNumber) == 0? 0 :1 ;
        totalPageTemp = totalPageTemp + plus;
        if(totalPageTemp <= 0){
            totalPageTemp = 1;
        }
        this.totalPage = totalPageTemp;
        // 设置当前页数
        // 总页数小于当前页数, 应将当前页数设置为总页数
        if(this.totalPage < this.currentPage){
            this.currentPage = this.totalPage;
        }
        // 当前页数小于1设置为1
        if(this.currentPage < 1){
            this.currentPage = 1;
        }
        // 设置 limi 参数
        this.dbIndex = (this.currentPage -1)*this.pageNumber;
        this.dbNumber = this.pageNumber;
    }
    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        this.count();
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getDbIndex() {
        return dbIndex;
    }

    public void setDbIndex(int dbIndex) {
        this.dbIndex = dbIndex;
    }

    public int getDbNumber() {
        return dbNumber;
    }

    public void setDbNumber(int dbNumber) {
        this.dbNumber = dbNumber;
    }
}

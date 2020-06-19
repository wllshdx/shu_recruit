package com.common;

import lombok.Data;

import java.io.Serializable;

@Data
public class Page implements Serializable {

    private static final long serialVersionUID = 1L;

    private int currentPage;
    private int pageSize = 8;
    private int totalPage;
    private int totalRows;
    private int startIndex;
    private int endIndex;

    public void setCurrentPage(int currentPage) {
        if (currentPage < 1) {
            this.currentPage = 1;
        } else if (currentPage > getTotalPage()) {
            this.currentPage = this.totalPage;
        } else {
            this.currentPage = currentPage;
        }
        this.startIndex = (this.currentPage - 1) * this.pageSize;
        this.endIndex = this.currentPage * this.pageSize;
    }

    public int getTotalPage() {
        if (this.totalRows % this.pageSize == 0) {
            this.totalPage = this.totalRows / this.pageSize;
        } else {
            this.totalPage = this.totalRows / this.pageSize + 1;
        }
        return totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(int endIndex) {
        this.endIndex = endIndex;
    }
}

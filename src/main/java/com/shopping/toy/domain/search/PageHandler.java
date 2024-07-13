package com.shopping.toy.domain.search;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageHandler {

    private SearchCondition sc;
    private int totalCnt;
    private int naviSize = 10;  // 페이지 내비게이션의 크기
    private int totalPage; // 전체 페이지의 수
    private int beginPage; // 내비게이션의 첫 번째 페이지
    private int endPage; // 내비게이션의 마지막 페이지
    private boolean showPrev; // 이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
    private boolean showNext; // 다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    public PageHandler(int totalCnt, SearchCondition sc) {
        this.totalCnt = totalCnt;
        this.sc = sc;

        doPaging(totalCnt, sc);
    }

    public void doPaging(int totalCnt, SearchCondition sc) {
        this.totalCnt = totalCnt;

        totalPage = (int)Math.ceil(totalCnt / (double)sc.getPageSize());
        beginPage = (sc.getPage()-1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage-1 + naviSize, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    public void print() {
        System.out.println(showPrev ? "[PREV] " : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.println(i+" ");
        }
        System.out.println(showNext ? " [NEXT]" : "");
    }
}

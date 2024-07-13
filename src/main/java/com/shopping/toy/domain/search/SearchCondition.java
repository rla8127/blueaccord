package com.shopping.toy.domain.search;

import com.shopping.toy.constant.Category;
import lombok.*;
import org.springframework.web.util.UriComponentsBuilder;

/*
option과 keyword는 페이징 처리에 관여하니, page, pageSize, option, keyword
를 SearchCondition이라는 Domain에 관리함으로써

1. 한 군데에서 페이징 처리를 하는 옵션들을 관리
2. SearchConditon만 매개변수로 넘겨주면, Mapper, Service, Controller 등에서
사용이 용이하기에 한 군데에서 관리 (=> 메소드를 더 쉽게 사용할 수 있게 됨.)
3. UriComponentsBuilder 메소드를 통해 한 번에 쿼리스트링 URI를 넘겨 줄 수 있음.

따라서, SearchCondition과 PageHandler를 분리해서 사용가능하지만,
다음과 같은 이유로 page와 pageSize를 해당 도메인에서 처리하였음.
*/

@Data
public class SearchCondition {

    private int page = 1;
    private int pageSize = 10;
    private Category category;
    private String option = "";
    private String sort_option = "";
    private String keyword = "";

    public SearchCondition(){}

    public SearchCondition(Integer page, Integer pageSize, String keyword, String option) {
        this.option = option;
        this.keyword = keyword;
        this.page = page;
        this.pageSize = pageSize;
    }

    public String getQueryString(Integer page) {
        // UriComponentsBuilder의 인스턴스를 생성하여 URI를 쉽게 빌드
        // .queryParam("key", value) 형태로 작성
        // jsp 파일 내의 JSTL에서 해당 메서드 사용
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("keyword", keyword)
                .queryParam("option", option)
                .queryParam("sort_option", sort_option)
                .queryParam("category", category)
                .build().toString();
    }

    public String getQueryString() {
        return getQueryString(page);
    }

    public int getOffset() {
        return (page-1)*pageSize;
    }


}

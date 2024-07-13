package com.shopping.toy.dao.helpful;

import com.shopping.toy.domain.helpful.HelpfulDto;

public interface HelpfulDao {
    boolean hasMarkedHelpful(HelpfulDto helpfulDto) throws Exception;

    int insert(HelpfulDto helpfulDto) throws Exception;

    int delete(HelpfulDto helpfulDto) throws Exception;
}

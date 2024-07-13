package com.shopping.toy.controller.item;

import com.shopping.toy.constant.Category;
import com.shopping.toy.domain.item.CategoryItemDto;
import com.shopping.toy.domain.search.PageHandler;
import com.shopping.toy.domain.search.SearchCondition;
import com.shopping.toy.service.item.ItemImgService;
import com.shopping.toy.service.item.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("category")
public class CategoryController {

    private final ItemService itemService;
    private final ItemImgService itemImgService;

    @GetMapping
    public String getCatgoryPage(SearchCondition sc, Category category, Model m){
        try {
            sc.setPageSize(12);
            List<CategoryItemDto> categoryItems = itemService.getCategoryItems(sc);
            m.addAttribute("category", category);
            m.addAttribute("categoryItems", categoryItems);

            if(category != Category.BEST){
                int totalCnt = itemService.searchResultCnt(sc);
                PageHandler ph = new PageHandler(totalCnt, sc);
                m.addAttribute("totalCnt", totalCnt);
                m.addAttribute("ph", ph);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "category/list";
    }
}

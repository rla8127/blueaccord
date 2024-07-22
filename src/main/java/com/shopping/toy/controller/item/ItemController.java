package com.shopping.toy.controller.item;

import com.shopping.toy.domain.item.CategoryItemDto;
import com.shopping.toy.domain.item.ItemDto;
import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;
import com.shopping.toy.domain.search.PageHandler;
import com.shopping.toy.domain.search.SearchCondition;
import com.shopping.toy.service.item.ItemImgService;
import com.shopping.toy.service.item.ItemService;
import com.shopping.toy.service.review.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {

    private final ItemService itemService;
    private final ItemImgService itemImgService;
    private final ReviewService reviewService;

    @GetMapping
    public String item(HttpServletRequest request, Integer item_id, Model m){
        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");
            m.addAttribute("id", id);

            int maxCount = 0;
            ItemDto itemDto = itemService.read(item_id);

            List<ReviewDto> reviews = reviewService.getItemReview(item_id);
            double totalRating = reviewService.getRatingAverage(item_id);
            List<RatingCountDto> ratingCounts = reviewService.getRatingCounts(item_id);

            for(RatingCountDto ratingCount : ratingCounts){
                maxCount += ratingCount.getCount();
            }

            m.addAttribute(itemDto);
            m.addAttribute("reviews", reviews);
            m.addAttribute("totalRating", totalRating);
            m.addAttribute("ratingCounts", ratingCounts);
            m.addAttribute("maxCount", maxCount);

            List<String> imagePaths = itemImgService.getImagePathByItem_id(itemDto.getItem_id());
            m.addAttribute("imagePaths", imagePaths);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "item/item";
    }

    @GetMapping("/search")
    public String getSearchPage(SearchCondition sc, Model m){
        try {
            sc.setPageSize(12);
            List<CategoryItemDto> categoryItems = itemService.getSearchItems(sc);
            int totalCnt = itemService.searchResultCnt(sc);
            PageHandler ph = new PageHandler(totalCnt, sc);
            m.addAttribute("totalCnt", totalCnt);
            m.addAttribute("categoryItems", categoryItems);
            m.addAttribute("sc", sc);
            m.addAttribute("ph", ph);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "item/searchResult";
    }
}

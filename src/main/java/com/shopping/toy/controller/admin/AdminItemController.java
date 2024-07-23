package com.shopping.toy.controller.admin;

import com.shopping.toy.domain.item.ItemDto;
import com.shopping.toy.domain.item.ItemImgDto;
import com.shopping.toy.domain.search.PageHandler;
import com.shopping.toy.domain.search.SearchCondition;
import com.shopping.toy.service.item.ItemImgService;
import com.shopping.toy.service.item.ItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/item")
@RequiredArgsConstructor

/*
관리자가 수행하는 상품 CRUD 메서드
*/

public class AdminItemController {

    private final ItemService itemService;
    private final ItemImgService itemImgService;

    @GetMapping("/list")
    public String itemList(SearchCondition sc, Model m){
        try {
            int totalCnt = itemService.itemResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler ph = new PageHandler(totalCnt, sc);

            List<ItemDto> list = itemService.searchSelectPage(sc);

            m.addAttribute("list", list);
            m.addAttribute("ph", ph);

        } catch (Exception e) {
            e.printStackTrace();
            return "admin/item/error";
        }
        return "admin/itemList";
    }

    @GetMapping(value = "/read")
    public String itemRead(int item_id, Integer page, Integer pageSize, Model m){
        try {
            // 상품 데이터 전달
            ItemDto itemDto = itemService.read(item_id);
            m.addAttribute(itemDto);

            List<ItemImgDto> itemImgDtoList = itemImgService.getList(item_id);
            m.addAttribute(itemImgDtoList);

        } catch (Exception e) {
            e.printStackTrace();
            return "admin/item/error";
        }

        return "admin/item";
    }

    @PostMapping(value = "/write")
    public String itemWrite(@Valid ItemDto itemDto, BindingResult bindingResult, Model m, @RequestParam("itemImgFile")
    List<MultipartFile> itemImgFileList){

        if(bindingResult.hasErrors()){
            System.out.println("bindingResult = " + bindingResult);
            return "item/item";
        }

        //  && itemDto.getItem_id() == 0 이게 있어야 할 이유는 모르겠음 아직
        if(itemImgFileList.get(0).isEmpty()){
            System.out.println("size는" + itemImgFileList.size());
            m.addAttribute("errorMessage", "첫번째 상품 이미지는 필수 입력 값입니다.");
            return "item/item";
        }

        try {
            itemService.saveItem(itemDto, itemImgFileList);
        } catch (Exception e){
            System.out.println("itemImgFileList = " + itemImgFileList);
            m.addAttribute("errorMessage", "상품 등록 중 에러가 발생하였습니다.");
            return "admin/item/error";
        }

        return "redirect:/admin/item/list";
    }

    @PostMapping("/modify")
    public String modify(Integer page, Integer pageSize, ItemDto itemDto, @RequestParam("itemImgFile")
    List<MultipartFile> itemImgFileList, Model m) {
        try {
            int rowCnt = itemService.modify(itemDto, itemImgFileList);

            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            if(rowCnt!=1)
                throw new Exception("modify failed");

        } catch (Exception e) {
            e.printStackTrace();
            return "admin/item/error";
        }
        return "redirect:/admin/item/list";
    }

    @PostMapping("/delete")
    public String delete(Integer item_id, Integer page, Integer pageSize, Model m) {
        try {
            int rowCnt = itemService.remove(item_id);

            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            if(rowCnt!=1)
                throw new Exception("Remove failed");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/admin/item/list";
    }

    @GetMapping("/write")
    public String write(Model m){
        m.addAttribute("mode", "new");
        return "admin/item";
    }

    @DeleteMapping("/image/{item_img_no}")
    @ResponseBody public ResponseEntity<String> remove(@PathVariable Integer item_img_no){

        try {
            itemImgService.delete(item_img_no);
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }
}

package com.shopping.toy.service.item;

import com.shopping.toy.dao.item.ItemDao;
import com.shopping.toy.domain.item.CategoryItemDto;
import com.shopping.toy.domain.item.ItemDto;
import com.shopping.toy.domain.item.ItemImgDto;
import com.shopping.toy.domain.search.SearchCondition;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {

    private final ItemDao itemDao;
    private final ItemImgService itemImgService;

    @Override
    public long saveItem(ItemDto itemDto, List<MultipartFile> itemImgFileList) throws Exception{

        //상품 등록
        itemDao.insert(itemDto);

        // 이미지 등록
        for(int i=0; i<itemImgFileList.size(); i++){
            ItemImgDto itemImgDto = new ItemImgDto();
            itemImgDto.setItem_id(itemDto.getItem_id());
            if(i == 0)
                itemImgDto.setRepImgYn("Y");
            else
                itemImgDto.setRepImgYn("N");
            itemImgService.saveItemImg(itemImgDto, itemImgFileList.get(i));
        }

        return itemDto.getItem_id();
    }

    // 상품의 총 개수
    @Override
    public int getCount() throws Exception {
        return itemDao.count();
    }

    // 상품 작성
    @Override
    public int write(ItemDto itemDto) throws Exception {
        return itemDao.insert(itemDto);
    }

    @Override
    public List<CategoryItemDto> getCategoryItems(SearchCondition sc) throws Exception{
        return itemDao.getCategoryItems(sc);
    }

    @Override
    public List<CategoryItemDto> getSearchItems(SearchCondition sc) throws Exception{
        return itemDao.getSearchItems(sc);
    }

    // 상품 조회
    @Override
    public ItemDto read(Integer item_id) throws Exception {
        ItemDto itemDto = itemDao.select(item_id);
        return itemDto;
    }

    // 상품 수정
    @Override
    public int modify(ItemDto itemDto, List<MultipartFile> itemImgFileList) throws Exception {

        if(itemImgFileList.get(0).isEmpty()){
            System.out.println("사진 수정은 없음.");
            return itemDao.update(itemDto);
        }

        // 이미지 등록
        for(int i=0; i<itemImgFileList.size(); i++){
            ItemImgDto itemImgDto = new ItemImgDto();
            itemImgDto.setItem_id(itemDto.getItem_id());

            // 대표이미지가 삭제될 수도 있으니, 무조건 첫 번째 이미지는 대표 이미지, 또한 대표 이미지를 갖고 있는지도 검사함.
            if(i == 0 && !itemImgService.selectRepImgYn((int) itemDto.getItem_id()))
                itemImgDto.setRepImgYn("Y");

            // 추가된 이미지도 있으니, N으로 설정
            else
                itemImgDto.setRepImgYn("N");
            itemImgService.saveItemImg(itemImgDto, itemImgFileList.get(i));
        }
        return itemDao.update(itemDto);
    }

    // 상품 삭제
    @Override
    public int remove(Integer item_id) throws Exception {
        return itemDao.delete(item_id);
    }

    @Override
    public List<ItemDto> searchSelectPage(SearchCondition sc) throws Exception {
        return itemDao.searchSelectPage(sc);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return itemDao.searchResultCnt(sc);
    }

    @Override
    public int itemResultCnt(SearchCondition sc) throws Exception {
        return itemDao.itemResultCnt(sc);
    }
}

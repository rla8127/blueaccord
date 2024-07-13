package com.shopping.toy.service.item;

import com.shopping.toy.dao.item.ItemImgDao;
import com.shopping.toy.domain.item.ItemImgDto;
import com.shopping.toy.service.common.FileService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
@PropertySource("classpath:application.properties")
public class ItemImgServiceImpl implements ItemImgService {

    private final ItemImgDao itemImgDao;
    private final FileService fileService;

    @Value("${itemImgLocation}")
    String itemImgLocation; // private 적합성

    @Override
    public List<String> getOriImgName(int ino) throws Exception{

        List<String> imgNameList = itemImgDao.selectOriImgName(ino);
        return imgNameList;
    }

    @Override
    public List<String> getImagePathByIno(int ino) throws Exception{

        List<ItemImgDto> list = itemImgDao.selectListByIno(ino);
        List<String> imgUrlList = new ArrayList<>();

        for(ItemImgDto itemImg : list){
            imgUrlList.add(itemImg.getImgUrl());
        }

        return imgUrlList;
    }

    @Override
    public List<ItemImgDto> getList(int ino) throws Exception{
        return itemImgDao.selectListByIno(ino);
    }

    @Override
    public void saveItemImg(ItemImgDto itemImgDto, MultipartFile itemImgFile) throws Exception{
        String oriImgName = itemImgFile.getOriginalFilename();
        String imgName = "";
        String imgUrl = "";

        // 파일 업로드
        if(!StringUtils.isEmpty(oriImgName)){
            imgName = fileService.uploadFile(itemImgLocation, oriImgName, itemImgFile.getBytes());
            imgUrl = "/images/item/" + imgName;
        }

        // 상품 이미지 정보 저장
        itemImgDto.updateItemImg(oriImgName, imgName, imgUrl);
        itemImgDao.insert(itemImgDto);
    }

    @Override
    public int insert(ItemImgDto itemImgDto) throws Exception {
        return itemImgDao.insert(itemImgDto);
    }

    @Override
    public int count() throws Exception {
        return itemImgDao.count();
    }

    @Override
    public ItemImgDto select(int item_img_no) throws Exception{
        return itemImgDao.select(item_img_no);
    }

    @Override
    public Boolean selectRepImgYn(int ino) throws Exception{
        return itemImgDao.selectRepImgYn(ino);
    }

    @Override
    public List<ItemImgDto> selectList() throws Exception {
        return itemImgDao.selectList();
    }

    @Override
    public int update(ItemImgDto itemImgDto) throws Exception {
        return itemImgDao.update(itemImgDto);
    }

    @Override
    public int delete(int item_img_no) throws Exception {
        return itemImgDao.delete(item_img_no);
    }

    @Override
    public int deleteAll() throws Exception {
        return itemImgDao.deleteAll();
    }

    @Override
    public int deleteItem(int ino) throws Exception {
        return itemImgDao.deleteItem(ino);
    }
}

package com.lxg.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lxg.domain.Book;
import com.lxg.service.BookService;
import com.lxg.mapper.BookMapper;
import org.springframework.stereotype.Service;

/**
* @author xiaolin
* @description 针对表【t_book】的数据库操作Service实现
* @createDate 2022-09-26 15:10:47
*/
@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book>
    implements BookService{

}





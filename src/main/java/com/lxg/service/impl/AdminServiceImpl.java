package com.lxg.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lxg.domain.Admin;
import com.lxg.service.AdminService;
import com.lxg.mapper.AdminMapper;
import org.springframework.stereotype.Service;

/**
* @author xiaolin
* @description 针对表【t_admin】的数据库操作Service实现
* @createDate 2022-09-26 15:08:28
*/
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin>
    implements AdminService{

}





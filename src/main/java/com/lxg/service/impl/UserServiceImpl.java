package com.lxg.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lxg.domain.User;
import com.lxg.service.UserService;
import com.lxg.mapper.UserMapper;
import org.springframework.stereotype.Service;

/**
* @author xiaolin
* @description 针对表【t_user】的数据库操作Service实现
* @createDate 2022-09-26 15:17:26
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
    implements UserService{

}





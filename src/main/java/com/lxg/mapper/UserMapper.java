package com.lxg.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lxg.domain.User;
import org.springframework.stereotype.Repository;


/**
* @author xiaolin
* @description 针对表【t_user】的数据库操作Mapper
* @createDate 2022-09-26 15:17:26
* @Entity com.lxg.domain.User
*/
@Repository
public interface UserMapper extends BaseMapper<User> {

}





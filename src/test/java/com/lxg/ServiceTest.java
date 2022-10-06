package com.lxg;


import com.lxg.domain.User;
import com.lxg.mapper.UserMapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class ServiceTest {

    @Autowired
    public UserMapper userMapper;


    @Test
    public void testAddUser(){
        User user = new User(null,"lxg","20251104260","20软二","xiaolin","123456","xiaolin@qq.com");
        int insert = userMapper.insert(user);
        System.out.println(insert==1 ? "添加成功":"添加失败");
    }

}

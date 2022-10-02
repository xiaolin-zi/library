package com.lxg;


import com.lxg.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ServiceTest {

    @Autowired
    public UserService userService;


    @Test
    public void testAddUser(){

    }

}

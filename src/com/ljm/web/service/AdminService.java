package com.ljm.web.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ljm.web.dao.AdminMapper;
import com.ljm.web.model.Admin;


@Service
public class AdminService {
	@Resource
	private AdminMapper adminMapper;
	
	public Admin getAdminByInfo(String account, String password){
		return this.adminMapper.getAdminByInfo(account, password);
	}
}

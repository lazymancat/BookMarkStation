package com.ljm.web.dao;

import org.apache.ibatis.annotations.Param;

import com.ljm.web.model.Admin;

public abstract interface AdminMapper {
	public abstract Admin getAdminByInfo(@Param("account") String account, @Param("password") String password);
}

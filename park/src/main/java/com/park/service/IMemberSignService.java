package com.park.service;

import java.text.ParseException;

import com.park.common.bean.MemberSignInputView;
import com.park.common.bean.PageBean;
import com.park.common.po.MemberSiteSign;

public interface IMemberSignService {

	public PageBean getSigns(MemberSignInputView memberSignInputView);
	
	public void saveSign(MemberSiteSign memberSiteSign) throws ParseException;
	
}

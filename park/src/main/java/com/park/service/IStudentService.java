package com.park.service;

import com.park.common.bean.PageBean;
import com.park.common.bean.StudentInputView;
import com.park.common.po.UserStudent;

public interface IStudentService {

	public PageBean getStudents(StudentInputView studentInputView);
	
	public UserStudent getStudent(Integer studentId);
	
	public Integer saveStudent(UserStudent student);
	
	public boolean availableMobile(String mobile);
	
}
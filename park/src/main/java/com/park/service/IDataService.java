package com.park.service;

import java.util.List;
import java.util.Map;

import com.park.common.bean.DataInputView;
import com.park.common.bean.PageBean;

public interface IDataService {

	public Map<String, Object> getCountMembersByWeek(DataInputView dataInputView);

	public Map<String, Object> getCountMembersByMonth(DataInputView dataInputView);

	public List<Map<String, Object>> getMembersRegister(DataInputView dataInputView);

    public List<Map<String, Object>> getMembersRegisterStored(DataInputView dataInputView);

	public List<Map<String, Object>> getMembersRegisterGroupDate(DataInputView dataInputView);
	
	public Map<String, Object> countMembersRegister(List<Map<String, Object>> dataList);
	
	public Map<String, Object> getSitePercentage(DataInputView dataInputView);
	
	public PageBean getDataMembersAttendance(DataInputView dataInputView);
	
	public Map<String, Object> getBusinessIncome(DataInputView dataInputView);
	
	public String getCountSql(Integer countItem, String field);
	
}

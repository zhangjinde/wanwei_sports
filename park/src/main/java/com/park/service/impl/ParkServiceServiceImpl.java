package com.park.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.po.ParkBusiness;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IParkService;

@Service
public class ParkServiceServiceImpl extends BaseService implements IParkService {
	
	@Autowired
	private IBaseDao baseDao;
	
	@Override
	public ParkBusiness getBusiness() {
		return baseDao.queryByHqlFirst("FROM ParkBusiness");
	}
	
	@Override
	public List<Map<String, Object>> getTimePeriod(ParkBusiness parkBusiness) throws ParseException {
		String businessStartTime = parkBusiness.getBusinessStartTime();
		String businessEndTime = parkBusiness.getBusinessEndTime();
		int businessTimePeriod = StrUtil.objToInt(parkBusiness.getBusinessTimePeriod());
		Date startTime = DateUtil.getHHMM(businessStartTime);
		Date endTime = DateUtil.getHHMM(businessEndTime);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		while(startTime.getTime() < endTime.getTime()){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startTime", DateUtil.getHHMM(startTime));
			startTime = DateUtil.addHHMMTime(startTime, Calendar.HOUR_OF_DAY, businessTimePeriod);
			map.put("endTime", DateUtil.getHHMM(startTime));
			list.add(map);
		}
		return list;
	}
	
}
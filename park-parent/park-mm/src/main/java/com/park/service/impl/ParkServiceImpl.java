package com.park.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.park.common.constant.IDBConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.park.common.po.ParkBusiness;
import com.park.common.util.DateUtil;
import com.park.common.util.StrUtil;
import com.park.dao.IBaseDao;
import com.park.service.IParkService;

@Service
public class ParkServiceImpl extends BaseService implements IParkService {
	
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
		Integer businessTimePeriod = StrUtil.objToInt(parkBusiness.getBusinessTimePeriod());
		businessTimePeriod = businessTimePeriod != null ? businessTimePeriod : 1; //时间段默认为1小时
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
	
	@Override
	public Integer saveParkBusiness(ParkBusiness parkBusiness){
		ParkBusiness parkBusinessDB = getParkBusiness();
		String nowDate = DateUtil.getNowDate();
		if(parkBusinessDB != null){
			parkBusinessDB.setBusinessAddress(parkBusiness.getBusinessAddress());
			parkBusinessDB.setBusinessAreaName(parkBusiness.getBusinessAreaName());
			parkBusinessDB.setBusinessContact(parkBusiness.getBusinessContact());
			parkBusinessDB.setBusinessStartTime(parkBusiness.getBusinessStartTime());
			parkBusinessDB.setBusinessEndTime(parkBusiness.getBusinessEndTime());
			parkBusinessDB.setBusinessName(parkBusiness.getBusinessName());
			parkBusinessDB.setBusinessPhone(parkBusiness.getBusinessPhone());
			parkBusinessDB.setUpdateTime(nowDate);
			parkBusinessDB.setSalesId(parkBusiness.getSalesId());
			baseDao.save(parkBusinessDB, parkBusinessDB.getBusinessId());
			return parkBusinessDB.getBusinessId();
		}else{
			parkBusiness.setCreateTime(nowDate);
			baseDao.save(parkBusiness, null);
			return parkBusiness.getBusinessId();
		}
	}
	
	@Override
	public ParkBusiness getParkBusiness(){
		return baseDao.queryByHqlFirst("FROM ParkBusiness");
	}
	
	@Override
	public Map<String, Object> getBusinessTime(){
		return baseDao.queryBySqlFirst("SELECT businessId, businessStartTime, businessEndTime FROM park_business");
	}

    @Override
    public List<String> getBusinessTimePeriod(){
        Map<String, Object> businessTime = getBusinessTime();
        int businessStartTime = StrUtil.objToInt(StrUtil.objToStr(businessTime.get("businessStartTime")).substring(0,2));
        int businessEndTime = StrUtil.objToInt(StrUtil.objToStr(businessTime.get("businessEndTime")).substring(0,2));

        List<String> timelist = new ArrayList<String>();
        for (int i = businessStartTime; i < businessEndTime; i++) {
            timelist.add((i < 10 ? "0" + i : i) + ":00");
        }

        return timelist;
    }

    @Override
    public List<Map<String, Object>> getPayTypeList(){
        List<Map<String, Object>> payList = new ArrayList<Map<String, Object>>();

        Map<String, Object> cash = new HashMap<String, Object>();
        cash.put("value", IDBConstant.BALANCE_STYLE_XJ);
        cash.put("text", "现金");
        payList.add(cash);

        Map<String, Object> alipay = new HashMap<String, Object>();
        alipay.put("value", IDBConstant.BALANCE_STYLE_ZFB);
        alipay.put("text", "支付宝");
        payList.add(alipay);

        Map<String, Object> wechat = new HashMap<String, Object>();
        wechat.put("value", IDBConstant.BALANCE_STYLE_WX);
        wechat.put("text", "微信");
        payList.add(wechat);

        Map<String, Object> unionpay = new HashMap<String, Object>();
        unionpay.put("value", IDBConstant.BALANCE_STYLE_YINLIAN);
        unionpay.put("text", "银联");
        payList.add(unionpay);

        Map<String, Object> check = new HashMap<String, Object>();
        check.put("value", IDBConstant.BALANCE_STYLE_ZHIPIAO);
        check.put("text", "支票");
        payList.add(check);

        return payList;
    }
	
}

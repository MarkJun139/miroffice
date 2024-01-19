package com.group4.miroffice.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.AddressDao;
import com.group4.miroffice.dto.Address;

@Service
public class AddressService {
	
	@Autowired
	AddressDao addressDao;
	
	public List<Address> usersInfo(){
		return addressDao.usersInfo();
	}
	
	public List<String> deptName(){
		return addressDao.deptName();
	}
	
	public List<Address> searchAddress(String deptName){
		return addressDao.searchAddress(deptName);
	}

}

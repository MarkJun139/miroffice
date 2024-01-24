package com.group4.miroffice.address;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.AddressDao;
import com.group4.miroffice.dto.Address;

@Service
public class AddressService {
	
	@Autowired
	AddressDao addressDao;
	
	public List<Address> getPaginatedAddresses(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        RowBounds rowBounds = new RowBounds(offset, pageSize);
        return addressDao.usersInfoWithPagination(rowBounds);
    }

    public int getTotalPages(int pageSize) {
        long totalItems = addressDao.usersInfo().size();
        return (int) Math.ceil((double) totalItems / pageSize);
    }
    
    public int SearchtTotalPages(String deptName , int pageSize) {
        long totalItems = addressDao.searchInfo(deptName).size();
        return (int) Math.ceil((double) totalItems / pageSize);
    }

    public List<Address> searchAddressesByDept(String deptName, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        RowBounds rowBounds = new RowBounds(offset, pageSize);
        return addressDao.searchAddress(deptName, rowBounds);
    }
	
    public List<Address> usersInfo(){
		return addressDao.usersInfo();
	}
	
	public List<String> deptName(){
		return addressDao.deptName();
	}

}

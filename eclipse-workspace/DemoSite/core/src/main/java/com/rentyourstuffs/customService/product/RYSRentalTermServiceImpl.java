package com.rentyourstuffs.customService.product;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rentyourstuffs.customDao.product.RYSRentalTermDao;
import com.rentyourstuffs.customentities.RYSRentalTerm;

@Service("rysRentalService")
public class RYSRentalTermServiceImpl implements RYSRentalTermService {

	
	@Resource(name="rysRentalTermDao")
    protected RYSRentalTermDao rysRentalTermDao;
	
	@Override
	public List<RYSRentalTerm> getRentalTerms() {
		return rysRentalTermDao.readRentalTerms();
	}
	
	@Override
	public List<RYSRentalTerm> getTermItemByduration(String rentTerm) {
		return rysRentalTermDao.getTermItemByduration(rentTerm);
	}

}

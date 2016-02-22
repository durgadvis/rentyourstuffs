package com.rentyourstuffs.customService.product;

import java.util.List;

import javax.annotation.Resource;

import com.rentyourstuffs.customDao.product.RYSRentalTermDao;
import com.rentyourstuffs.customentities.RYSRentalTerm;

public class RYSRentalTermServiceImpl implements RYSRentalTermService {

	
	@Resource(name="rysRentalTermDao")
    protected RYSRentalTermDao rysRentalTermDao;
	
	@Override
	public List<RYSRentalTerm> getRentalTerms() {
		return rysRentalTermDao.readRentalTerms();
	}

}

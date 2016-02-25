package com.rentyourstuffs.customDao.product;

import java.util.List;

import com.rentyourstuffs.customentities.RYSRentalTerm;

public interface RYSRentalTermDao {


	List<RYSRentalTerm> readRentalTerms();
	
	public List<RYSRentalTerm> getTermItemByduration(String rentTerm);
}

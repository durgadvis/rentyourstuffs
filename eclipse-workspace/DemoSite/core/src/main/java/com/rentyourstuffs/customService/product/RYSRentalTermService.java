package com.rentyourstuffs.customService.product;

import java.util.List;

import com.rentyourstuffs.customentities.RYSRentalTerm;

public interface RYSRentalTermService {

	public List<RYSRentalTerm> getRentalTerms();

	List<RYSRentalTerm> getTermItemByduration(String rentTerm);

	public Object getDueDatesForRentalTerms(
			List<RYSRentalTerm> rentTermForProduct);
	
}


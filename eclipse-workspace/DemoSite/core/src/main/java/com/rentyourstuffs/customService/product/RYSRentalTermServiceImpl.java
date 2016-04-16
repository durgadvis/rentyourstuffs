package com.rentyourstuffs.customService.product;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public Map<Integer,Date> getDueDatesForRentalTerms(List<RYSRentalTerm> rentTermForProduct) {
		Map<Integer,Date> rentDates=new HashMap<Integer,Date>();
		  for(RYSRentalTerm rysRentalTerm:rentTermForProduct){
			  Calendar cal=Calendar.getInstance();
			  cal.add(Calendar.DATE, rysRentalTerm.getRentTerm());
			  rentDates.put(rysRentalTerm.getRentTerm(),cal.getTime() );
		  }
		  return rentDates;
	}

}

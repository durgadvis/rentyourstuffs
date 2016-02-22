package com.rentyourstuffs.customDao.product;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.rentyourstuffs.customentities.RYSRentalTerm;

public class RYSRentalTermDaoImpl implements RYSRentalTermDao {
	@PersistenceContext(unitName="blPU")
    protected EntityManager em;
	

	@Override
	public List<RYSRentalTerm> readRentalTerms() {
		TypedQuery<RYSRentalTerm> query = em.createQuery("SELECT r FROM com.rentyourstuffs.customentities.RYSRentalTerm r",RYSRentalTerm.class);
        List<RYSRentalTerm> rentalTerms = query.getResultList();
		return rentalTerms;
	}

}

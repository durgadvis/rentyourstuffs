package com.rentyourstuffs.customDao.product;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.search.service.solr.SolrSearchServiceImpl;

import com.rentyourstuffs.customentities.RYSRentalTerm;

public class RYSRentalTermDaoImpl implements RYSRentalTermDao {
	
	private static final Log LOG = LogFactory.getLog(RYSRentalTermDaoImpl.class);
	
	@PersistenceContext(unitName="blPU")
    protected EntityManager em;
	

	@Override
	public List<RYSRentalTerm> readRentalTerms() {
		TypedQuery<RYSRentalTerm> query = em.createQuery("SELECT r FROM com.rentyourstuffs.customentities.RYSRentalTerm r", RYSRentalTerm.class);
        List<RYSRentalTerm> rentalTerms = query.getResultList();
		return rentalTerms;
	}
	
	
	@Override
	public List<RYSRentalTerm> getTermItemByduration(String rentTerm) {
		LOG.info("rentTerm :: " + rentTerm);
		TypedQuery<RYSRentalTerm> query = (TypedQuery<RYSRentalTerm>) em.createNamedQuery("BC_READ_RENT_TERMS_BY_TERM", RYSRentalTerm.class);
		
		if(StringUtils.isEmpty(rentTerm)) 
		{
			query.setParameter("rentTerm", new Integer("30"));
		}
		else
		{
			query.setParameter("rentTerm", new Integer(rentTerm));
		}
		LOG.info("query :: " + query);
        List<RYSRentalTerm> rentalTerms = query.getResultList();
        LOG.info("rentalTerms :: " + rentalTerms);
		return rentalTerms;
	}
	

}

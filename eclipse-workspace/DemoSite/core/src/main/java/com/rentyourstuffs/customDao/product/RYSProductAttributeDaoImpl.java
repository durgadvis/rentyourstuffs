/**
 * 
 */
package com.rentyourstuffs.customDao.product;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.catalog.domain.ProductAttribute;

import com.rentyourstuffs.customentities.RYSRentalTerm;

/**
 * @author Vishal.Durgad
 *
 */
public class RYSProductAttributeDaoImpl implements RYSProductAttributeDao {
	
	private static final Log LOG = LogFactory.getLog(RYSRentalTermDaoImpl.class);
	
	@PersistenceContext(unitName="blPU")
    protected EntityManager em;
	
	@Override
	public List<ProductAttribute> getAllProductAttributesByProductId(Long productId) {
		TypedQuery<ProductAttribute> query = (TypedQuery<ProductAttribute>) em.createNamedQuery("BC_READ_PRODUCT_ATTRIBUTE_BY_PRODUCT_ID", ProductAttribute.class);
		query.setParameter("product_id", productId);
		List<ProductAttribute> allProductAttributes=query.getResultList();
		return allProductAttributes;
	}
	
	
}

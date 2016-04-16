/**
 * 
 */
package com.rentyourstuffs.customDao.product;

import java.util.List;

import org.broadleafcommerce.core.catalog.domain.ProductAttribute;

import com.rentyourstuffs.customentities.RYSRentalTerm;

/**
 * @author Vishal.Durgad
 *
 */
public interface RYSProductAttributeDao {

	public List<ProductAttribute> getAllProductAttributesByProductId(Long productId);
}

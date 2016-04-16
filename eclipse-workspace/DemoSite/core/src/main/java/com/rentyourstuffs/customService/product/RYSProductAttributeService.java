/**
 * 
 */
package com.rentyourstuffs.customService.product;

import java.util.List;

import org.broadleafcommerce.core.catalog.domain.ProductAttribute;

import com.rentyourstuffs.customentities.RYSRentalTerm;

/**
 * @author Vishal.Durgad
 *
 */
public interface RYSProductAttributeService {
	
	List<ProductAttribute> getAllProductAttributesById(Long productId);
}

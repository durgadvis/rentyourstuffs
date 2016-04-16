package com.rentyourstuffs.customService.product;

import java.util.List;

import javax.annotation.Resource;

import org.broadleafcommerce.core.catalog.domain.ProductAttribute;

import com.rentyourstuffs.customDao.product.RYSProductAttributeDao;

public class RYSProductAttributeServiceImpl implements
		RYSProductAttributeService {
	
	@Resource(name="rysProductAttributeDao")
	private RYSProductAttributeDao rysProductAttributeDao;
	
	@Override
	public List<ProductAttribute> getAllProductAttributesById(Long productId) {
		
		return rysProductAttributeDao.getAllProductAttributesByProductId(productId);
	}

}

package com.rentyourstuffs.core.web.catalog;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPricingService;
import org.broadleafcommerce.core.web.catalog.AbstractDynamicSkuPricingFilter;
import org.springframework.stereotype.Component;


@Component("rysDynamicSkuPricingFilter")
public class RYSDynamicSkuPricingFilter extends AbstractDynamicSkuPricingFilter  {
	
	@Resource (name = "rysDynamicSkuPricingService")
	protected DynamicSkuPricingService skuPricingService;
	
	@Resource (name = "blCatalogService")
	CatalogService catalogService; 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public HashMap getPricingConsiderations(ServletRequest request)
	{
		HashMap pricingConsiderations = null;
		String rentTerm = request.getParameter("rentTerm");
		if(rentTerm != null)
		{
			pricingConsiderations = new HashMap();
			String skuId = request.getParameter("skuId");
			if(skuId != null)
			{
				Sku skuItem = catalogService.findSkuById(new Long(skuId));
				Money price = skuItem.getPrice();
				pricingConsiderations.put("defaultPrice", price);
			}
			pricingConsiderations.put("rentTerm", rentTerm);
		}
		return pricingConsiderations;
	}


	@Override
	public DynamicSkuPricingService getDynamicSkuPricingService(
			ServletRequest servletrequest) {
		return skuPricingService;
	}

}

package com.rentyourstuffs.core.catalog.services.dynamic;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.catalog.domain.ProductOptionValueImpl;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.domain.SkuBundleItem;
import org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPrices;
import org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPricingService;
import org.springframework.stereotype.Service;

import com.rentyourstuffs.customService.product.RYSRentalTermService;
import com.rentyourstuffs.customentities.RYSRentalTerm;


@Service("rysDynamicSkuPricingService")
public class RYSDynamicSkuPricingServiceImpl implements
		DynamicSkuPricingService {

	@Resource(name = "rysRentalService")
	RYSRentalTermService  rentalTermService;
	
	@Override
	public DynamicSkuPrices getPriceAdjustment(ProductOptionValueImpl arg0,
			Money arg1, HashMap arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DynamicSkuPrices getSkuBundleItemPrice(SkuBundleItem arg0,
			HashMap arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPricingService#getSkuPrices(org.broadleafcommerce.core.catalog.domain.Sku, java.util.HashMap)
	 */
	@Override
	public DynamicSkuPrices getSkuPrices(Sku sku, @SuppressWarnings("rawtypes") HashMap skuPricingConsiderations) {
		
		Money retailPrice = null;
        Money salePrice = null;
        if(skuPricingConsiderations != null && skuPricingConsiderations.get("rentTerm") != null)
        {
        	String rentTerm = (String)skuPricingConsiderations.get("rentTerm");
        	if(rentTerm != null)
        	{
        		List<RYSRentalTerm> termItemByduration = rentalTermService.getTermItemByduration(rentTerm);
        		if(termItemByduration != null && !termItemByduration.isEmpty())
        		{
        			RYSRentalTerm rysRentalTerm = termItemByduration.get(0);
        			int termPercentage = rysRentalTerm.getTermPercentage();
        			Money actualPrice = (Money)skuPricingConsiderations.get("defaultPrice");
        			BigDecimal termPrice = new BigDecimal((actualPrice.getAmount().doubleValue() * termPercentage) / 100);
        			salePrice = new Money(termPrice);
        			retailPrice = new Money(termPrice);
        		}
        	}
        }
        DynamicSkuPrices prices = new DynamicSkuPrices();
        prices.setRetailPrice(retailPrice);
        prices.setSalePrice(salePrice);
        return prices;
	}

}

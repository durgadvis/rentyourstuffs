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
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.springframework.stereotype.Service;
import org.broadleafcommerce.core.web.order.CartState;

import com.rentyourstuffs.core.order.domain.RYSOrderItem;
import com.rentyourstuffs.customService.product.RYSRentalTermService;
import com.rentyourstuffs.customentities.RYSRentalTerm;

@Service("rysDynamicSkuPricingService")
public class RYSDynamicSkuPricingServiceImpl implements DynamicSkuPricingService {

	@Resource(name = "rysRentalService")
	RYSRentalTermService rentalTermService;

	@Override
	public DynamicSkuPrices getPriceAdjustment(ProductOptionValueImpl arg0, Money arg1, HashMap arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DynamicSkuPrices getSkuBundleItemPrice(SkuBundleItem arg0, HashMap arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPricingService
	 * #getSkuPrices(org.broadleafcommerce.core.catalog.domain.Sku, java.util.HashMap)
	 */
	@Override
	public DynamicSkuPrices getSkuPrices(Sku sku, @SuppressWarnings("rawtypes") HashMap skuPricingConsiderations) {

		Money retailPrice = null;
		Money salePrice = null;
		DynamicSkuPrices prices = new DynamicSkuPrices();
		if (skuPricingConsiderations != null && skuPricingConsiderations.get(sku.getId().toString()) != null) {
			String rentTerm = (String) skuPricingConsiderations.get(sku.getId().toString());
			if (rentTerm != null) {
				List<RYSRentalTerm> termItemByduration = rentalTermService.getTermItemByduration(rentTerm);
				if (termItemByduration != null && !termItemByduration.isEmpty()) {
					RYSRentalTerm rysRentalTerm = termItemByduration.get(0);
					int termPercentage = rysRentalTerm.getTermPercentage();
					Money actualPrice = (Money) skuPricingConsiderations.get("defaultPrice");
					BigDecimal termPrice = new BigDecimal((actualPrice.getAmount().doubleValue() * termPercentage) / 100);
					salePrice = new Money(termPrice);
					retailPrice = new Money(termPrice);
					prices.setSalePrice(salePrice);
					prices.setRetailPrice(retailPrice);
					setUpdatedRentalTermAtCart(rentTerm, sku.getId());
					return prices;
				}
			}
		}
		// if it is new item

		Order cart = CartState.getCart();
		List<OrderItem> orderItems = cart.getOrderItems();
		for (OrderItem orderItem : orderItems) {
			if (orderItem instanceof DiscreteOrderItem) {
				DiscreteOrderItem disItem = (DiscreteOrderItem) orderItem;
				if (disItem.getSku().getId().equals(sku.getId())) {
					prices.setRetailPrice(disItem.getRetailPrice());
					prices.setSalePrice(disItem.getSalePrice());
				}
			}
		}

		return prices;
	}

	/**
	 * @param rentTerm
	 *            Setting the updated rental terms in the cart page
	 * @param skuId
	 */
	protected void setUpdatedRentalTermAtCart(String rentTerm, Long skuId) {
		Order cart = CartState.getCart();
		List<OrderItem> orderItems = cart.getOrderItems();
		for (OrderItem orderItem : orderItems) {
			if (orderItem instanceof DiscreteOrderItem) {
				DiscreteOrderItem disItem = (DiscreteOrderItem) orderItem;
				RYSOrderItem ryso = (RYSOrderItem) disItem;
				if (disItem.getSku().getId().equals(skuId)) {
					ryso.setRentTerm(Long.valueOf(rentTerm));
				}
			}
		}
	}

}

package com.rentyourstuffs.core.pricing.service.workflow;

import java.util.List;

import org.broadleafcommerce.core.catalog.service.dynamic.SkuPricingConsiderationContext;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

import com.rentyourstuffs.core.order.domain.RYSOrderItem;

public class RYSRepriceBasedOnTerm extends BaseActivity<ProcessContext<Order>> {

	@Override
	public ProcessContext<Order> execute(ProcessContext<Order> context)
			throws Exception {
		Order order = context.getSeedData();		
			List<DiscreteOrderItem> discreteOrderItems = order.getDiscreteOrderItems();
			if(discreteOrderItems != null){
				if(SkuPricingConsiderationContext.getSkuPricingConsiderationContext() != null)
				{
					for(DiscreteOrderItem discreteOrderItem : discreteOrderItems)
					{
						discreteOrderItem.setPrice(discreteOrderItem.getSku().getRetailPrice());
					}
				}
				else
				{
					for(DiscreteOrderItem discreteOrderItem : discreteOrderItems)
					{
						if(((RYSOrderItem)discreteOrderItem).getRentPrice() != null)
						{
							discreteOrderItem.setPrice(((RYSOrderItem)discreteOrderItem).getRentPrice());
						}
					}
				}
				
			}
		context.setSeedData(order);
		return context;
	}

}

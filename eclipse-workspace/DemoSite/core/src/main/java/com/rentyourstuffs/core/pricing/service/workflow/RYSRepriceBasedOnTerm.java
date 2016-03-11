package com.rentyourstuffs.core.pricing.service.workflow;

import java.util.List;

import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

public class RYSRepriceBasedOnTerm extends BaseActivity<ProcessContext<Order>> {

	@Override
	public ProcessContext<Order> execute(ProcessContext<Order> context)
			throws Exception {
		Order order = context.getSeedData();
		for(OrderItem orderItem : order.getOrderItems())
		{
			List<DiscreteOrderItem> discreteOrderItems = order.getDiscreteOrderItems();
			if(discreteOrderItems != null){
				for(DiscreteOrderItem discreteOrderItem : discreteOrderItems)
				{
					discreteOrderItem.setPrice(discreteOrderItem.getSku().getRetailPrice());
				}
			}
		}
		
		context.setSeedData(order);
		return context;
	}

}

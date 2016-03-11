package com.rentyourstuffs.core.order.service.workflow.add;

import javax.annotation.Resource;

import org.broadleafcommerce.core.checkout.service.workflow.CompleteOrderActivity;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.profile.core.service.IdGenerationService;

public class RYSCompleteOrderActivity extends CompleteOrderActivity {
	
	@Resource(name="blIdGenerationService")
    protected IdGenerationService idGenerationService;

	@Override
	protected String determineOrderNumber(Order order) {
		return findNextOrderId().toString();
	}
	
    public Long findNextOrderId() {
        return idGenerationService.findNextId("org.broadleafcommerce.core.order.domain.Order");
    }

	
}

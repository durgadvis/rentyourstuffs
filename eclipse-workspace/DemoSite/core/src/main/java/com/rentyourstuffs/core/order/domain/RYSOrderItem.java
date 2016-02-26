package com.rentyourstuffs.core.order.domain;

import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;

/**
 * @author Prakash.Ponali
 *
 */
public interface RYSOrderItem extends DiscreteOrderItem {
	
	/**
	 * @return
	 */
	public Long getRentTerm();

	/**
	 * @param rentTerm
	 */
	public void setRentTerm(Long rentTerm);

}

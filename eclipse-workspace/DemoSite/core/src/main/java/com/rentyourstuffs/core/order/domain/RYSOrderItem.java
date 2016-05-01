package com.rentyourstuffs.core.order.domain;

import org.broadleafcommerce.common.money.Money;
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
	
	
	/**
	 * @return
	 */
	public Money getRentPrice();
	
	
	/**
	 * @param rentPrice
	 */
	public void setRentPrice(Money rentPrice);

}

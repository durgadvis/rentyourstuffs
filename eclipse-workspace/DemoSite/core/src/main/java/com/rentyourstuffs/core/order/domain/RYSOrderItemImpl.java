package com.rentyourstuffs.core.order.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.broadleafcommerce.common.presentation.AdminPresentation;
import org.broadleafcommerce.common.presentation.AdminPresentationClass;
import org.broadleafcommerce.common.presentation.client.VisibilityEnum;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItemImpl;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;



@SuppressWarnings({ "serial", "unchecked" })
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "RYS_ORDER_ITEM")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="blOrderElements")
@AdminPresentationClass(friendlyName = "RYSOrderItemImpl_rysOrderItem")
public class RYSOrderItemImpl extends DiscreteOrderItemImpl implements RYSOrderItem{
	
		@Column(name = "RENT_TERM")
		@AdminPresentation(visibility = VisibilityEnum.HIDDEN_ALL)
		protected Long rentTerm;

		@Override
		public Long getRentTerm() {
			return rentTerm;
		}
		
		@Override
		public void setRentTerm(Long rentTerm) {
			this.rentTerm = rentTerm;
		}

}

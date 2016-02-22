package com.rentyourstuffs.customentities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="RYS_RENT_TERMS")
public class RYSRentalTermImpl implements RYSRentalTerm {

	@Id
	@Column(name="RENT_TERM")
	protected int rentTerm;
	
	@Column(name="TERM_PERCENTAGE")
	protected int termPercentage;

	public int getRentTerm() {
		return rentTerm;
	}

	public void setRentTerm(int rentTerm) {
		this.rentTerm = rentTerm;
	}

	public int getTermPercentage() {
		return termPercentage;
	}

	public void setTermPercentage(int termPercentage) {
		this.termPercentage = termPercentage;
	}
	
	

}

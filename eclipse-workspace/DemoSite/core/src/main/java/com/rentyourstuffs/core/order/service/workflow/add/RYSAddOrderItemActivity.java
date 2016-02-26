package com.rentyourstuffs.core.order.service.workflow.add;

import java.util.List;

import javax.annotation.Resource;

import org.broadleafcommerce.common.web.BroadleafRequestContext;
import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.domain.ProductBundle;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.order.service.call.DiscreteOrderItemRequest;
import org.broadleafcommerce.core.order.service.call.NonDiscreteOrderItemRequestDTO;
import org.broadleafcommerce.core.order.service.call.OrderItemRequest;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.broadleafcommerce.core.order.service.call.ProductBundleOrderItemRequest;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;
import org.broadleafcommerce.core.order.service.workflow.add.AddOrderItemActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;
import org.springframework.web.context.request.WebRequest;

import com.rentyourstuffs.core.order.domain.RYSOrderItem;
import com.rentyourstuffs.customService.product.RYSRentalTermService;
import com.rentyourstuffs.customentities.RYSRentalTerm;

public class RYSAddOrderItemActivity extends AddOrderItemActivity {
	
	@Resource(name = "rysRentalService")
	RYSRentalTermService  rentalTermService;
	
	@Override
	public ProcessContext<CartOperationRequest> execute(ProcessContext<CartOperationRequest> context) throws Exception {

        CartOperationRequest request = context.getSeedData();
        OrderItemRequestDTO orderItemRequestDTO = request.getItemRequest();

        // Order has been verified in a previous activity -- the values in the request can be trusted
        Order order = request.getOrder();
        
        Sku sku = null;
        if (orderItemRequestDTO.getSkuId() != null) {
            sku = catalogService.findSkuById(orderItemRequestDTO.getSkuId());
        }
        
        Product product = null;
        if (orderItemRequestDTO.getProductId() != null) {
            product = catalogService.findProductById(orderItemRequestDTO.getProductId());
        }
        
        Category category = null;
        if (orderItemRequestDTO.getCategoryId() != null) {
            category = catalogService.findCategoryById(orderItemRequestDTO.getCategoryId());
        } 

        if (category == null && product != null) {
            category = product.getDefaultCategory();
        }

        OrderItem item;
        if (orderItemRequestDTO instanceof NonDiscreteOrderItemRequestDTO) {
            NonDiscreteOrderItemRequestDTO ndr = (NonDiscreteOrderItemRequestDTO) orderItemRequestDTO;
            OrderItemRequest itemRequest = new OrderItemRequest();
            itemRequest.setQuantity(ndr.getQuantity());
            itemRequest.setRetailPriceOverride(ndr.getOverrideRetailPrice());
            itemRequest.setSalePriceOverride(ndr.getOverrideSalePrice());
            itemRequest.setItemName(ndr.getItemName());
            itemRequest.setOrder(order);
            item = orderItemService.createOrderItem(itemRequest);
        } else if (product == null || !(product instanceof ProductBundle)) {
            DiscreteOrderItemRequest itemRequest = new DiscreteOrderItemRequest();
            itemRequest.setCategory(category);
            itemRequest.setProduct(product);
            itemRequest.setSku(sku);
            itemRequest.setQuantity(orderItemRequestDTO.getQuantity());
            itemRequest.setItemAttributes(orderItemRequestDTO.getItemAttributes());
            itemRequest.setOrder(order);
            itemRequest.setSalePriceOverride(orderItemRequestDTO.getOverrideSalePrice());
            itemRequest.setRetailPriceOverride(orderItemRequestDTO.getOverrideRetailPrice());
            item = orderItemService.createDiscreteOrderItem(itemRequest);
        } else {
            ProductBundleOrderItemRequest bundleItemRequest = new ProductBundleOrderItemRequest();
            bundleItemRequest.setCategory(category);
            bundleItemRequest.setProductBundle((ProductBundle) product);
            bundleItemRequest.setSku(sku);
            bundleItemRequest.setQuantity(orderItemRequestDTO.getQuantity());
            bundleItemRequest.setItemAttributes(orderItemRequestDTO.getItemAttributes());
            bundleItemRequest.setName(product.getName());
            bundleItemRequest.setOrder(order);
            bundleItemRequest.setSalePriceOverride(orderItemRequestDTO.getOverrideSalePrice());
            bundleItemRequest.setRetailPriceOverride(orderItemRequestDTO.getOverrideRetailPrice());
            item = orderItemService.createBundleOrderItem(bundleItemRequest, false);
        }

        if (orderItemRequestDTO.getParentOrderItemId() != null) {
            OrderItem parent = orderItemService.readOrderItemById(orderItemRequestDTO.getParentOrderItemId());
            item.setParentOrderItem(parent);
        }
        BroadleafRequestContext broadleafRequestContext = BroadleafRequestContext.getBroadleafRequestContext();
        
        if(broadleafRequestContext != null)
        {
        	WebRequest webRequest = broadleafRequestContext.getWebRequest();
            if(webRequest != null)
            {
            	String rentTerm = webRequest.getParameter("rentTerm");
            	if(rentTerm != null)
            	{
            		List<RYSRentalTerm> termItemByduration = rentalTermService.getTermItemByduration(rentTerm);
            		if(termItemByduration != null && !termItemByduration.isEmpty())
            		{
            			RYSOrderItem orderItem = (RYSOrderItem)item;
            			orderItem.setRentTerm(new Long(termItemByduration.get(0).getRentTerm()));
            		}
            	}
            }
        }
        order.getOrderItems().add(item);
        request.setOrderItem(item);

        if (!request.isPriceOrder()) {
            //persist the newly created order if we're not going through the pricing flow. This helps with proper
            //fulfillment group association
            genericEntityDao.persist(item);
        }

        return context;
    
	}

}

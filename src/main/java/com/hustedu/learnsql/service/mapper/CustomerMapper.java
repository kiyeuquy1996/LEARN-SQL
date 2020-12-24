package com.hustedu.learnsql.service.mapper;

import com.hustedu.learnsql.domain.Customer;
import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.service.dto.CustomerDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity Customer and its DTO CustomerDTO.
 */
@Mapper(componentModel = "spring", uses = {})
public interface CustomerMapper extends EntityMapper<CustomerDTO, Customer> {


    @Mapping(target = "customerIDS", ignore = true)
    Customer toEntity(CustomerDTO customerDTO);

    default Customer fromId(Long id) {
        if (id == null) {
            return null;
        }
        Customer customer = new Customer();
        customer.setId(id);
        return customer;
    }
}

package com.hustedu.learnsql.web.rest;
import com.hustedu.learnsql.service.OrdersService;
import com.hustedu.learnsql.service.dto.OrdersDTO;
import com.hustedu.learnsql.web.rest.errors.BadRequestAlertException;
import com.hustedu.learnsql.web.rest.util.HeaderUtil;
import com.hustedu.learnsql.service.OrdersService;
import com.hustedu.learnsql.web.rest.errors.BadRequestAlertException;
import com.hustedu.learnsql.web.rest.util.HeaderUtil;
import com.hustedu.learnsql.service.dto.OrdersDTO;
import io.github.jhipster.web.util.ResponseUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;

import java.util.List;
import java.util.Optional;
import java.util.stream.StreamSupport;

import static org.elasticsearch.index.query.QueryBuilders.*;

/**
 * REST controller for managing Orders.
 */
@RestController
@RequestMapping("/api")
public class OrdersResource {

    private final Logger log = LoggerFactory.getLogger(OrdersResource.class);

    private static final String ENTITY_NAME = "orders";

    private final OrdersService ordersService;

    public OrdersResource(OrdersService ordersService) {
        this.ordersService = ordersService;
    }

    /**
     * POST  /orders : Create a new orders.
     *
     * @param ordersDTO the ordersDTO to create
     * @return the ResponseEntity with status 201 (Created) and with body the new ordersDTO, or with status 400 (Bad Request) if the orders has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PostMapping("/orders")
    public ResponseEntity<OrdersDTO> createOrders(@Valid @RequestBody OrdersDTO ordersDTO) throws URISyntaxException {
        log.debug("REST request to save Orders : {}", ordersDTO);
        if (ordersDTO.getId() != null) {
            throw new BadRequestAlertException("A new orders cannot already have an ID", ENTITY_NAME, "idexists");
        }
        OrdersDTO result = ordersService.save(ordersDTO);
        return ResponseEntity.created(new URI("/api/orders/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /orders : Updates an existing orders.
     *
     * @param ordersDTO the ordersDTO to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated ordersDTO,
     * or with status 400 (Bad Request) if the ordersDTO is not valid,
     * or with status 500 (Internal Server Error) if the ordersDTO couldn't be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PutMapping("/orders")
    public ResponseEntity<OrdersDTO> updateOrders(@Valid @RequestBody OrdersDTO ordersDTO) throws URISyntaxException {
        log.debug("REST request to update Orders : {}", ordersDTO);
        if (ordersDTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        OrdersDTO result = ordersService.save(ordersDTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(ENTITY_NAME, ordersDTO.getId().toString()))
            .body(result);
    }

    /**
     * GET  /orders : get all the orders.
     *
     * @return the ResponseEntity with status 200 (OK) and the list of orders in body
     */
    @GetMapping("/orders")
    public List<OrdersDTO> getAllOrders() {
        log.debug("REST request to get all Orders");
        return ordersService.findAll();
    }

    /**
     * GET  /orders/:id : get the "id" orders.
     *
     * @param id the id of the ordersDTO to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the ordersDTO, or with status 404 (Not Found)
     */
    @GetMapping("/orders/{id}")
    public ResponseEntity<OrdersDTO> getOrders(@PathVariable Long id) {
        log.debug("REST request to get Orders : {}", id);
        Optional<OrdersDTO> ordersDTO = ordersService.findOne(id);
        return ResponseUtil.wrapOrNotFound(ordersDTO);
    }

    /**
     * DELETE  /orders/:id : delete the "id" orders.
     *
     * @param id the id of the ordersDTO to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @DeleteMapping("/orders/{id}")
    public ResponseEntity<Void> deleteOrders(@PathVariable Long id) {
        log.debug("REST request to delete Orders : {}", id);
        ordersService.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert(ENTITY_NAME, id.toString())).build();
    }

    /**
     * SEARCH  /_search/orders?query=:query : search for the orders corresponding
     * to the query.
     *
     * @param query the query of the orders search
     * @return the result of the search
     */
    @GetMapping("/_search/orders")
    public List<OrdersDTO> searchOrders(@RequestParam String query) {
        log.debug("REST request to search Orders for query {}", query);
        return ordersService.search(query);
    }

}

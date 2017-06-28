package student.StudentGo.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import student.StudentGo.dao.OrderDAO;
import student.StudentGo.dao.OrderDetailDAO;
import student.StudentGo.dao.ProductDAO;
import student.StudentGo.entity.Customer;
import student.StudentGo.entity.OrderDetail;
import student.StudentGo.entity.Product;
import student.StudentGo.model.*;
import student.StudentGo.entity.Order;

import java.util.Date;
import java.util.List;
import java.util.UUID;


@Transactional
public class OrderDAOImpl implements OrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;


    private int getMaxOrderNum() {
        String sql = "Select max(o.orderNum) from " + Order.class.getName() + " o ";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(sql);
        Integer value = (Integer) query.uniqueResult();
        if (value == null) {
            return 0;
        }
        return value;
    }

    @Override
    public void saveOrder(CartInfo cartInfo) {
        Session session = sessionFactory.getCurrentSession();

        int orderNum = this.getMaxOrderNum() + 1;
        Order order = new Order();

        order.setId(UUID.randomUUID().toString());
        order.setOrderNum(orderNum);
        order.setOrderDate(new Date());
        order.setAmount(cartInfo.getAmountTotal());

        CustomerInfo customerInfo = cartInfo.getCustomerInfo();
        order.setCustomer(new Customer(customerInfo.getName(), customerInfo.getCNP()
                , customerInfo.getID_Legitimatie()));

        session.persist(order);

        List<CartLineInfo> lines = cartInfo.getCartLines();

        for (CartLineInfo line : lines) {
            OrderDetail detail = new OrderDetail();
            detail.setId(UUID.randomUUID().toString());
            detail.setOrder(order);
            detail.setAmount(line.getAmount());
            detail.setPrice(line.getProductInfo().getPrice());

            String code = line.getProductInfo().getCode();
            Product product = this.productDAO.findProduct(code);
            detail.setProduct(product);

            session.persist(detail);
        }

        cartInfo.setOrderNum(orderNum);
    }

    @Override
    public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage) {
        String sql = "Select new " + OrderInfo.class.getName()//
                + "("
                + "ord.id, ord.orderDate, ord.orderNum, ord.amount, ord.customer"
                + ") " +
                " from "
                + Order.class.getName() + " ord "//
                + " order by ord.orderNum desc";
        Session session = this.sessionFactory.getCurrentSession();

        System.out.println(sql);
        Query query = session.createQuery(sql);

        return new PaginationResult<OrderInfo>(query, page, maxResult, maxNavigationPage);
    }

    @Override
    public Order findOrder(String orderId) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Order.class);
        crit.add(Restrictions.eq("id", orderId));
        return (Order) crit.uniqueResult();
    }


    @Override
    public OrderInfo getOrderInfo(String orderId) {
        Order order = this.findOrder(orderId);
        if (order == null) {
            return null;
        }


        return new OrderInfo(order.getId(), order.getOrderDate(), order.getOrderNum(),
                order.getAmount(), order.getCustomer());
    }

    @Override
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId) {
        String sql = "Select new " + OrderDetailInfo.class.getName() //
                + "(d.id, d.product.code, d.product.name ,d.price,d.amount) "//
                + " from " + OrderDetail.class.getName() + " d "//
                + " where d.order.id = :orderId ";

        Session session = this.sessionFactory.getCurrentSession();

        Query query = session.createQuery(sql);
        query.setParameter("orderId", orderId);

        return query.list();
    }

    @Override
    public void updateCustomerInfo(OrderInfo orderInfo) {
        Session session = sessionFactory.getCurrentSession();

        if (orderInfo == null) {
            return;
        }
        Order order = this.findOrder(orderInfo.getId());
        if (order != null) {
            CustomerInfo customerInfo = orderInfo.getCustomerInfo();
            if (customerInfo != null) {
                order.setCustomer(new Customer(customerInfo.getName(), customerInfo.getCNP()
                        , customerInfo.getID_Legitimatie()));

            }
            List<OrderDetailInfo> details = orderInfo.getDetails();
            if (details != null) {
                OrderInfo orderInfo2 = this.getOrderInfo(order.getId());

            }
            session.update(order);
        }

    }

    @Override
    public void delete(String orderId) {

        Order order = null;

        if (orderId != null) {
            order = this.findOrder(orderId);
        }
        if (order != null) {
            this.sessionFactory.getCurrentSession().delete(order);
        }

        this.sessionFactory.getCurrentSession().flush();
    }}
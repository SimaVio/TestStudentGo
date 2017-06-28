package student.StudentGo.dao;

import student.StudentGo.model.CartInfo;
import student.StudentGo.model.OrderDetailInfo;
import student.StudentGo.model.OrderInfo;
import student.StudentGo.model.PaginationResult;
import student.StudentGo.entity.Order;

import java.util.List;

public interface OrderDAO {

    public void saveOrder(CartInfo cartInfo);

    public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage);

    public OrderInfo getOrderInfo(String orderId);

    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);

    public void updateCustomerInfo(OrderInfo orderInfo);

    public Order findOrder(String orderId);

    public void delete (String orderId);
}
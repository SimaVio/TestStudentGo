package student.StudentGo.dao;

import student.StudentGo.entity.OrderDetail;
import student.StudentGo.model.OrderInfo;

public interface OrderDetailDAO {
    public OrderDetail findOrderDetail(String orderDetailId);

    public void updateOrderDetails(OrderInfo orderInfo);

    public void deleteOrderDetails(OrderInfo orderInfo);
}

package student.StudentGo.model;

import student.StudentGo.entity.Customer;

import java.util.Date;
import java.util.List;

public class OrderInfo {

    private String id;
    private Date orderDate;
    private int orderNum;
    private double amount;

    private CustomerInfo customerInfo;

    private List<OrderDetailInfo> details;

    public OrderInfo() {

    }

    public OrderInfo(String id, Date orderDate, int orderNum, //
                     double amount, Customer customer) {
        this.id = id;
        this.orderDate = orderDate;
        this.orderNum = orderNum;
        this.amount = amount;

        this.customerInfo = new CustomerInfo(customer);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public CustomerInfo getCustomerInfo() {
        return customerInfo;
    }

    public void setCustomerInfo(CustomerInfo customerInfo) {
        this.customerInfo = customerInfo;
    }

    public List<OrderDetailInfo> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetailInfo> details) {
        this.details = details;
    }

}

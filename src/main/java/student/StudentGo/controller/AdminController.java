package student.StudentGo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import student.StudentGo.dao.OrderDetailDAO;
import student.StudentGo.dao.ProductDAO;
import student.StudentGo.model.*;
import student.StudentGo.dao.OrderDAO;
import student.StudentGo.validator.ProductInfoValidator;

import java.util.List;

@Controller
@Transactional
@EnableWebMvc
public class AdminController  extends RootController{

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private OrderDetailDAO orderDetailDAO;

    @Autowired
    private ProductInfoValidator productInfoValidator;

    @Autowired
    private ResourceBundleMessageSource messageSource;

    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);

        if (target.getClass() == ProductInfo.class) {
            dataBinder.setValidator(productInfoValidator);
            dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        }
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login(Model model) {

        return "login";
    }

    @RequestMapping(value = {"/accountInfo"}, method = RequestMethod.GET)
    public String accountInfo(Model model) {

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(userDetails.getPassword());
        System.out.println(userDetails.getUsername());
        System.out.println(userDetails.isEnabled());

        model.addAttribute("userDetails", userDetails);
        return "accountInfo";
    }

    @RequestMapping(value = {"/orderList"}, method = RequestMethod.GET)
    public String orderList(Model model, //
                            @RequestParam(value = "page", defaultValue = "1") String pageStr) {
        int page = 1;
        try {
            page = Integer.parseInt(pageStr);
        } catch (Exception e) {
        }
        final int MAX_RESULT = 5;
        final int MAX_NAVIGATION_PAGE = 10;

        PaginationResult<OrderInfo> paginationResult //
                = orderDAO.listOrderInfo(page, MAX_RESULT, MAX_NAVIGATION_PAGE);

        model.addAttribute("paginationResult", paginationResult);
        return "orderList";
    }

    @RequestMapping(value = {"/product"}, method = RequestMethod.GET)
    public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
        ProductInfo productInfo = null;

        if (code != null && code.length() > 0) {
            productInfo = productDAO.findProductInfo(code);
        }
        if (productInfo == null) {
            productInfo = new ProductInfo();
            productInfo.setNewProduct(true);
        }
        model.addAttribute("productForm", productInfo);
        return "product";
    }

    @RequestMapping(value = {"/product"}, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String productSave(Model model, //
                              @ModelAttribute("productForm") @Validated ProductInfo productInfo, //
                              BindingResult result, //
                              final RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "product";
        }
        try {
            productDAO.save(productInfo);
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);

            return "product";

        }
        return "redirect:/productList";
    }


    @RequestMapping(value = {"/deleteProduct"}, method = RequestMethod.GET)
    public String productDelete(Model model, @RequestParam(value = "code", defaultValue = "") String code) {

        ProductInfo productInfo = null;

        if (code != null && code.length() > 0) {
            productInfo = productDAO.findProductInfo(code);
        }
        if (productInfo == null) {
            return "redirect:/productList";
        }
        model.addAttribute("productForm", productInfo);
        return "productDelete";
    }

    @RequestMapping(value = {"/deleteProduct"}, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String productDeleteConfirmation(Model model, //
                                            @ModelAttribute("productForm") @Validated ProductInfo productInfo, //
                                            BindingResult result, //
                                            final RedirectAttributes redirectAttributes) {
        try {
            String code = null;
            if (productInfo != null) {
                code = productInfo.getCode();
            }
            if (code != null && code.length() > 0) {
                productDAO.delete(code);
            }
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);

            return "productDelete";

        }

        return "redirect:/productList";
    }

    @RequestMapping(value = {"/order"}, method = RequestMethod.GET)
    public String orderView(Model model, @RequestParam(value = "orderId", defaultValue = "") String orderId) {
        OrderInfo orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.getOrderInfo(orderId);
        }
        if (orderInfo == null) {
            return "redirect:/orderList";
        }
        List<OrderDetailInfo> details = this.orderDAO.listOrderDetailInfos(orderId);
        orderInfo.setDetails(details);

        model.addAttribute("orderInfo", orderInfo);

        return "order";
    }

    // GET: Edit order.
    @RequestMapping(value = {"/editOrder"}, method = RequestMethod.GET)
    public String orderEdit(Model model, @RequestParam("orderId") String orderId) {
        OrderInfo orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.getOrderInfo(orderId);
        }
        if (orderInfo == null) {
            return "redirect:/orderList";
        }
        List<OrderDetailInfo> details = this.orderDAO.listOrderDetailInfos(orderId);
        orderInfo.setDetails(details);

        model.addAttribute("orderInfo", orderInfo);
        model.addAttribute("customerForm", orderInfo.getCustomerInfo());

        return "orderEdit";

    }

    @RequestMapping(value = {"/editOrder"}, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String orderEditConfirmation(Model model, //
                                        @ModelAttribute("orderInfo") @Validated OrderInfo orderInfo, //
                                        BindingResult result, //
                                        final RedirectAttributes redirectAttributes) {
        CustomerInfo customerInfo = null;
        if (orderInfo != null) {
            customerInfo = orderInfo.getCustomerInfo();
        }
        if (result.hasErrors()) {
            customerInfo.setValid(false);
            return "orderEdit";
        }
        customerInfo.setValid(true);

        orderInfo.setCustomerInfo(customerInfo);
        try {
            this.orderDAO.updateCustomerInfo(orderInfo);
            this.orderDetailDAO.updateOrderDetails(orderInfo);
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "orderEdit";
        }

        return "redirect:/order?orderId=" + orderInfo.getId();
    }

    @RequestMapping(value = {"/deleteOrder"}, method = RequestMethod.POST)
    public String orderDelete(Model model, @RequestParam("orderId") String orderId) {

        OrderInfo orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.getOrderInfo(orderId);
        }
        if (orderInfo == null) {
            return "redirect:/orderList";
        }

        try {
            orderDAO.delete(orderId);
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "order";
        }

        return "redirect:/orderList";
    }
}
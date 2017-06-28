package student.StudentGo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import student.StudentGo.model.CartInfo;
import student.StudentGo.utils.Utils;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RootController {

    @ModelAttribute("cartSize")
    public int getCartSize(HttpServletRequest request) {
        CartInfo cartInfo = Utils.getCartInSession(request);
        return cartInfo.getCartLines().size();
    }

}

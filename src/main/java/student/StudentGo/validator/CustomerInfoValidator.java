package student.StudentGo.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import student.StudentGo.model.CustomerInfo;

@Component
public class CustomerInfoValidator implements Validator {


    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == CustomerInfo.class;
    }

    @Override
    public void validate(Object target, Errors errors) {
        CustomerInfo custInfo = (CustomerInfo) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.customerForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "CNP", "NotEmpty.customerForm.CNP");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ID_Legitimatie", "NotEmpty.customerForm.ID_Legitimatie");


    }

}
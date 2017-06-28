package student.StudentGo.model;


import student.StudentGo.entity.Customer;

public class CustomerInfo {

    private String name;
    private String CNP;
    private String ID_Legitimatie;

    private boolean valid;

    public CustomerInfo() {
    }

    public CustomerInfo(String name, String CNP, String ID_Legitimatie) {
        this.name = name;
        this.CNP = CNP;
        this.ID_Legitimatie = ID_Legitimatie;
    }

    public CustomerInfo(Customer customer) {
        if (customer != null) {
            this.name = customer.getName();
            this.CNP = customer.getCNP();
            this.ID_Legitimatie = customer.getID_Legitimatie();
        }
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getCNP() {
        return CNP;
    }

    public void setCNP(String CNP) {
        this.CNP = CNP;
    }

    public String getID_Legitimatie() {
        return ID_Legitimatie;
    }

    public void setID_Legitimatie(String ID_Legitimatie) {
        this.ID_Legitimatie = ID_Legitimatie;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

}
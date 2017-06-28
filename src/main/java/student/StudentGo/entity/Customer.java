package student.StudentGo.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Customer {
    private String name;
    private String CNP;
    private String ID_Legitimatie;

    public Customer(){
    }
    public Customer(String name, String CNP, String ID_Legitimatie){
        this.name = name;
        this.CNP = CNP;
        this.ID_Legitimatie = ID_Legitimatie;
    }

    @Column(name = "Customer_Name", length = 255, nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "Customer_CNP", length = 255, nullable = false)
    public String getCNP() {
        return CNP;
    }

    public void setCNP(String CNP) {
        this.CNP = CNP;
    }


    @Column(name = "Customer_ID_Legitimatie", length = 128, nullable = false)
    public String getID_Legitimatie() {
        return ID_Legitimatie;
    }

    public void setID_Legitimatie(String ID_Legitimatie) {
        this.ID_Legitimatie = ID_Legitimatie;
    }
}

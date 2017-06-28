package student.StudentGo.dao;

import student.StudentGo.entity.Product;
import student.StudentGo.model.PaginationResult;
import student.StudentGo.model.ProductInfo;

public interface ProductDAO {

    public Product findProduct(String code);

    public ProductInfo findProductInfo(String code);

    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage);

    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage, String likeName);

    public void save(ProductInfo productInfo);

    public void delete(String code);

}
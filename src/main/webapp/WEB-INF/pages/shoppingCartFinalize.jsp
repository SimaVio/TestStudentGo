<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Finalizare cumparaturi</title>

    <jsp:include page="_styles.jsp"/>

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>


<div class="container">
    <div class="row">
        <div class="col-md-12">


            <h2>Finalize</h2>

            <div class="text-center">
                <h2><b></b></h2>
                <h4>Numarul de ordine este: <span class="label label-success label-">${lastOrderedCart.orderNum}</span></h4>
            </div>

            <jsp:include page="_footer.jsp"/>
        </div>
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Order Confirmation</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/proList.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div class="head ding">
        <%@ include file="header.jsp" %>
    </div>

    <div class="cart mt">
        <div class="site">
            <p class="wrapper clearfix">
                <span class="fl">Order Confirmation</span>
            </p>
        </div>

        <div class="table wrapper">
            <div class="tr">
                <div style="width: 20%">Product</div>
                <div style="width: 20%">Price</div>
                <div style="width: 20%">Quantity</div>
                <div style="width: 20%">Subtotal</div>
            </div>

            <c:forEach items="${order}" var="item">
                <div class="th">
                    <input type="hidden" name="id" value="${item.id}">
                    <div class="pro clearfix" style="width: 400px;">
                        <a class="fl" href="${pageContext.request.contextPath}/jsp/IndexServlet?action=productdetails&product_id=${item.productId}">
                            <dl class="clearfix">
                                <dt class="fl"><img src="/photo/${item.product.productImage}" alt="${item.product.productName}" loading="lazy" style="width: 100px; height: 100px;"></dt>
                                <dt class="fl" style="width: 220px; font-size: 15px;">
                                    <p>${item.product.productName}</p>
                                </dt>
                            </dl>
                        </a>
                    </div>
                    <div class="price" style="width: 200px; text-align: center;">￥${item.product.productPrice}0</div>
                    <div class="number" style="width: 200px; text-align: center;">
                        <p class="num clearfix">
                            <span class="fl">${item.cartNum}</span>
                        </p>
                    </div>
                    <div class="price sAll" style="width: 20%; text-align: center;">￥${item.product.productPrice * item.cartNum}</div>
                </div>
            </c:forEach>

            <div class="address-form">
                <label for="address">Address:</label>
                <input type="text" id="address" value="${address.address}" class="form-input" placeholder="Enter your address">

                <label for="phone">Telephone:</label>
                <input type="text" id="phone" value="${address.phone}" class="form-input" placeholder="Enter your telephone number">

                <label for="realname">Real Name:</label>
                <input type="text" id="realname" value="${address.name}" class="form-input" placeholder="Enter your real name">
            </div>

            <div class="tr clearfix">
                <p class="fr">
                    <span>Total items: <small id="sl">${count}</small></span>
                    <span>Total: <small id="all">￥${totalprice}</small></span>
                    <button id="payButton" class="btn-pay">Pay Now</button>
                </p>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="top">
            <div class="wrapper">
                <div class="clearfix">
                    <a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot1.png" alt="Return Policy"/></a>
                    <span class="fl">7-day no-questions-asked return policy</span>
                </div>
                <div class="clearfix">
                    <a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot2.png" alt="Exchange Policy"/></a>
                    <span class="fl">15-day free exchange</span>
                </div>
                <div class="clearfix">
                    <a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot3.png" alt="Free Shipping"/></a>
                    <span class="fl">Free shipping on orders over 599</span>
                </div>
                <div class="clearfix">
                    <a href="#2" class="fl"><img src="${pageContext.request.contextPath}/img/foot4.png" alt="Mobile Services"/></a>
                    <span class="fl">Mobile special services</span>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#payButton").click(function () {
                const address = $("#address").val();
                const phone = $("#phone").val();
                const realname = $("#realname").val();
                let ids = [];

                $("input[name='id']").each(function () {
                    ids.push($(this).val());
                });

                if (!address) {
                    alert("Address cannot be empty!");
                    return false;
                } else if (!phone) {
                    alert("Telephone cannot be empty!");
                    return false;
                } else if (!realname) {
                    alert("Real name cannot be empty!");
                    return false;
                }

                const url = `${pageContext.request.contextPath}/jsp/IndexServlet?action=addorder&str=${encodeURIComponent(ids.join(','))}&address=${encodeURIComponent(address)}&phone=${encodeURIComponent(phone)}&realname=${encodeURIComponent(realname)}`;
                location.href = url;
                alert("Payment successful!");
            });
        });
    </script>

    <script src="${pageContext.request.contextPath}/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/js/pro.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>
</html>

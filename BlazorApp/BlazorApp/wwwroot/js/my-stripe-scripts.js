console.log("my-stripe-scripts.js LOADED");

redirectToCheckout = function (sessionId) {
    var stripe = Stripe('pk_test_51IpzH0EpnVBzkA6JDByu3yHLIUF9tkcFTW5VxS6YIIgiIGif8PTMv2a0xcj2zjJYAoWHLJRJjABPhoFV6IHIw0EI005wZQtP4y');

    stripe.redirectToCheckout({
        sessionId: sessionId
    });
};


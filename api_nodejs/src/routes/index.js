const { checkAdmin, jwtAuth } = require('../middlewares/authorization');
const errorHandling = require('../utils/errorHandling');
const AuthRoute = require('./auth.route');
const UserRoute = require('./user.route');
const VoucherRoute = require('./voucher.route');
const ProductRoute = require('./product.route');
<<<<<<< HEAD
=======
const CartRoute = require('./cart.route');
>>>>>>> api/nodejs
function route(app) {
  app.get('/health', (req, res) => {
    res.send('OK');
  });
  app.use('/api/v1/auth', AuthRoute);
  app.use('/api/v1/products', ProductRoute);
  app.use(jwtAuth);
  app.get('/api/test', (req, res) => res.send(req.user));
  app.use('/api/v1/users', UserRoute);
  app.use('/api/v1/vouchers', VoucherRoute);
<<<<<<< HEAD
=======
  app.use('/api/v1/cart', CartRoute);
>>>>>>> api/nodejs
  app.use((err, req, res, next) => {
    errorHandling(err, res);
  });
}
module.exports = route;

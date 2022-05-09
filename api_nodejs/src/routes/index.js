const { checkAdmin, jwtAuth } = require('../middlewares/authorization');
const errorHandling = require('../utils/errorHandling');
const AuthRoute = require('./auth.route');
const UserRoute = require('./user.route');
function route(app) {
  app.get('/health', (req, res) => {
    res.send('OK');
  });
  app.use('/api/v1/auth', AuthRoute);
  app.use(jwtAuth);
  app.get('/api/test', (req, res) => res.send(req.user));
  app.use('/api/v1/users', checkAdmin, UserRoute);
  app.use((err, req, res, next) => {
    errorHandling(err, res);
  });
}
module.exports = route;

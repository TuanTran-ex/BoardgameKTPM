const express = require('express');
require('dotenv').config();
const cors = require('cors');
const path = require('path');
const logger = require('./utils/logger');
const connectDB = require('./utils/connectDB');
const route = require('./routes');
const { exit } = require('process');
const { sleep } = require('./utils/utils');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded());
app.use(express.static(path.join(__dirname, 'public')));
app.use(cors());
route(app);
sleep(40000).then(() => {
    const check = connectDB();
    logger.info(check);
    if (!check) exit(0);
    app.listen(port, () => {
      logger.info(`App listen at ${port}`);
    });
  }
);
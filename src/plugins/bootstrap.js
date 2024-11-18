'use strict'

const fp = require('fastify-plugin');

const { POSTGRES, NODE_ENV } = require('../config');
const DBService = require('../services/db.service');
const DBPool = require('../db/db.pool');

function bootstrap (fastify, opts, done) {
  // Initializing services
  const dbPool = new DBPool(POSTGRES.CONFIG);
  const dbService = new DBService(dbPool);
  // decorating server
  fastify.decorate('nodeEnv', NODE_ENV);
  fastify.decorate('dbService', dbService);

  done();
};

module.exports = fp(bootstrap)

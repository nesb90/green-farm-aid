'use strict'

const { SERVER } = require('../config');

module.exports = async function health (fastify) {
  fastify.route({
    method: 'GET',
    url: `${SERVER.API_ROUTE.V1}/health`,
    schema: {
      summary: 'Health check endpoint',
      description: 'Checks if the API server is operational.'
    },
    handler: async function (request, reply) {
      const dbStatus = await fastify.dbService.isConnected()
      reply
        .code(200)
        .header('Content-Type', 'application/json')
        .send({ dbStatus })
    }
  });
};

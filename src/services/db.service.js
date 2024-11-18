class DBService {
  constructor(dbPool) {
    this.dbPool = dbPool
  }

  async getClient () {
    return await this.dbPool.getClient()
  }

  async isConnected () {
    try {
      const dbClient = await this.getClient()
      return {
        isConnected: dbClient._client.readyForQuery
      }
    } catch (error) {
      return {
        isConnected: false,
        error
      }
    }
  }

  async doQuery (sql, params = []) {
    let dbClient

    try {
      dbClient = await this.getClient()
      return await dbClient.query(sql, params)
    } catch (error) {
      console.error(`Something went wrong wile executing query '${sql}' with params '${params}'`, error)
      throw error
    } finally {
      dbClient && dbClient.release()
    }
  }
}

module.exports = DBService

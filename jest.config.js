module.exports = {
  reporters: [['jest-silent-reporter', { showPaths: true, useDots: true, showWarnings: false }]],
  collectCoverageFrom: [
    'src/**/*.js',
    '!src/server.js',
    '!src/config/*.js',
    '!src/db/**/*.js',
    '!src/plugins/*.js',
    '!src/controllers/uploadResultsController.js'
  ],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/src/$1'
  },
  setupFilesAfterEnv: [
    '<rootDir>/jest.defaultTimeout.js'
  ]
}

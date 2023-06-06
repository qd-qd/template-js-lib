export default {
  transform: {
    "^.+\\.(t|j)sx?$": "@swc/jest",
  },
  coverageThreshold: {
    global: {
      lines: 80,
    },
  },
};

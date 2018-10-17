module.exports = {
  presets: ["@babel/preset-react"],
  plugins: [
    "relay",
    "@babel/plugin-transform-arrow-functions",
    "@babel/plugin-proposal-object-rest-spread",
    "@babel/plugin-proposal-export-namespace-from",
    "@babel/plugin-proposal-export-default-from",
    "emotion",
    "react-hot-loader/babel"
  ]
};

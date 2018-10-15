module.exports = {
  presets: ["@babel/preset-react"],
  plugins: [
    "@babel/plugin-transform-arrow-functions",
    "@babel/plugin-proposal-object-rest-spread",
    "@babel/plugin-proposal-export-namespace-from",
    "@babel/plugin-proposal-export-default-from",
    "react-hot-loader/babel"
  ]
};

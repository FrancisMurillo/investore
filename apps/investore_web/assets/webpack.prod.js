const merge = require("webpack-merge");
const CleanWebpackPlugin = require("clean-webpack-plugin");

const config = require("./webpack.config.js");

module.exports = merge(config, {
  mode: "production",
  plugins: [new CleanWebpackPlugin(["_build"])]
});

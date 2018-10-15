const merge = require("webpack-merge");

const config = require("./webpack.config.js");

module.exports = merge(config, {
  mode: "development",
  devtool: "inline-source-map",
  devServer: {
    contentBase: "./_build",
    port: 41080,
    historyApiFallback: true,
    inline: true,
    host: "0.0.0.0",
    hot: true,
    compress: true,
    stats: {
      colors: true,
      reasons: true,
      chunks: false
    },
    overlay: {
      warnings: true,
      errors: true
    }
  }
});

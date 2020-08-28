var path = require("path");

module.exports = {
  entry: "./src/js/index.js",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "main.bundle.js",
  },
  stats: {
    colors: true,
  },
  watch: false,
  watchOptions: {
    aggregateTimeout: 10000,
    ignored: ["node_modules/**"],
  },
  mode: "development",
  devtool: "source-map",
  optimization: {
    splitChunks: {
      chunks: "all",
      filename: "vendors.main.bundle.js",
    },
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        loader: "babel-loader",
      },
    ],
  },
  resolve: {
    alias: {},
  },
};

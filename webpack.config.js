var path = require("path");

module.exports = {
  entry: {
    // main: "",
    contentPoints: "/src/content/contentPoints/contentPoints.js",
    backgroundPoints: "/src/background/backgroundPoints.js",
    backgroundMain: "/src/background/backgroundMain.js",
  },
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "[name].chunk.js",
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
      filename: false,
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
  

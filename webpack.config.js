const webpack = require('webpack');
const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: path.resolve(__dirname),
  entry: {
    app: './assets/app.js'
  },
  module: {
    loaders: [
      {
        test: /\.css$/,
        use: ExtractTextPlugin.extract({
          use: [
            {
              loader: 'css-loader',
              options: { importLoaders: 1 }
            },
            'postcss-loader'
          ]
        })
      },
      {
          test: /\.js$/,
          loader: 'babel-loader',
          query: {
              presets: ["babel-preset-es2015", "babel-preset-es2016", "babel-preset-es2017"].map(require.resolve)
          }
      }
    ]
  },
  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'assets/js/[name].js'
  },
  stats: {
         colors: true
     },
  devtool: 'source-map',
  plugins: [
    new ExtractTextPlugin('assets/css/[name].css')
  ]
};
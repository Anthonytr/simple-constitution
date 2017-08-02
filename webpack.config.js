const webpack = require('webpack');
const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: path.resolve(__dirname),
  entry: {
    app: './assets/app.js'
  },
  module: {
    rules: [
      {
        test: /\.pcss$/,
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
        use: [
          {
            loader: 'babel-loader',
            query: {
                presets: ['es2015']
            }
          }
        ]
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
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
    }),
    new ExtractTextPlugin('assets/css/[name].css')
  ]
};
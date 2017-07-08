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
      }
    ]
  },
  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'assets/js/[name].js'
  },
  plugins: [
    new ExtractTextPlugin('assets/css/[name].css')
  ]
};
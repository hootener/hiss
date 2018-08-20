const webpack = require('webpack');
const path = require("path");

module.exports = {
    entry: ["./js/index.js", "./scss/main.scss"],
    output: {
        filename: "../../static/js/bundle.js"
    },
    devtool: "source-map",

    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: [
                    /node_modules/
                ],
                use: [
                    { 
                        loader: "babel-loader"
                    }
                ]
            },
            {
                test: /\.scss$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: "[name].css",
                            outputPath: "../../static/css/"
                        }
                    },
                    {
                        loader: 'extract-loader'
                    },
                    {
                        loader: 'css-loader'
                    },
                    {
                        loader: 'postcss-loader'
                    },
                    {
                        loader: 'sass-loader'
                    }
                ]
            }
        ]
    }
};

# react-scripts

This package includes scripts and configuration used by [Create React App](https://github.com/jdcrensh/create-react-app/tree/jdcrensh).<br>
Please refer to its documentation:

* [Getting Started](https://github.com/jdcrensh/create-react-app/blob/jdcrensh/README.md#getting-started) – How to create a new app.
* [User Guide](https://github.com/jdcrensh/create-react-app/blob/jdcrensh/packages/react-scripts/template/README.md) – How to develop apps bootstrapped with Create React App.

## Configuration & Plugin Support (unofficial)

This is an unofficial fork that extends Create React App with an interface for plugins and general configuration.

## Configuration

The ES5 module exported by `cra.config.js` at the app's root is used for configuration. The config module expects the same interface as plugins do with exception to the `plugins` property.

### Example

```js
module.exports = {
  // Load plugins by name and/or by reference. Loading plugins by name is for
  // convenience, eg. `'css-modules'` is the same as `require('react-scripts-plugin-css-modules')`
  plugins: ['css-modules', require('./my-internal-plugin')],

  // Webpack configuration
  apply: (config, options) => {
    return config;
  },
};
```

## Plugin Listing

* [react-scripts-plugin-css-modules](https://www.npmjs.com/package/react-scripts-plugin-css-modules)
* [react-scripts-plugin-no-hashes](https://www.npmjs.com/package/react-scripts-plugin-no-hashes)
* [react-scripts-plugin-no-minify](https://www.npmjs.com/package/react-scripts-plugin-no-minify)
* [react-scripts-plugin-scss](https://www.npmjs.com/package/react-scripts-plugin-scss)

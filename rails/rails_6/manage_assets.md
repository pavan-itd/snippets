# 1. Add jquery in rails 6 application
```bash
$ yarn add bootstrap jquery popper.js
```
* Add below lines to ```/confog/webpack/environment.js```
```javascript
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)
```
* Add ```/app/javascript/packs/application.js```
```javascript
require("jquery")
require("bootstrap")
require("packs/custom") // Here is custom jQuery file like packs/custom.js
```
* and in the ```/packs/custom.js```
```javascript
jQuery(window).on('load', function () {
  alert();
});
```

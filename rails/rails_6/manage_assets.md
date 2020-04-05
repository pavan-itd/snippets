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
# 2. Add semantic-ui in rails 6 application
* Add the ```gem 'semantic-ui-sass'``` in gem file
* Add the ```require("semantic-ui-sass")``` in /packs/application.js file
* Run ```yarn add semantic-ui-sass``` it will add package in package.json file

# 3. Run the application in production mode
* 

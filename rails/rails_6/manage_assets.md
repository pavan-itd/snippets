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
* Make changes to ```/config/environments/production.rb``` file
```ruby
config.assets.compile = false
# TO
config.assets.compile = true

config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
to
config.public_file_server.enabled = true
```

* Make changes to ```bin/webpack``` file
```ruby
ENV["RAILS_ENV"] ||= ENV["RACK_ENV"] || "development"
ENV["NODE_ENV"] ||= "development"

# TO

ENV["RAILS_ENV"] ||= ENV["RACK_ENV"] || "production"
ENV["NODE_ENV"] ||= "production"
```

* If you have made changes to ```bin/webpack``` file then run below commands to compile the assets for production.
```bash
# To make it a clean and straightforward compile job, you need to delete public/assets and public/packs folder.

$ RAILS_ENV=production rake assets:precompile
$ bin/webpack
```

* If you don't want to make above changes then you need to run below commands to compile the assests
```bash
$ RAILS_ENV=production rake assets:precompile
$ RAILS_ENV=production RACK_ENV=production NODE_ENV=production bin/webpack
```
# [Reference](https://dev.to/tcgumus/rails-6-webpacker-settings-for-production-1f1e)

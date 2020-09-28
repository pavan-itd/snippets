# Generate API key in Ruby

```ruby
require 'securerandom'
p "test_" + SecureRandom.urlsafe_base64
```

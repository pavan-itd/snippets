### Send files over SFTP
```ruby
require 'open-uri'
require 'net/sftp'

uri = URI.parse('sftp://' + host)
Net::SFTP.start(uri.host, username, password: '', port: 22) do |sftp|
    sftp.upload(file.txt, "./#{uri.path}/file.txt")
end

```

# Send attachment from form directly in mailer

```ruby
if career['attachment']
  attachments[career['attachment'].original_filename] = File.open(career['attachment'].path, 'rb'){|f| f.read}
end
```

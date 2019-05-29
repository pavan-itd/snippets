# Show notice messages

**- Add below code to application helper**

```ruby
def flash_class(level)
  case level
      when 'notice' then 'alert alert-info'
      when 'success' then 'alert alert-success'
      when 'error' then 'alert alert-danger'
      when 'alert' then 'alert alert-danger'
  end
end
```

**- Add below code to application.html.erb file**
```erb
<div class="container">
    <% flash.each do |key, value| %>
      <div class="<%= flash_class(key) %>" role="alert">
        <%= value %>
      </div>
    <% end %>
</div>
```

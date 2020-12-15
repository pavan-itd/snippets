# Submit form without model
```erb
<%= form_tag '/portal/dashboards/update_logo', enctype: "multipart/form-data", method: :put do %>
  <h6 class="card-title">Logo</h6>
  <div class="input-group mb-3">
    <div class="custom-file">
      <%= file_field_tag 'logo'%>
      <label class="custom-file-label" for="logo">Choose file</label>
    </div>
  </div>
  <%= submit_tag 'Save', class: 'btn btn-secondary' %>
<% end %>
```

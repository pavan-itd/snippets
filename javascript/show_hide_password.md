# Show and hide password using JQuery

### Markup

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Show/Hide Password</title>
</head>
<body>
  <input type="password" name="password" class="password" id="password">

  <script type="text/javascript" src="../jquery.min.js"></script>
  <script type="text/javascript" src="./script.js"></script>
</body>
</html>
```

### Jquery

```javascript
$(function () {
  // Append checkbox after the password field
  $('input[type="password"]').after(
    '<input type="checkbox" class="sp_password">Show password'
  );

  // Show hide the password
  $('.sp_password').change(function () {
    var prev = $(this).prev();

    var value = prev.val();
    var type = prev.attr('type');

    var id = prev.attr('id');
    var cls = prev.attr('class');
    var name = prev.attr('name');

    var new_type = (type == 'password') ? 'text' : 'password';
    prev.remove();

    $(this).before(
      '<input type="' + new_type
      + '" id="' + id
      + '" class="' + cls
      + '" name="' + name
      + '" value="' + value + '">');
  });
});
```

### Short version

```javascript
$(function () {
  // Append checkbox after the password field
  $('input[type="password"]').after(
    '<input type="checkbox" class="sp_password">Show password'
  );

  // Show hide the password
  $('.sp_password').change(function () {
    var prev = $(this).prev();
    
    var type = prev.attr('type');

    if (type == 'password') {
      prev.prop('type', 'text') ;
    } else {
      prev.prop('type', 'password');
    }
  });
});
```

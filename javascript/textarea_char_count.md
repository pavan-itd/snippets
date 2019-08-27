# Text area character counter

### Markup
```html
<form>
  <label for="textareaChars">No more than 100 characters</label>
 
  <textarea id="textareaChars" maxlength="100"></textarea>
  
  <span id="chars">100</span> characters remaining
  
</form>
```

### JQuery

```javascript
var maxLength = 100;
$('textarea').keyup(function () {
  var length = $(this).val().length;
  var length = maxLength - length;
  $('#chars').text(length);
});
```

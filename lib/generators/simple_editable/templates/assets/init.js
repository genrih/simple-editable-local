$(document).ready(function() {
  $('body, html').on('blur', '[contenteditable=true][object=false]', function (e) {
    var $input = $(e.target),
      key = $input.attr('data-pk'),
      url = $input.attr('data-url');

    $.ajax({
      method: 'POST',
      url: url,
      data: {
        pk: key,
        value: $input.html(),
        text_only: $input.data('data-text-only')
      }
    })
  });

  $('body, html').on('blur', '[contenteditable=true][object=true]', function (e) {
    var $input = $(e.target),
      id = $input.attr('data-id'),
      class_name = $input.attr('data-class'),
      attribute = $input.attr('data-attribute'),
      url = $input.attr('data-url');

    $.ajax({
      method: 'POST',
      url: url,
      data: {
        id: id,
        class_name: class_name,
        attribute: attribute,
        value: $input.html()
      }
    })
  });
});

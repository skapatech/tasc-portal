$(document).ready(function() {
  $('#expertises').on('cocoon:after-insert', function(e, insertedItem) {
    $('.combobox', insertedItem).chosen();
  });
});

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function($) {
  $( ".simple_form.new_link" ).validate({
    rules: {
      "link[base_url]": {
        required: true,
        url: true
      }
    }
  });
})(window.jQuery);


document.addEventListener("turbolinks:load", function() {
  $( ".simple_form.new_link" ).validate({
    rules: {
      "link[base_url]": {
        required: true,
        url: true
      }
    }
  });
});
$(document).ready(function() {

  $('.question').on('submit',function(e) {
    var form = $(e.target);

    e.preventDefault();
      $.ajax({
      type: form.attr("method"),
      url: form.attr("action"),
      data: form.serialize(),
      success: function(data) {
        $('.flashcard').toggleClass('flipped');
         $(".back").append(data)
      }
    });
  });
});

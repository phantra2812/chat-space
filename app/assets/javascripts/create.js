$(document).on('turbolinks:load',(function(){
  function buildHTML(message) {
    var image = (message.image) ? `<img src = ${ message.image }>`: "";
    var html = `<div class="detail">
                  <div class = "name">${ message.name } </div>
                  <div class = "time">${ message.time } </div>
                  <div class = "message">${ message.body } </br>
                                         ${ image }
                                          </div>
                  </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();

    $this = $(this)[0];
    var formData = new FormData($(this).get(0));
    var url = $(this).attr('action');

    $.ajax ({
      url:          url,
      type:         "POST",
      dataType:     "json",
      data:         formData,
      processData:  false,
      contentType:  false
    })
    .done (function(data) {
      var html = buildHTML(data);
      $('.right-content__display-message').append(html);
      $('#message_body').val('');
      $('.right-content__display-message').animate({ scrollTop: $('.right-content__display-message')[0].scrollHeight}, 'slow');
      $('.submit').removeAttr('disabled');
      $this.reset();

    })

    .fail(function(){
      alert('error');
    })
  })
}))

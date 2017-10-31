$(document).on('turbolinks:load',(function(){
  function appendUser(user) {
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
              </div>`
  return html;
  }

  function appendDelete(id, name) {
  var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                <input name='group[user_ids][]' type='hidden' value='${ id }'>
                <p class='chat-group-user__name'>${ name }</p>
                <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
              </div>`
              return html;
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    console.log(input)
    $.ajax ({
      type:         "GET",
      url:          "/users",
      dataType:     "json",
      data:         { keyword: input },
    })

    .done (function(users) {
      $('.user-search-result').empty();
      if (users.length!== 0) {
        users.forEach(function(user){
          var user_list = appendUser(user);
          $('.user-search-result').append(user_list);
        });
      }
    })

    .fail(function(){
      alert('error');
    })
  });

  $(document).on("click", ".user-search-add", function() {
    $(this).parent().remove()
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    var html = appendDelete(id, name);
    console.log('dd')
    $('.chat-group-add-user').append(html);
  })

  $(document).on("click", ".user-search-remove", function() {
    $(this).parent().remove();
  })

}));


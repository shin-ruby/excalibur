$(document).on "turbolinks:load", ->
  $(".editUserLink")
    .on "ajax:success", (e, data, status, xhr) ->
      $('#editUserFormModal').modal('show')
      $('#alert-content').hide()
      $('#editUserName').val(data['name'])
      $('#editUserEmail').val(data['email'])
      $('#editUserPassword').val(data['password'])
      $('#editUserPasswordConfirmation').val(data['password_confirmation'])
      $("#editUserForm").attr('action', '/admin/users/'+data['id'])

  $("#editUserForm")
    .on "ajax:success", (e, data, status, xhr) ->
      $('#editUserFormModal').modal('hide')
      # console.log(data)
      $('#user_'+data['id']+'_name').html( data['name'] )
      $('#user_'+data['id']+'_email').html( data['email'] )
    .on "ajax:error", (e, xhr, status, error) ->
      $('#alert-content').show()
      $('#alert-content #msg').html( xhr.responseText )

  $("#newUserLink")
    .on "ajax:success", (e, data, status, xhr) ->
    	$('#newUserFormModal').modal('show')
  	  $('#alert-content2').hide()

  $("#newUserForm")
  	.on "ajax:error", (e, xhr, status, error) ->
      $('#alert-content2').show()
      # data = xhr.responseText
			# jsonResponse = JSON.parse(data)
      $('#alert-content2 #msg').html( xhr.responseText )
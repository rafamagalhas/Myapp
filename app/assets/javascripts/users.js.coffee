switch_avatar_upload = ->
	if $('#user_use_provider_avatar').size()>0
  		if document.getElementById('user_use_provider_avatar').checked
  			$('#avatar_upload').hide('fast')
  		else
  			$('#avatar_upload').show('fast')

set_click_handler = ->
  	if $('#user_use_provider_avatar').size()>0
  		$('#user_use_provider_avatar').click ->
  			switch_avatar_upload() 

$(window).bind('page:change', switch_avatar_upload)
$(window).bind('page:change', set_click_handler)

jQuery ->
	set_click_handler()
	switch_avatar_upload() 
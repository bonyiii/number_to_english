jQuery.ajaxSetup({ 
	beforeSend: function (xhr) { 
		xhr.setRequestHeader("Accept", "text/javascript"); 
	} 
});

jQuery(function($) {
  $("#convert_number").keyup(function() {
    $.post(this.form.action, $(this.form).serialize(), null,'script');
  });
})
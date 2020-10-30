jQuery.validator.setDefaults({
  debug: true,
  success: "valid"
});

$("form").validate({
  ignore: ":hidden",
  validClass: "is-valid",
  errorClass: "is-invalid",  
  rules: {
    first_name: {
      required: true,
    },
    last_name: {
      required: true,
    },
    email: {
      required: true,
      email: true
    },
    mobile_number: {
      required: true,
      pattern: /^(09|\+639)\d{9}$/
    }
  },
  messages: {
    first_name: {
      required: 'Please enter your firstname'
    },
    last_name: {
      required: 'Please enter your lastname'
    },
    email: {
      required: 'Please enter your email',
      regex: 'Please enter a valid email'
    },
    mobile_number: {
      required: 'Please enter your mobile number',
      regex: "Please enter a valid mobile number" 
    }
  },
  wrapper: 'span',
  errorPlacement: function (error, element) {
    error.css({
      "color": "#dc3545",
      "width": "100%",
      "font-size": "80%",
      "margin-top": ".25rem"
    });
    error.insertAfter(element);
  },
  submitHandler: function(form) {
    var serialized_data = $(form).serialize();
    $.ajax({
      url: "/tasker",
      method: "GET",
      dataType: "JSON",
      data: serialized_data,
      success:function(data){
        if(data == "Your inquiry was send successfuly"){
          swal('Your inquiry was successfuly send', '', 'success');
          $("input, textarea").val("").removeClass("is-valid");
          $("select").removeClass("is-valid");
        }
      },
      error:function(err){
        console.log(err);
      }
    });
  }
});

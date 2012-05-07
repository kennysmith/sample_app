$(function() {
  $("#credit-card input, #credit-card select").attr("disabled", false);

  $("form:has(#credit-card)").submit(function() {
    var form = this;
    $("#user_submit").attr("disabled", true);
    $("#credit-card input, #credit-card select").attr("name", "");
    $("#credit-card-errors").hide();

    if (!$("#credit-card").is(":visible")) {
      $("#credit-card input, #credit-card select").attr("disabled", true);
      return true;
    }
    
    var card = {
      number:   $("#card_number").val(),
      expMonth: $("#card_month").val(),
      expYear:  $("#card_year").val(),
      cvc:      $("#card_code").val()
    };


    Stripe.createToken(card, function(status, response) {
      if (status === 200) {
        $("#user_last_4_digits").val(response.card.last4);
        $("#user_stripe_token").val(response.id);
        form.submit();
      } else {
        $("#stripe-error-message").text(response.error.message);
        $("#credit-card-errors").show();
        $("#user_submit").attr("disabled", false);
      }
    });

    return false;
  });

  $("#change-card a").click(function() {
    $("#change-card").hide();
    $("#credit-card").show();
    $("#credit_card_number").focus();
    return false;
  });
});

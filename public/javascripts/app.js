// $(window).scroll(function () {
//     if ($(window).scrollTop() > $(window).height()*.3) {
//         $('#scroller').css('top', $(window).scrollTop());
//         $('header').css('display', 'none');
//     }
// });

// $(window).scroll(function () {
//     if ($(window).scrollTop() < $(window).height()*.3) {
//         $('header').css('display', 'block');
//     }
// });

if ( $('.show-options').siblings(".bpost").children(".after-intro").length > 0 ) {
  console.log("moo");
  $('.show-options').click(function () {
    if ( $(this).siblings(".bpost").children(".after-intro").is(":visible") ) {
      $(this).siblings(".bpost").children(".after-intro").hide();
      $(this).html("&#x21a7;");
    }
    else {
      $(this).siblings(".bpost").children(".after-intro").show();
      $(this).html("&#x21bb;");
    }
  });
}
else {
  $('.show-options').hide();
}

$( document ).ready(function() {
  $(window).scroll(function () {
      var winScrollTop = $(window).scrollTop();
      var winHeight = $(window).height();
      var floaterHeight = $('#floater').outerHeight(true);
      //true so the function takes margins into account
      var fromBottom = 20;

      var top = winScrollTop + winHeight - floaterHeight - fromBottom;
      $('#floater').css({
          'top': top + 'px'
      });
  });
});
function load(evt, div) {
    // Declare all variables
    var i,
        tabcontent,
        tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(div).style.display = "block";
    evt.currentTarget.className += " active";
}
;

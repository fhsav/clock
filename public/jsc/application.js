(function() {

  $(".alert").click(function() {
    return $(".alert").hide("slide");
  });

  $("a.preview").click(function() {
    var url;
    url = $(this).attr("data-preview");
    return window.open(url, "preview", "location=1,status=0,scrollbars=0, width=1024,height=768");
  });

}).call(this);

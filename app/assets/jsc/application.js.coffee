# Clock
#   file: application.coffee

#= require lib/vendor/jquery

#= require lib/analytics

$(".alert").click ->
  $(".alert").hide "slide"

$("a.preview").click ->
  url = $(@).attr "data-preview"

  window.open(
    url, "preview", "location=1,status=0,scrollbars=0, width=1024,height=768"
  );

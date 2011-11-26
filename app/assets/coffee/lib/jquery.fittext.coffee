(($) ->
  $.fn.fitText = (kompressor, options) ->
    settings =
      minFontSize: Number.NEGATIVE_INFINITY
      maxFontSize: Number.POSITIVE_INFINITY

    @each ->
      $this = $(this)
      compressor = kompressor or 1
      $.extend settings, options  if options
      resizer = ->
        $this.css "font-size", Math.max(Math.min($this.width() / (compressor * 10), parseFloat(settings.maxFontSize)), parseFloat(settings.minFontSize))

      resizer()
      $(window).resize resizer
) jQuery

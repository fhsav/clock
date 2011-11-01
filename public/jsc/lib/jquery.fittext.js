/* DO NOT MODIFY. This file was compiled Tue, 01 Nov 2011 23:26:34 GMT from
 * /var/www/fhsclock/app/assets/coffee/lib/jquery.fittext.coffee
 */

(function() {
  (function($) {
    return $.fn.fitText = function(kompressor, options) {
      var settings;
      settings = {
        minFontSize: Number.NEGATIVE_INFINITY,
        maxFontSize: Number.POSITIVE_INFINITY
      };
      return this.each(function() {
        var $this, compressor, resizer;
        $this = $(this);
        compressor = kompressor || 1;
        if (options) {
          $.extend(settings, options);
        }
        resizer = function() {
          return $this.css("font-size", Math.max(Math.min($this.width() / (compressor * 10), parseFloat(settings.maxFontSize)), parseFloat(settings.minFontSize)));
        };
        resizer();
        return $(window).resize(resizer);
      });
    };
  })(jQuery);
}).call(this);

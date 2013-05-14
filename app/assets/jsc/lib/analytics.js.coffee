# Clock
#   file: lib/analytics.coffee

# Google Analytics
_gaq = _gaq or []
_gaq.push ["_setAccount", "UA-35167781-1"]
_gaq.push ["_trackPageview"]
(->
  ga = document.createElement("script")
  ga.type = "text/javascript"
  ga.async = true
  ga.src = ((if "https:" is document.location.protocol then "https://ssl" else "http://www")) + ".google-analytics.com/ga.js"
  s = document.getElementsByTagName("script")[0]
  s.parentNode.insertBefore ga, s
)()


# Segment.io
analytics = analytics or []
analytics.load = (e) ->
  t = document.createElement("script")
  t.type = "text/javascript"
  t.async = not 0
  t.src = ((if "https:" is document.location.protocol then "https://" else "http://")) + "d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/" + e + "/analytics.min.js"

  n = document.getElementsByTagName("script")[0]
  n.parentNode.insertBefore t, n
  r = (e) ->
    ->
      analytics.push [e].concat(Array::slice.call(arguments_, 0))

  i = ["identify", "track", "trackLink", "trackForm", "trackClick", "trackSubmit", "pageview", "ab", "alias", "ready"]
  s = 0

  while s < i.length
    analytics[i[s]] = r(i[s])
    s++

analytics.load "w8pcwot"

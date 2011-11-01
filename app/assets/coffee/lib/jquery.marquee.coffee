((A) ->
  A.marquee = version: "1.0.01"
  A.fn.marquee = (E) ->
    F = typeof arguments[0] is "string" and arguments[0]
    D = F and Array::slice.call(arguments, 1) or arguments
    C = (if (@length is 0) then null else A.data(this[0], "marquee"))
    if C and F and @length
      if F.toLowerCase() is "object"
        C
      else
        if C[F]
          B = undefined
          @each (G) ->
            H = A.data(this, "marquee")[F].apply(C, D)
            if G is 0 and H
              unless not H.jquery
                B = A([]).add(H)
              else
                B = H
                false
            else
              B = B.add(H)  if !!H and !!H.jquery

          B or this
        else
          this
    else
      @each ->
        new A.Marquee(this, E)

  A.Marquee = (E, Q) ->
    K = (R) ->
      return false  if F.filter("." + Q.cssShowing).length > 0
      T = F.eq(R)
      Q.beforeshow.apply O, [ M, T ]  if A.isFunction(Q.beforeshow)
      S =
        top: (if Q.yScroll is "top" then "-" else "+") + T.outerHeight() + "px"
        left: 0

      M.data "marquee.showing", true
      T.addClass Q.cssShowing
      T.css(S).animate
        top: "0px"
      , Q.showSpeed, Q.fxEasingShow, ->
        Q.show.apply O, [ M, T ]  if A.isFunction(Q.show)
        M.data "marquee.showing", false
        J T
    J = (S, R) ->
      return false  if L is true
      R = R or Q.pauseSpeed
      if C(S)
        setTimeout (->
          return false  if L is true
          V = S.outerWidth()
          T = V * -1
          U = parseInt(S.css("left"), 10)
          S.animate
            left: T + "px"
          , ((V + U) * Q.scrollSpeed), Q.fxEasingScroll, ->
            I S
        ), R
      else
        if F.length > 1
          setTimeout (->
            return false  if L is true
            S.animate
              top: (if Q.yScroll is "top" then "+" else "-") + M.innerHeight() + "px"
            , Q.showSpeed, Q.fxEasingScroll
            I S
          ), R
    I = (R) ->
      Q.aftershow.apply O, [ M, R ]  if A.isFunction(Q.aftershow)
      R.removeClass Q.cssShowing
      B()
    P = ->
      L = true
      F.filter("." + Q.cssShowing).dequeue().stop()  unless M.data("marquee.showing") is true
    D = ->
      L = false
      J F.filter("." + Q.cssShowing), 1  unless M.data("marquee.showing") is true
    C = (R) ->
      R.outerWidth() > M.innerWidth()
    B = ->
      H++
      if H >= F.length
        return false  if not isNaN(Q.loop) and Q.loop > 0 and (++N >= Q.loop)
        H = 0
      K H
    Q = A.extend({}, A.Marquee.defaults, Q)
    O = this
    M = A(E)
    F = M.find("> li")
    H = -1
    G = false
    L = false
    N = 0
    A.data M[0], "marquee", O
    @pause = ->
      G = true
      P()

    @resume = ->
      G = false
      D()

    @update = ->
      R = F.length
      F = M.find("> li")
      D()  if R <= 1

    if Q.pauseOnHover
      M.hover (->
        return false  if G
        P()
      ), ->
        return false  if G
        D()
    Q.init.apply O, [ M, Q ]  if A.isFunction(Q.init)
    B()

  A.Marquee.defaults =
    yScroll: "top"
    showSpeed: 850
    scrollSpeed: 12
    pauseSpeed: 5000
    pauseOnHover: true
    loop: -1
    fxEasingShow: "swing"
    fxEasingScroll: "linear"
    cssShowing: "marquee-showing"
    init: null
    beforeshow: null
    show: null
    aftershow: null
) jQuery

/* DO NOT MODIFY. This file was compiled Tue, 01 Nov 2011 23:26:34 GMT from
 * /var/www/fhsclock/app/assets/coffee/lib/jquery.marquee.coffee
 */

(function() {
  (function(A) {
    A.marquee = {
      version: "1.0.01"
    };
    A.fn.marquee = function(E) {
      var B, C, D, F;
      F = typeof arguments[0] === "string" && arguments[0];
      D = F && Array.prototype.slice.call(arguments, 1) || arguments;
      C = (this.length === 0 ? null : A.data(this[0], "marquee"));
      if (C && F && this.length) {
        if (F.toLowerCase() === "object") {
          return C;
        } else {
          if (C[F]) {
            B = void 0;
            this.each(function(G) {
              var H;
              H = A.data(this, "marquee")[F].apply(C, D);
              if (G === 0 && H) {
                if (!!H.jquery) {
                  return B = A([]).add(H);
                } else {
                  B = H;
                  return false;
                }
              } else {
                if (!!H && !!H.jquery) {
                  return B = B.add(H);
                }
              }
            });
            return B || this;
          } else {
            return this;
          }
        }
      } else {
        return this.each(function() {
          return new A.Marquee(this, E);
        });
      }
    };
    A.Marquee = function(E, Q) {
      var B, C, D, F, G, H, I, J, K, L, M, N, O, P;
      K = function(R) {
        var S, T;
        if (F.filter("." + Q.cssShowing).length > 0) {
          return false;
        }
        T = F.eq(R);
        if (A.isFunction(Q.beforeshow)) {
          Q.beforeshow.apply(O, [M, T]);
        }
        S = {
          top: (Q.yScroll === "top" ? "-" : "+") + T.outerHeight() + "px",
          left: 0
        };
        M.data("marquee.showing", true);
        T.addClass(Q.cssShowing);
        return T.css(S).animate({
          top: "0px"
        }, Q.showSpeed, Q.fxEasingShow, function() {
          if (A.isFunction(Q.show)) {
            Q.show.apply(O, [M, T]);
          }
          M.data("marquee.showing", false);
          return J(T);
        });
      };
      J = function(S, R) {
        if (L === true) {
          return false;
        }
        R = R || Q.pauseSpeed;
        if (C(S)) {
          return setTimeout((function() {
            var T, U, V;
            if (L === true) {
              return false;
            }
            V = S.outerWidth();
            T = V * -1;
            U = parseInt(S.css("left"), 10);
            return S.animate({
              left: T + "px"
            }, (V + U) * Q.scrollSpeed, Q.fxEasingScroll, function() {
              return I(S);
            });
          }), R);
        } else {
          if (F.length > 1) {
            return setTimeout((function() {
              if (L === true) {
                return false;
              }
              S.animate({
                top: (Q.yScroll === "top" ? "+" : "-") + M.innerHeight() + "px"
              }, Q.showSpeed, Q.fxEasingScroll);
              return I(S);
            }), R);
          }
        }
      };
      I = function(R) {
        if (A.isFunction(Q.aftershow)) {
          Q.aftershow.apply(O, [M, R]);
        }
        R.removeClass(Q.cssShowing);
        return B();
      };
      P = function() {
        var L;
        L = true;
        if (M.data("marquee.showing") !== true) {
          return F.filter("." + Q.cssShowing).dequeue().stop();
        }
      };
      D = function() {
        var L;
        L = false;
        if (M.data("marquee.showing") !== true) {
          return J(F.filter("." + Q.cssShowing), 1);
        }
      };
      C = function(R) {
        return R.outerWidth() > M.innerWidth();
      };
      B = function() {
        var H;
        H++;
        if (H >= F.length) {
          if (!isNaN(Q.loop) && Q.loop > 0 && (++N >= Q.loop)) {
            return false;
          }
          H = 0;
        }
        return K(H);
      };
      Q = A.extend({}, A.Marquee.defaults, Q);
      O = this;
      M = A(E);
      F = M.find("> li");
      H = -1;
      G = false;
      L = false;
      N = 0;
      A.data(M[0], "marquee", O);
      this.pause = function() {
        G = true;
        return P();
      };
      this.resume = function() {
        G = false;
        return D();
      };
      this.update = function() {
        var R;
        R = F.length;
        F = M.find("> li");
        if (R <= 1) {
          return D();
        }
      };
      if (Q.pauseOnHover) {
        M.hover((function() {
          if (G) {
            return false;
          }
          return P();
        }), function() {
          if (G) {
            return false;
          }
          return D();
        });
      }
      if (A.isFunction(Q.init)) {
        Q.init.apply(O, [M, Q]);
      }
      return B();
    };
    return A.Marquee.defaults = {
      yScroll: "top",
      showSpeed: 850,
      scrollSpeed: 12,
      pauseSpeed: 5000,
      pauseOnHover: true,
      loop: -1,
      fxEasingShow: "swing",
      fxEasingScroll: "linear",
      cssShowing: "marquee-showing",
      init: null,
      beforeshow: null,
      show: null,
      aftershow: null
    };
  })(jQuery);
}).call(this);

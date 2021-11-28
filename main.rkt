#lang racket/base

(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html




(define (taiji r)
  (define o1
    (overlay/align "left" "top"
                   (rotate 90 (wedge r 180 "solid" "white"))
                   (circle  r "solid" "black")))
  (define o2
    (overlay/align/offset "right" "top"
                          (rotate 270 (wedge (/ r 2) 180 "solid" "white"))
                          (/ r 2) 0
                          o1))
  (define o3
    (overlay/align/offset "right" "bottom"
                          (rotate 90 (wedge (/ r 2) 180 "solid" "black"))
                          r 0
                          o2))
  (define o4
    (overlay/align/offset "center" "center"
                          (circle (/ r 10) "solid" "black")
                          0 (/ r 2)
                          o3))
  (overlay/align/offset "center" "center"
                        (circle (/ r 10) "solid" "white")
                        0 (- (/ r 2))
                        o4)
  )



(module+ test
  ;; Any code in this `test` submodule runs when this file is run using DrRacket
  ;; or with `raco test`. The code here does not run when this file is
  ;; required by another module.

  (check-equal? (+ 2 2) 4))

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29

  (require racket/cmdline)
  (define who (box "world"))
  (command-line
    #:program "my-program"
    #:once-each
    [("-n" "--name") name "Who to say hello to" (set-box! who name)]
    #:args ()
    (printf "hello ~a~n" (unbox who))))
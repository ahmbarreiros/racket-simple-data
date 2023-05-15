;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Countdown

;; =================
;; Constants:
(define WIDTH 100)
(define HEIGHT 100)
(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))
(define MTS (rectangle WIDTH HEIGHT "solid" "white"))


;; =================
;; Data definitions:

;; Countdown is Natural[10, 0]
;; interp. countdown that goes from 10 to 0
(define C1 10)
(define C2 5)
(define C3 0)

#;
(define (fn-for-countdown c)
  (... c))

;; Template rules used:
;;  - atomic non-distinct: Natural[10, 0]


;; =================
;; Functions:

;; Countdown -> Countdown
;; start the world with ...
;; 
(define (main c)
  (big-bang c                     ; Countdown
            (on-tick   tock)       ; Countdown -> Countdown
            (to-draw   render)))   ; Countdown -> Image

;; Countdown -> Countdown
;; produce the next number of the countdown
(check-expect (tock 10) 9)
(check-expect (tock 5) 4)
(check-expect (tock 0) 0)

;(define (tock c) 0) ;stub
; <template from Countdown>
(define (tock c)
  (if (> c 0)
      (- c 1)
      c))


;; Countdown -> Image
;; render the current state of Countdown
;; !!!
(check-expect (render 10) (place-image (text (number->string 10) 40 "black") CTR-X CTR-Y MTS))

;(define (render c) MTS) ;stub
; <template from Countdown>
(define (render c)
  (place-image (text (number->string c) 40 "black") CTR-X CTR-Y MTS))
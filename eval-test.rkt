#lang racket
(struct const (int) #:transparent)
(struct add (e1 e2) #:transparent)
(struct negate (e) #:transparent)
(struct square (e) #:transparent)

(define (eval-exp e)
  (cond [(const? e) e]
        [(add? e) (let ([v1 (const-int (eval-exp (add-e1 e)))]
                        [v2 (const-int (eval-exp (add-e2 e)))])
                        (const ( + v1 v2 )))]
        [(negate? e) (const ( - (const-int (eval-exp (negate-e e)))))]
        ))


(eval-exp (const 2 ))
(eval-exp (add (const 3) (const 5)))
(eval-exp (negate (const 15)))


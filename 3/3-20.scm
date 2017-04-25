; This diagram was adopted from: https://github.com/huangz1990/SICP-answers/blob/master/chp3/20.rst
; 
;
;          +-------------------------------------------------------+
;global -> |                                                       |
;env       |  z                           x                        |
;          +--|---------------------------|------------------------+
;             |           ^               |          ^
;             |           |               |          |
;             |           |               |      +----------+
;             |           |               |      | x: 17    |
;             |           |               |      | y: 2     |
;             |           |               |      |          |
;             |           |               |      | set-x! -----> ...
;             |           |               |      | set-y! -----> ...
;             |           |               +------->dispatch ---> parameters: m
;             |           |                      |  ^ ^     |    body: ...
;             |           |                      +--|-|-----+
;             |        +----------+                 | |
;             |  E2 -> | x: ------------------------+ |
;             |        | y: --------------------------+
;             |        |          |
;             |        | set-x! -----> ...
;             |        | set-y! -----> ...
;             +--------->dispatch ---> parameters: m
;                      |          |    body: (cond ((eq? m 'car) 'car)
;                      +----------+                ((eq? m 'cdr) 'cdr)
;                                                  ((eq? m 'set-car!) 'set-car!)
;                                                  ((eq? m 'set-cdr!) 'set-cdr!)
;                                                  (else
;                                                    (error "..." m)))
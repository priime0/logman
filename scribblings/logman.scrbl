#lang scribble/manual

@require[@for-label[racket/base racket/date racket/format]]

@(begin (require scribble/eval)
        (define ev (make-base-eval))
        (ev '(require logman racket/logging racket/date)))

@title{logman}
@author[(author+email "Lucas Sta Maria" "lucas@priime.dev")]

@defmodule[logman]

@racket[_logman] is a package with small formatting additions to base logging. In particular, it specifies the message's level and the time it was output. Note that it uses @racket[date-display-format] for its time formatting, which is recommended to be set to @racket['iso-8601].

@defproc[(log-debug [message any/c]) void?]{}
@defproc[(log-info [message any/c]) void?]{}
@defproc[(log-warning [message any/c]) void?]{}
@defproc[(log-error [message any/c]) void?]{}
@defproc[(log-fatal [message any/c]) void?]{}

@examples[#:eval ev
(parameterize ([date-display-format 'iso-8601])
 (with-logging-to-port (current-output-port)
   (lambda ()
     (log-debug "debug information")
     (log-info "regular information")
     (log-warning "warnings")
     (log-error "errors")
     (log-fatal "fatal errors"))
   'debug))
]

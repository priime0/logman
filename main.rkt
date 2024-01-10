#lang racket/base

(require racket/date)
(require racket/logging)
(require racket/format)
(require (prefix-in rkt: 
                    (only-in racket/base
                             log-fatal
                             log-error
                             log-warning
                             log-info
                             log-debug)))

(provide log-debug log-info log-warning log-error log-fatal)

(define (log-format level message)
  (define level+ (string-upcase (symbol->string level)))
  (define level-text (format "[~a]" (~a level+ #:width 5 #:right-pad-string " ")))
  (define time+ (date->string (current-date) (current-seconds)))
  (format "~a ~a - ~a" level-text time+ message))

(define-syntax log-debug
  (syntax-rules ()
    [(_ message)
     (rkt:log-debug (log-format 'debug message))]
    [(log-debug format-string-expr v ...)
     (rkt:log-debug (log-format 'debug (format format-string-expr v ...)))]))

(define-syntax log-info
  (syntax-rules ()
    [(_ message)
     (rkt:log-info (log-format 'info message))]
    [(_ format-string-expr v ...)
     (rkt:log-info (log-format 'info (format format-string-expr v ...)))]))

(define-syntax log-warning
  (syntax-rules ()
    [(_ message)
     (rkt:log-warning (log-format 'warn message))]
    [(_ format-string-expr v ...)
     (rkt:log-warning (log-format 'warn (format format-string-expr v ...)))]))

(define-syntax log-error
  (syntax-rules ()
    [(_ message)
     (rkt:log-error (log-format 'error message))]
    [(_ format-string-expr v ...)
     (rkt:log-error (log-format 'error (format format-string-expr v ...)))]))

(define-syntax log-fatal
  (syntax-rules ()
    [(_ message)
     (rkt:log-fatal (log-format 'fatal message))]
    [(_ format-string-expr v ...)
     (rkt:log-fatal (log-format 'fatal (format format-string-expr v ...)))]))

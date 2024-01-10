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

(define (log-debug message)
  (rkt:log-debug (log-format 'debug message)))

(define (log-info message)
  (rkt:log-info (log-format 'info message)))

(define (log-warning message)
  (rkt:log-warning (log-format 'warn message)))

(define (log-error message)
  (rkt:log-error (log-format 'error message)))

(define (log-fatal message)
  (rkt:log-fatal (log-format 'fatal message)))

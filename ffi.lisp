(in-package lisp-libevent)

(define-foreign-library libevent
  (:unix (:or "libevent.so.4" "libevent.so"))
  (t (:default "libevent")))

(use-foreign-library libevent)

(defcfun ("evhttp_encode_uri" encode-uri)
    :string
  (url :string))
;; (encode-uri "a b")
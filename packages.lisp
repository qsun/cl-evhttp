(in-package :cl-user)

(defpackage :lisp-libevent
  (:use :cl :cl-user :cffi)
  (:export
   :event
   :evhttp
   :event-base
   :event-base-new
   :new-evhttp
   :set-cb
   :set-gencb
   :bind-socket
   :encode-uri
   :event-base-dispatch))
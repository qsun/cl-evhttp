(defpackage lisp-libevent
  (:use :common-lisp :asdf))

(in-package lisp-libevent)

(defsystem lisp-libevent
  :version "0.0.1"
  :license "LLGPL"
  :depends-on (:cffi)
  :components
  ((:file "packages"
          "ffi"
          )))
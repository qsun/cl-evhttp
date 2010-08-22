(require :asdf)
(require :cffi)

(defpackage cl-evhttp
  (:use :common-lisp :asdf :cffi))

(in-package cl-evhttp)

(defsystem cl-evhttp
  :version "0.0.1"
  :license "LLGPL"
  :depends-on (:cffi)
  :components
  ((:file "packages")
   (:file "ffi")))

(in-package cl-evhttp)

;; (setq *evbuffer* (evbuffer-new))
;; (evbuffer-add-printf *evbuffer* "Hello cl-evhttp")

(setq *base* (event-base-new))
(setq *myhttp* (event-http-new *base*))
(evhttp-bind-socket *myhttp* "127.0.0.1" 8090)
(evhttp-set-gencb *myhttp* (callback http-gen-cb-test) (null-pointer))
(event-base-dispatch *base*)

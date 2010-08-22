(in-package cl-evhttp)

(define-foreign-library libevent
  (:unix (:or "libevent.so.4" "libevent.so"))
  (t (:default "libevent")))

(use-foreign-library libevent)

(defcfun ("evhttp_encode_uri" encode-uri)
    :string
  (url :string))
;; (encode-uri "a b")

(defcstruct tailq-entry
            (tqe-next :pointer)
            (tqe-prev :pointer))

(defctype size-t :unsigned-int)

(defcstruct evhttp
  (next tailq-entry)
  (sockets tailq-entry)
  (callback tailq-entry)
  (connections tailq-entry)
  (virtual-hosts tailq-entry)
  (vhost-pattern :string)
  (timeout :int)
  (default-max-headers-size size-t)
  (gencb :pointer)
  (base :pointer))

(defcfun ("event_base_new" event-base-new)
    :pointer)

(defcfun ("evhttp_new" event-http-new)
    evhttp
  (base :pointer))

;; (setq *base* (event-base-new))
;; (setq *myhttp* (event-http-new *base*))

(defcfun ("evhttp_bind_socket" evhttp-bind-socket)
    :int
  (http evhttp)
  (address :string)
  (port :int))
;; (evhttp-bind-socket *myhttp* "127.0.0.1" 8089)

(defcfun ("event_base_dispatch" event-base-dispatch)
    :int
  (base :pointer))
;; (event-base-dispatch *base*)

(defcfun ("evbuffer_new" evbuffer-new)
    :pointer)
(defcfun ("evbuffer_free" evbuffer-free)
    :void
  (evb :pointer))
;; (evbuffer-free (evbuffer-new))


(defcfun ("evbuffer_add_printf" evbuffer-add-printf)
    :void
  (evb :pointer)
  (text :string))
;; (setq *evbuffer* (evbuffer-new))
;; (evbuffer-add-printf *evbuffer* "Hello Clojure")

(defcfun ("evhttp_send_reply" evhttp-send-reply)
    :void
    (req :pointer)
    (code :int)
    (reason :string)
    (databuffer :pointer))

(defcallback http-gen-cb-test 
    :void
    ((req :pointer)
     (arg :pointer))
  ;; (evhttp-request-own req)
    ;; (invoke-debugger)
  (evhttp-send-reply *req* 200 "everything" *evbuffer*))

(defcfun ("evhttp_request_free" evhttp-request-free)
    :void
  (req :pointer))

;; (evhttp-request-free *req*)

(defcfun ("evhttp_request_own" evhttp-request-own)
    :void
  (req :pointer))

(defcfun ("evhttp_set_gencb" evhttp-set-gencb)
    :void
  (evhttp evhttp)
  (callback-function :pointer)
  (arg :pointer))
;; (evhttp-set-gencb *myhttp* (callback http-gen-cb-test) (null-pointer))
  

;; void
;; http_dispatcher_cb(struct evhttp_request *req, void *arg)
;; {

;;         struct evbuffer *evb = evbuffer_new();
;;         event_debug(("%s: called\n", __func__));
;;         evbuffer_add_printf(evb, "DISPATCHER_TEST");

;;         evhttp_send_reply(req, HTTP_OK, "Everything is fine", evb);

;;         evbuffer_free(evb);
;; }




  

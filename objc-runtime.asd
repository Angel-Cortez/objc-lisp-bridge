;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Package: ASDF-USER -*-
(in-package :asdf-user)

(defsystem :objc-runtime 
  :description ""
  :author "Ed L <edward@elangley.org>"
  :license "MIT"
  :depends-on (#:alexandria
               #:uiop
               #:data-lens
               #:serapeum
               #:fwoar-lisputils
               #:cffi
               #:cffi-libffi
               #:trivial-main-thread
               #:trivial-features
               #:cffi-libffi)
  :defsystem-depends-on (#:cffi-grovel
                         #:cffi-libffi)
  :components ((:file "package")
               (:cffi-grovel-file "objc-runtime-types" :depends-on ("package"))
               (:file "readtable" :depends-on ("package"))
               (:file "gcd" :depends-on ("objc-runtime"))
               (:file "objc-runtime" :depends-on ("package" "readtable" "objc-runtime-types"))
               (:file "objc-data-extractors" :depends-on ("objc-runtime" "readtable"))
               (:file "manipulators" :depends-on ("objc-data-extractors" "readtable" "objc-runtime"))))

(defsystem :objc-runtime/scripting-bridge
  :description ""
  :author "Ed L <edward@elangley.org>"
  :license "MIT"
  :depends-on (:objc-runtime
               :data-lens)
  :components ((:file "scripting-bridge")))

(defsystem :objc-runtime/clim-objc-browser
  :description ""
  :author "Ed L <edward@elangley.org>"
  :license "MIT"
  :depends-on (:objc-runtime
               :serapeum
               :alexandria
               :mcclim)
  :components ((:file "clim-objc-browser")))

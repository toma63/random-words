;;;; random-words.asd

(asdf:defsystem #:random-words
  :description "Generate lists of random words for word association."
  :author "Tom Arns <tomrarns@gmail.com>"
  :license  "GPL v3"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria)
  :components ((:file "package")
               (:file "random-words")))

;;;; package.lisp

(defpackage #:random-words
  (:use #:cl)
  (:export #:read-words-file
	   #:random-words
	   #:random-dictionary-words
	   #:random-insane-words
	   #:random-2a-words
	   #:random-countries
	   #:random-names))

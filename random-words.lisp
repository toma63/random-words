;;;; random-words.lisp

(in-package #:random-words)

(defvar *dictionary-words-path* "/usr/share/dict/words"
  "Path to the standard unix words file.")

(defvar *dictionary-insane-path* "/usr/share/dict/american-english-insane"
  "Path to the standard unix words file.")

(defvar *dictionary-2a-words-path* "/usr/share/dict/web2a"
  "Path to the web2a unix words file.")

(defvar *dictionary-countries-path* "/usr/share/zoneinfo/iso3166.tab"
  "Path to the iso3166 countries file.")

(defvar *dictionary-propernames-path* "/usr/share/dict/propernames"
  "Path to the propernames list.")

(defun read-word-file (filepath)
  "given a path to a file of words, parse it into a vector."
  (with-open-file (word-stream filepath :direction :input)
    (let ((words (make-array 250000 :element-type 'string :initial-element ""
			     :adjustable T :fill-pointer 0)))
      (loop for line = (read-line word-stream nil 'eof)
	    until (eq line 'eof)
	    unless (char= (char line 0) #\#)
	      do (vector-push-extend line words))
      words)))

(defun random-words (words-path n)
  "get n random words from the dictionary file at words-path"
  (loop
    with dict = (read-word-file words-path)
    with num-words = (fill-pointer dict)
    repeat n
    collect (aref dict (random num-words))))

(defmacro random-dictionary-words (n)
  "get n random words from the unix words file"
  `(random-words ,*dictionary-words-path* ,n))

(defmacro random-insane-words (n)
  "get n random words from the unix insanely long words file"
  `(random-words ,*dictionary-insane-path* ,n))

(defmacro random-2a-words (n)
  "get n random lines from the unix web2a words file"
  `(random-words ,*dictionary-2a-words-path* ,n))

(defmacro random-countries (n)
  "get n random words from the iso3166 countries file"
  `(random-words ,*dictionary-countries-path* ,n))

(defmacro random-names (n)
  "get n random proper names from the unix propernames file"
  `(random-words ,*dictionary-propernames-path* ,n))


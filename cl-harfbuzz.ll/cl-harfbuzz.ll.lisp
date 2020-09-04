;; cl-harfbuzz.ll.lisp 
;;
;; Copyright (c) 2020 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>


;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package :harfbuzz.ll)

(cffi:define-foreign-library harfbuzz-lib
    (:darwin (:or "libharfbuzz.dylib" "libharfbuzz"))
    (:unix (:or "libharfbuzz.so" "libharfbuzz" "harfbuzz"))
    (t (:default "libharfbuzz")))
(cffi:use-foreign-library harfbuzz-lib)

(autowrap:c-include
 #+darwin"/opt/local/include/hb.h"
 #+freebsd"/home/jeremiah/oss_src/harfbuzz/src/hb.h"
 #+linux"/usr/include/harfbuzz/hb.h"
 #-(or linux freebsd darwin)"hb.h"
 
 :sysincludes (list #+linux"/usr/include/x86_64-linux-gnu/"
                    #+linux"/usr/include/x86_64-linux-gnu/c++/9/"
                    #+darwin"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/"
                    "/usr/local/include")
 :spec-path '(cl-harfbuzz specs)

 :trace-c2ffi t
 
 :exclude-definitions ("^va_list$" "Random" "Signal"
                                   "acos" "asin" "atan" "cos" "sin" "tan"
                                   "log" "exp" "acosh" "cosh" "asinh" "sinh"
                                   "tanh" "atanh"  "sqrt" "floor" "round"
                                   "time" "close" "open" "read" "write"
                                   "sleep" "truncate" "ceil"
                                   "abs" "abort" "random" "remove" "signal")
 :language "c"
 :symbol-regex (("^hb_(.*)$" () "\\1")))

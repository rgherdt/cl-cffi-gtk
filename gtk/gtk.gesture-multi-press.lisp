;;; ----------------------------------------------------------------------------
;;; gtk.gesture-multi-press.lisp
;;;
;;; The documentation of this file is taken from the GTK+ 3 Reference Manual
;;; Version 3.24 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2019 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------
;;;
;;; GtkGestureMultiPress
;;;
;;;     Multipress gesture
;;;
;;; Types and Values
;;;
;;;     GtkGestureMultiPress
;;;
;;; Functions
;;;
;;;     gtk_gesture_multi_press_new
;;;     gtk_gesture_multi_press_set_area
;;;     gtk_gesture_multi_press_get_area
;;;
;;; Signals
;;;
;;;     void  pressed   Run Last
;;;     void  released  Run Last
;;;     void  stopped   Run Last
;;;
;;; Types and Values
;;;
;;;     GtkGestureMultiPress
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GtkEventController
;;;         ╰── GtkGesture
;;;             ╰── GtkGestureSingle
;;;                 ╰── GtkGestureMultiPress
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; struct GtkGestureMultiPress
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkGestureMultiPress" gtk-gesture-multi-press
  (:superclass gtk-gesture-single
   :export t
   :interfaces nil
   :type-initializer "gtk_gesture_multi_press_get_type")
  nil)

#+cl-cffi-gtk-documentation
(setf (documentation 'gtk-gesture-multi-press 'type)
 "@version{2019-3-23}
  @begin{short}
    @sym{gtk-gesture-multi-press} is a @class{gtk-gesture} implementation able
    to recognize multiple clicks on a nearby zone, which can be listened for
    through the \"pressed\" signal.
  @end{short}
  Whenever time or distance between clicks exceed the GTK+ defaults, \"stopped\"
  is emitted, and the click counter is reset.

  Callers may also restrict the area that is considered valid for a > 1
  touch/button press through the function
  @fun{gtk-gesture-multi-press-set-area}, so any click happening outside that
  area is considered to be a first click of its own.
  @begin[Signal Details]{dictionary}
    @subheading{The \"pressed\" signal}
      @begin{pre}
  lambda (gesture n-press x y)    : Run Last
      @end{pre}
      This signal is emitted whenever a button or touch press happens.
      @begin[code]{table}
        @entry[gesture]{The @class{gtk-gesture-multi-press} object which
        received the signal.}
        @entry[n-press]{How many touch/button presses happened with this one.}
        @entry[x]{The X coordinate, in widget allocation coordinates.}
        @entry[y]{The Y coordinate, in widget allocation coordinates.}
      @end{table}
      Since 3.14

    @subheading{The \"released\" signal}
      @begin{pre}
  lambda (gesture n-press x y)    : Run Last
      @end{pre}
      This signal is emitted when a button or touch is released. @arg{n-press}
      will report the number of press that is paired to this event, note that
      \"stopped\" may have been emitted between the press and its release,
      @arg{n-press} will only start over at the next press.
      @begin[code]{table}
        @entry[gesture]{The @class{gtk-gesture-multi-press} object which
        received the signal.}
        @entry[n-press]{Number of press that is paired with this release.}
        @entry[x]{The X coordinate, in widget allocation coordinates.}
        @entry[y]{The Y coordinate, in widget allocation coordinates.}
      @end{table}
      Since 3.14

    @subheading{The \"stopped\" signal}
      @begin{pre}
  lambda (gesture)    : Run Last
      @end{pre}
      This signal is emitted whenever any time/distance threshold has been
      exceeded.
      @begin[code]{table}
        @entry[gesture]{The @class{gtk-gesture-multi-press} object which
        received the signal.}
      @end{table}
  @end{dictionary}
  Since 3.14
  @see-class{gtk-gesture}")

;;; ----------------------------------------------------------------------------
;;; gtk_gesture_multi_press_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-gesture-multi-press-new))

(defun gtk-gesture-multi-press-new (widget)
 #+cl-cffi-gtk-documentation
 "@version{2019-3-23}
  @argument[widget]{a @class{gtk-widget}}
  @return{A newly created @class{gtk-gesture-multi-press}.}
  @begin{short}
    Returns a newly created @class{gtk-gesture} that recognizes single and
    multiple presses.
  @end{short}

  Since 3.14
  @see-function{gtk-gesture-multi-press}"
  (make-instance 'gtk-gesture-multi-press
                 :widget widget))

(export 'gtk-gesture-multi-press-new)

;;; ----------------------------------------------------------------------------
;;; gtk_gesture_multi_press_set_area ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_gesture_multi_press_set_area" gtk-gesture-multi-press-set-area)
         :void
 #+cl-cffi-gtk-documentation
 "@version{2019-3-23}
  @argument[gesture]{a @class{gtk-gesture-multi-press} object}
  @argument[rect]{a @class{gdk-rectangle} to receive coordinates on}
  @begin{short}
    If @arg{rect} is non-@code{nil}, the press area will be checked to be
    confined within the rectangle, otherwise the button count will be reset so
    the press is seen as being the first one.
  @end{short}
  If @arg{rect} is @code{nil}, the area will be reset to an unrestricted state.

  Note: The rectangle is only used to determine whether any non-first click
  falls within the expected area. This is not akin to an input shape.

  Since 3.14
  @see-class{gtk-gesture-multi-press}"
  (gesture (g-object gtk-gesture-multi-press))
  (rect (g-boxed-foreign gdk-rectangle)))

(export 'gtk-gesture-multi-press-set-area)

;;; ----------------------------------------------------------------------------
;;; gtk_gesture_multi_press_get_area ()
;;; ----------------------------------------------------------------------------

;;; TODO 23.3.2019: Test the implementation

(defcfun ("gtk_gesture_multi_press_get_area" %gtk-gesture-multi-press-get-area)
         :boolean
  (gesture (g-object gtk-gesture-multi-press))
  (rect (g-boxed-foreign gdk-rectangle)))

(defun gtk-gesture-multi-press-get-area (gesture)
 #+cl-cffi-gtk-documentation
 "@version{2019-3-23}
  @argument[gesture]{a @class{gtk-gesture-multi-press} object}
  @return{The press area of type @class{gdk-rectangle}.}
  @begin{short}
    If an area was set through the function
    @fun{gtk-gesture-multi-press-set-area}, this function will the press area.
  @end{short}
  See the function @fun{gtk-gesture-multi-press-set-area} for more details on
  what the press area represents.

  Since 3.14
  @see-class{gtk-gesture-multi-press}
  @see-class{gdk-rectangle}
  @see-function{gtk-gesture-multi-press-set-area}"
  (let ((rect (make-gdk-rectangle :x 0 :y 0 :width 0 :height 0)))
    (%gtk-gesture-multi-press-get-area gesture rect)
    rect))

(export 'gtk-gesture-multi-press-get-area)

;;; --- End of file gtk-gesture-multi-press.lisp -------------------------------

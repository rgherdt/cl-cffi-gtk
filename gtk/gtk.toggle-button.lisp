;;; ----------------------------------------------------------------------------
;;; gtk.toggle-button.lisp
;;;
;;; The documentation of this file is taken from the GTK+ 3 Reference Manual
;;; Version 3.24 and modified to document the Lisp binding to the GTK+ library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2020 Dieter Kaiser
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
;;; GtkToggleButton
;;;
;;;     Create buttons which retain their state
;;;
;;; Types and Values
;;;
;;;     GtkToggleButton
;;;
;;; Functions
;;;
;;;     gtk_toggle_button_new
;;;     gtk_toggle_button_new_with_label
;;;     gtk_toggle_button_new_with_mnemonic
;;;     gtk_toggle_button_set_mode
;;;     gtk_toggle_button_get_mode
;;;     gtk_toggle_button_toggled
;;;     gtk_toggle_button_get_active ()                    Accessor
;;;     gtk_toggle_button_set_active ()                    Accessor
;;;     gtk_toggle_button_get_inconsistent ()              Accessor
;;;     gtk_toggle_button_set_inconsistent ()              Accessor
;;;
;;; Properties
;;;
;;;     gboolean  active            Read / Write
;;;     gboolean  draw-indicator    Read / Write
;;;     gboolean  inconsistent      Read / Write
;;;
;;; Signals
;;;
;;;     void	toggled	Run First
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GInitiallyUnowned
;;;         ╰── GtkWidget
;;;             ╰── GtkContainer
;;;                 ╰── GtkBin
;;;                     ╰── GtkButton
;;;                         ╰── GtkToggleButton
;;;                             ├── GtkCheckButton
;;;                             ╰── GtkMenuButton
;;;
;;; Implemented Interfaces
;;;
;;;     GtkToggleButton implements AtkImplementorIface, GtkBuildable,
;;;     GtkActionable and GtkActivatable.
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; Class gtk-toggle-button
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkToggleButton" gtk-toggle-button
  (:superclass gtk-button
   :export t
   :interfaces ("AtkImplementorIface"
                "GtkBuildable"
                "GtkActionable"
                "GtkActivatable")
   :type-initializer "gtk_toggle_button_get_type")
  ((active
    gtk-toggle-button-active
    "active" "gboolean" t t)
   (draw-indicator
    gtk-toggle-button-draw-indicator
    "draw-indicator" "gboolean" t t)
   (inconsistent
    gtk-toggle-button-inconsistent
    "inconsistent" "gboolean" t t)))

#+cl-cffi-gtk-documentation
(setf (documentation 'gtk-toggle-button 'type)
 "@version{2013-4-27}
  @begin{short}
    A @sym{gtk-toggle-button} is a @class{gtk-button} which will remain
    \"pressed-in\" when clicked. Clicking again will cause the toggle button to
    return to its normal state.
  @end{short}

  @image[toggle-button]{}

  A toggle button is created by calling either the @fun{gtk-toggle-button-new}
  or @fun{gtk-toggle-button-new-with-label} functions. If using the former, it
  is advisable to pack a widget, such as a @class{gtk-label} or a
  @class{gtk-image}, into the toggle button's container. See @class{gtk-button}
  for more information.

  The state of a @sym{gtk-toggle-button} can be set and retrieved using the
  @fun{gtk-toggle-button-active} slot access function.

  To simply switch the state of a toggle button, use the
  @fun{gtk-toggle-button-toggled} function.
  @begin[CSS nodes]{dictionary}
    @sym{gtk-toggle-button} has a single CSS node with name @code{button}. To
    differentiate it from a plain @class{gtk-button}, it gets the @code{.toggle}
    style class.
  @end{dictionary}
  @begin[Example]{dictionary}
    Creating two @sym{gtk-toggle-button} widgets.
    @begin{pre}
 void make_toggles (void) {
    GtkWidget *dialog, *toggle1, *toggle2;

    dialog = gtk_dialog_new ();
    toggle1 = gtk_toggle_button_new_with_label (\"Hi, i'm a toggle button.\");

    // Makes this toggle button invisible
    gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle1), TRUE);

    g_signal_connect (toggle1, \"toggled\",
                      G_CALLBACK (output_state), NULL);
    gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dialog)->action_area),
                        toggle1, FALSE, FALSE, 2);

    toggle2 = gtk_toggle_button_new_with_label
                                          (\"Hi, i'm another toggle button.\");
    gtk_toggle_button_set_mode (GTK_TOGGLE_BUTTON (toggle2), FALSE);
    g_signal_connect (toggle2, \"toggled\",
                      G_CALLBACK (output_state), NULL);
    gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dialog)->action_area),
                        toggle2, FALSE, FALSE, 2);

    gtk_widget_show_all (dialog);
 @}
    @end{pre}
  @end{dictionary}
  @begin[Signal Details]{dictionary}
    @subheading{The \"toggled\" signal}
      @begin{pre}
 lambda (togglebutton)    : Run First
      @end{pre}
      Should be connected if you wish to perform an action whenever the
      @sym{gtk-toggle-button}'s state is changed.
      @begin[code]{table}
        @entry[togglebutton]{The object which received the signal.}
      @end{table}
  @end{dictionary}
  @see-slot{gtk-toggle-button-active}
  @see-slot{gtk-toggle-button-draw-indicator}
  @see-slot{gtk-toggle-button-inconsistent}
  @see-class{gtk-button}
  @see-class{gtk-check-button}
  @see-class{gtk-check-menu-item}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- gtk-toggle-button-active -----------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "active" 'gtk-toggle-button) 't)
"The @code{active} property of type @code{:boolean} (Read / Write) @br{}
  If the toggle button should be pressed in. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-toggle-button-active atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-toggle-button-active 'function)
 "@version{2014-4-14}
  @syntax[]{(gtk-toggle-button-active object) => is-active}
  @syntax[]{(setf (gtk-toggle-button-active object) is-active)}
  @argument[object]{a @class{gtk-toggle-button} widget}
  @argument[is-active]{@em{true} or @code{nil}}
  @begin{short}
    Accessor of the @slot[gtk-toggle-button]{active} slot of the
    @class{gtk-toggle-button} class.
  @end{short}

  The @sym{gtk-toggle-button-active} slot access function queries a
  @class{gtk-toggle-button} widget and returns its current state.

  Returns @em{true} if the toggle button is pressed in and @code{nil} if it is
  raised.

  The @sym{(setf gtk-toggle-button-active)} slot access function sets the status
  of the toggle button.

  Set to @em{true} if you want the @class{gtk-toggle-button} to be 'pressed in',
  and @code{nil} to raise it. This action causes the toggled signal to be
  emitted.
  @see-class{gtk-toggle-button}")

;;; --- gtk-toggle-button-draw-indicator ---------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "draw-indicator"
                                               'gtk-toggle-button) 't)
 "The @code{draw-indicator} property of type @code{:boolean}
  (Read / Write) @br{}
  If the toggle part of the button is displayed. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-toggle-button-draw-indicator atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-toggle-button-draw-indicator 'function)
 "@version{2014-4-14}
  Accessor of the @slot[gtk-toggle-button]{draw-indicator} slot of the
  @class{gtk-toggle-button} class.
  @see-class{gtk-toggle-button}")

;;; --- gtk-toggle-button-inconsistent -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "inconsistent"
                                               'gtk-toggle-button) 't)
 "The @code{inconsistent} property of type @code{:boolean}
  (Read / Write) @br{}
  If the toggle button is in an \"in between\" state. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-toggle-button-inconsistent atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-toggle-button-inconsistent 'function)
 "@version{2014-4-14}
  @syntax[]{(gtk-toggle-button object) => setting}
  @syntax[]{(setf (gtk-toggle-button object) setting)}
  @argument[object]{a @class{gtk-toggle-button} widget}
  @argument[setting]{@em{true} if state is inconsistent}
  @begin{short}
    Accessor of the @slot[gtk-toggle-button]{inconsistent} slot of the
    @class{gtk-toggle-button} class.
  @end{short}

  If the user has selected a range of elements, such as some text or
  spreadsheet cells, that are affected by a toggle button, and the current
  values in that range are inconsistent, you may want to display the toggle in
  an \"in between\" state. This function turns on \"in between\" display.
  Normally you would turn off the inconsistent state again if the user toggles
  the toggle button. This has to be done manually, the
  @sym{(setf gtk-toggle-button-inconsistent)} slot access function only affects
  visual appearance, it does not affect the semantics of the button.
  @see-class{gtk-toggle-button}")

;;; ----------------------------------------------------------------------------
;;; gtk-toggle-button-new
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-toggle-button-new))

(defun gtk-toggle-button-new ()
 #+cl-cffi-gtk-documentation
 "@version{2014-11-9}
  @return{A new toggle button.}
  Creates a new toggle button. A widget should be packed into the button, as
  in the function @fun{gtk-button-new}.
  @see-class{gtk-toggle-button}
  @see-function{gtk-button-new}"
  (make-instance 'gtk-toggle-button))

(export 'gtk-toggle-button-new)

;;; ----------------------------------------------------------------------------
;;; gtk-toggle-button-new-with-label
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-toggle-button-new-with-label))

(defun gtk-toggle-button-new-with-label (label)
 #+cl-cffi-gtk-documentation
 "@version{2014-11-9}
  @argument[label]{a string containing the message to be placed in the toggle
    button}
  @return{A new toggle button.}
  Creates a new toggle button with a text label.
  @see-class{gtk-toggle-button}"
  (make-instance 'gtk-toggle-button
                 :label label))

(export 'gtk-toggle-button-new-with-label)

;;; ----------------------------------------------------------------------------
;;; gtk-toggle-button-new-with-mnemonic
;;; ----------------------------------------------------------------------------

;; TODO: Rewrite the implementation in terms of the function make-instance

(defcfun ("gtk_toggle_button_new_with_mnemonic"
           gtk-toggle-button-new-with-mnemonic)
    (g-object gtk-widget)
 #+cl-cffi-gtk-documentation
 "@version{2014-11-9}
  @argument[label]{the text of the button, with an underscore in front of the
    mnemonic character}
  @return{A new toggle button.}
  @short{Creates a new @class{gtk-toggle-button} widget containing a label.}
  The label will be created using the function
  @fun{gtk-label-new-with-mnemonic}, so underscores in label indicate the
  mnemonic for the button.
  @see-class{gtk-toggle-button}
  @see-function{gtk-label-new-with-mnemonic}"
  (label :string))

(export 'gtk-toggle-button-new-with-mnemonic)

;;; ----------------------------------------------------------------------------
;;; gtk_toggle_button_get_mode ()
;;; gtk_toggle_button_set_mode () -> gtk-toggle-button-mode
;;; ----------------------------------------------------------------------------

(defun (setf gtk-toggle-button-mode) (draw-indicator toggle-button)
  (setf (gtk-toggle-button-draw-indicator toggle-button) draw-indicator))

(defun gtk-toggle-button-mode (toggle-button)
 #+cl-cffi-gtk-documentation
 "@version{2020-5-10}
  @syntax[]{(gtk-toggle-button-mode toggle-button) => draw-indicator}
  @syntax[]{(setf (gtk-toggle-button-mode toggle-button) draw-indicator)}
  @argument[toggle-button]{a @class{gtk-toggle-button} widget}
  @argument[draw-indicator]{if @arg{true}, draw the button as a separate
    indicator and label, if @em{false}, draw the button like a normal button}
  @begin{short}
    Accessor of the mode of the toggle button.
  @end{short}

  The function @sym{gtk-toggle-button-mode} retrieves whether the button is
  displayed as a separate indicator and label. The function
  @sym{(setf gtk-toggle-button-mode)} sets whether the button is displayed as
  a separate indicator and label.

  You can call this function on a check button or a radio button with the
  value @em{false} for @arg{draw-indicator} to make the button look like a
  normal button.

  This function only affects instances of classes like @class{gtk-check-button}
  and @class{gtk-radio-button} that derive from @class{gtk-toggle-button}, not
  instances of @class{gtk-toggle-button} itself.
  @begin[Note]{dictionary}
    The function @sym{gtk-toggle-button-mode} is equivalent to the slot access
    function @fun{gtk-toggle-button-draw-indicator}.
  @end{dictionary}
  @see-class{gtk-toggle-button}
  @see-function{gtk-toggle-button-draw-indicator}"
  (gtk-toggle-button-draw-indicator toggle-button))

(export 'gtk-toggle-button-mode)

;;; ----------------------------------------------------------------------------
;;; gtk_toggle_button_toggled ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_toggle_button_toggled" gtk-toggle-button-toggled) :void
 #+cl-cffi-gtk-documentation
 "@version{2014-9-1}
  @argument[toggle-button]{a @class{gtk-toggle-button} widget}
  @begin{short}
    Emits the \"toggled\" signal on the @class{gtk-toggle-button} widget.
  @end{short}
  There is no good reason for an application ever to call this function.
  @see-class{gtk-toggle-button}"
  (toggle-button (g-object gtk-toggle-button)))

(export 'gtk-toggle-button-toggled)

;;; --- End of file gtk.toggle-button.lisp -------------------------------------

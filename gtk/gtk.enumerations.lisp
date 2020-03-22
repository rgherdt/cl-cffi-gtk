;;; ----------------------------------------------------------------------------
;;; gtk.enumerations.lisp
;;;
;;; The documentation of this file is taken from the GTK+ 3 Reference Manual
;;; Version 3.24 and modified to document the Lisp binding to the GTK library.
;;; See <http://www.gtk.org>. The API documentation of the Lisp binding is
;;; available from <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2019 Dieter Kaiser
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
;;; Standard Enumerations
;;;
;;;     Public enumerated types used throughout GTK+
;;;
;;; Types and Values
;;;
;;;     GtkBaselinePosition
;;;     GtkDeleteType
;;;     GtkDirectionType
;;;     GtkJustification
;;;     GtkMovementStep
;;;     GtkOrientation
;;;     GtkPackType
;;;     GtkPositionType
;;;     GtkReliefStyle
;;;     GtkScrollStep
;;;     GtkScrollType
;;;     GtkSelectionMode
;;;     GtkShadowType
;;;     GtkStateFlags
;;;     GtkToolbarStyle
;;;     GtkSortType
;;;
;;; TODO: Move these implementations to other files
;;;
;;;     GtkDragResult
;;;     GtkCornerType
;;;     GtkExpanderStyle
;;;     GtkIMPreeditStyle
;;;     GtkIMStatusStyle
;;;     GtkPathPriorityType
;;;     GtkPathType
;;;     GtkPolicyType
;;;     GtkResizeMode
;;;     GtkStateType
;;;     GtkWindowPosition
;;;     GtkWindowType
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; enum GtkBaselinePosition
;;; ----------------------------------------------------------------------------

#+gtk-3-10
(define-g-enum "GtkBaselinePosition" gtk-baseline-position
  (:export t
   :type-initializer "gtk_baseline_position_get_type")
  (:top 0)
  (:center 1)
  (:bottom 2))

#+(and gtk-3-10 cl-cffi-gtk-documentation)
(setf (gethash 'gtk-baseline-position atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-baseline-position atdoc:*external-symbols*)
 "@version{2014-7-26}
  @begin{short}
    Whenever a container has some form of natural row it may align children in
    that row along a common typographical baseline.
  @end{short}
  If the amount of vertical space in the row is taller than the total requested
  height of the baseline-aligned children then it can use a
  @sym{gtk-baseline-position} to select where to put the baseline inside the
  extra available space.
  @begin{pre}
(define-g-enum \"GtkBaselinePosition\" gtk-baseline-position
  (:export t
   :type-initializer \"gtk_baseline_position_get_type\")
  (:top 0)
  (:center 1)
  (:bottom 2))
  @end{pre}
  @begin[code]{table}
    @entry[:top]{Align the baseline at the top.}
    @entry[:center]{Center the baseline.}
    @entry[:bottom]{Align the baseline at the bottom.}
  @end{table}
  Since 3.10
  @see-class{gtk-box}")

;;; ----------------------------------------------------------------------------
;;; enum GtkCornerType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkCornerType" gtk-corner-type
  (:export t
   :type-initializer "gtk_corner_type_get_type")
  (:top-left 0)
  (:bottom-left 1)
  (:top-right 2)
  (:bottom-right 3))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-corner-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-corner-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Specifies which corner a child widget should be placed in when packed into a
    @class{gtk-scrolled-window} widget. This is effectively the opposite of
    where the scroll bars are placed.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkCornerType\" gtk-corner-type
  (:export t
   :type-initializer \"gtk_corner_type_get_type\")
  (:top-left 0)
  (:bottom-left 1)
  (:top-right 2)
  (:bottom-right 3))
  @end{pre}
  @begin[code]{table}
    @entry[:top-left]{Place the scrollbars on the right and bottom of the widget
      (default behaviour).}
    @entry[:bottom-left]{Place the scrollbars on the top and right of the
      widget.}
    @entry[:top-right]{Place the scrollbars on the left and bottom of the
      widget.}
    @entry[:bottom-right]{Place the scrollbars on the top and left of the
      widget.}
  @end{table}
  @see-class{gtk-scrolled-window}")

;;; ----------------------------------------------------------------------------
;;; enum GtkDeleteType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkDeleteType" gtk-delete-type
  (:export t
   :type-initializer "gtk_delete_type_get_type")
  (:chars 0)
  (:word-ends 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraph-ends 5)
  (:paragraphs 6)
  (:whitespace 7))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-delete-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-delete-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkDeleteType\" gtk-delete-type
  (:export t
   :type-initializer \"gtk_delete_type_get_type\")
  (:chars 0)
  (:word-ends 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraph-ends 5)
  (:paragraphs 6)
  (:whitespace 7))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; enum GtkDirectionType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkDirectionType" gtk-direction-type
  (:export t
   :type-initializer "gtk_direction_type_get_type")
  (:tab-forward 0)
  (:tab-backward 1)
  (:up 2)
  (:down 3)
  (:left 4)
  (:right 5))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-direction-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-direction-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkDirectionType\" gtk-direction-type
  (:export t
   :type-initializer \"gtk_direction_type_get_type\")
  (:tab-forward 0)
  (:tab-backward 1)
  (:up 2)
  (:down 3)
  (:left 4)
  (:right 5))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; enum GtkExpanderStyle
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkExpanderStyle" gtk-expander-style
  (:export t
   :type-initializer "gtk_expander_style_get_type")
  (:collapsed 0)
  (:semi-collapsed 1)
  (:semi-expanded 2)
  (:expanded 3))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-expander-style atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-expander-style atdoc:*external-symbols*)
 "@version{2014-9-7}
  @begin{short}
    Used to specify the style of the expanders drawn by a @class{gtk-tree-view}
    widget.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkExpanderStyle\" gtk-expander-style
  (:export t
   :type-initializer \"gtk_expander_style_get_type\")
  (:collapsed 0)
  (:semi-collapsed 1)
  (:semi-expanded 2)
  (:expanded 3))
  @end{pre}
  @begin[code]{table}
    @entry[:collapsed]{The style used for a collapsed subtree.}
    @entry[:semi-collapsed]{Intermediate style used during animation.}
    @entry[:semi-expanded]{Intermediate style used during animation.}
    @entry[:expanded]{The style used for an expanded subtree.}
  @end{table}
  @see-class{gtk-tree-view}")

;;; ----------------------------------------------------------------------------
;;; enum GtkIMPreeditStyle
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkIMPreeditStyle" gtk-im-preedit-style
  (:export t
   :type-initializer "gtk_im_preedit_style_get_type")
  (:nothing 0)
  (:callback 1)
  (:none 2))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-im-preedit-style atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-im-preedit-style atdoc:*external-symbols*)
 "@version{2014-7-26}
  @short{Style for input method preedit.}
  See also the @slot[gtk-settings]{gtk-im-preedit-style} property.
  @begin{pre}
(define-g-enum \"GtkIMPreeditStyle\" gtk-im-preedit-style
  (:export t
   :type-initializer \"gtk_im_preedit_style_get_type\")
  (:nothing 0)
  (:callback 1)
  (:none 2))
  @end{pre}
  @begin[Warning]{dictionary}
    The enumeration @sym{gtk-im-preedit-style} has been deprecated since version
    3.10 and should not be used in newly-written code.
  @end{dictionary}
  @see-class{gtk-settings}")

;;; ----------------------------------------------------------------------------
;;; enum GtkIMStatusStyle
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkIMStatusStyle" gtk-im-status-style
  (:export t
   :type-initializer "gtk_im_status_style_get_type")
  (:nothing 0)
  (:callback 1)
  (:none 2))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-im-status-style atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-im-status-style atdoc:*external-symbols*)
 "@version{2014-7-26}
  @short{Style for input method status.}
  See also the @slot[gtk-settings]{gtk-im-status-style} property.
  @begin{pre}
(define-g-enum \"GtkIMStatusStyle\" gtk-im-status-style
  (:export t
   :type-initializer \"gtk_im_status_style_get_type\")
  (:nothing 0)
  (:callback 1)
  (:none 2))
  @end{pre}
  @begin[Warning]{dictionary}
    The enumeration @sym{gtk-im-status-style} has been deprecated since version
    3.10 and should not be used in newly-written code.
  @end{dictionary}
  @see-class{gtk-settings}")

;;; ----------------------------------------------------------------------------
;;; enum GtkJustification
;;; ----------------------------------------------------------------------------

;; TODO: Implement a base-type for defining an enumeration

(define-g-enum "GtkJustification" gtk-justification
  (:export t
   :type-initializer "gtk_justification_get_type")
  (:dummy1 -1)  ; Workaround to ensure the base-type is :int for the enumeration
  (:left 0)
  (:right 1)
  (:center 2)
  (:fill 3)
  (:dummy2 65535) ; gtk-text-view-default-attributes returns this value
)

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-justification atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-justification atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Used for justifying the text inside a @class{gtk-label} widget. See also the
    @class{gtk-alignment} widget.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkJustification\" gtk-justification
  (:export t
   :type-initializer \"gtk_justification_get_type\")
  (:left 0)
  (:right 1)
  (:center 2)
  (:fill 3))
  @end{pre}
  @begin[code]{table}
    @entry[:left]{The text is placed at the left edge of the label.}
    @entry[:right]{The text is placed at the right edge of the label.}
    @entry[:center]{The text is placed in the center of the label.}
    @entry[:fill]{The text is placed is distributed across the label.}
  @end{table}
  @see-class{gtk-alignment}
  @see-class{gtk-label}")

;;; ----------------------------------------------------------------------------
;;; enum GtkMovementStep
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkMovementStep" gtk-movement-step
  (:export t
   :type-initializer "gtk_movement_step_get_type")
  (:logical-positions 0)
  (:visual-positions 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraphs 5)
  (:paragraph-ends 6)
  (:pages 7)
  (:buffer-ends 8)
  (:horizontal-pages 9))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-movement-step atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-movement-step atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkMovementStep\" gtk-movement-step
  (:export t
   :type-initializer \"gtk_movement_step_get_type\")
  (:logical-positions 0)
  (:visual-positions 1)
  (:words 2)
  (:display-lines 3)
  (:display-line-ends 4)
  (:paragraphs 5)
  (:paragraph-ends 6)
  (:pages 7)
  (:buffer-ends 8)
  (:horizontal-pages 9))
  @end{pre}
  @begin[code]{table}
    @entry[:logical-positions]{Move forward or back by graphemes.}
    @entry[:visual-positions]{Move left or right by graphemes.}
    @entry[:words]{Move forward or back by words.}
    @entry[:display-lines]{Move up or down lines (wrapped lines).}
    @entry[:display-line-ends]{Move to either end of a line.}
    @entry[:paragraphs]{Move up or down paragraphs (newline-ended lines).}
    @entry[:paragraph-ends]{Move to either end of a paragraph.}
    @entry[:pages]{Move by pages.}
    @entry[:buffer-ends]{Move to ends of the buffer.}
    @entry[:horizontal-pages]{Move horizontally by pages.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum GtkOrientation
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkOrientation" gtk-orientation
  (:export t
   :type-initializer "gtk_orientation_get_type")
  (:horizontal 0)
  (:vertical 1))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-orientation atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-orientation atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Represents the orientation of widgets which can be switched between
    horizontal and vertical orientation on the fly, like @class{gtk-toolbar}.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkOrientation\" gtk-orientation
  (:export t
   :type-initializer \"gtk_orientation_get_type\")
  (:horizontal 0)
  (:vertical 1))
  @end{pre}
  @begin[code]{table}
    @entry[:horizontal]{The widget is in horizontal orientation.}
    @entry[:vertical]{The widget is in vertical orientation.}
  @end{table}
  @see-class{gtk-orientable}
  @see-class{gtk-toolbar}")

;;; ----------------------------------------------------------------------------
;;; enum GtkPackType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkPackType" gtk-pack-type
  (:export t
   :type-initializer "gtk_pack_type_get_type")
  (:start 0)
  (:end 1))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-pack-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-pack-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Represents the packing location of a @class{gtk-box} children.
  @end{short}
  See also @class{gtk-button-box}.
  @begin{pre}
(define-g-enum \"GtkPackType\" gtk-pack-type
  (:export t
   :type-initializer \"gtk_pack_type_get_type\")
  (:start 0)
  (:end 1))
  @end{pre}
  @begin[code]{table}
    @entry[:start]{The child is packed into the start of the box.}
    @entry[:end]{The child is packed into the end of the box.}
  @end{table}
  @see-class{gtk-box}
  @see-class{gtk-button-box}")

;;; ----------------------------------------------------------------------------
;;; enum GtkPathPriorityType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkPathPriorityType" gtk-path-priority-type
  (:export t
   :type-initializer "gtk_path_priority_type_get_type")
  (:lowest 0)
  (:gtk 4)
  (:application 8)
  (:theme 10)
  (:rc 12)
  (:highest 15))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-path-priority-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-path-priority-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkPathPriorityType\" gtk-path-priority-type
  (:export t
   :type-initializer \"gtk_path_priority_type_get_type\")
  (:lowest 0)
  (:gtk 4)
  (:application 8)
  (:theme 10)
  (:rc 12)
  (:highest 15))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; enum GtkPathType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkPathType" gtk-path-type
  (:export t
   :type-initializer "gtk_path_type_get_type")
  (:widget 0)
  (:widget-class 1)
  (:class 2))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-path-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-path-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkPathType\" gtk-path-type
  (:export t
   :type-initializer \"gtk_path_type_get_type\")
  (:widget 0)
  (:widget-class 1)
  (:class 2))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; enum GtkPolicyType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkPolicyType" gtk-policy-type
  (:export t
   :type-initializer "gtk_policy_type_get_type")
  (:always 0)
  (:automatic 1)
  (:never 2))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-policy-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-policy-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{Determines when a scroll bar will be visible.}
  @begin{pre}
(define-g-enum \"GtkPolicyType\" gtk-policy-type
  (:export t
   :type-initializer \"gtk_policy_type_get_type\")
  (:always 0)
  (:automatic 1)
  (:never 2))
  @end{pre}
  @begin[code]{table}
    @entry[:always]{The scrollbar is always visible.}
    @entry[:automatic]{The scrollbar will appear and disappear as necessary.}
    @entry[:never]{The scrollbar will never appear.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum GtkPositionType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkPositionType" gtk-position-type
  (:export t
   :type-initializer "gtk_position_type_get_type")
  (:left 0)
  (:right 1)
  (:top 2)
  (:bottom 3))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-position-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-position-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Describes which edge of a widget a certain feature is positioned at, e. g.
    the tabs of a @class{gtk-notebook} or the label of a @class{gtk-scale}.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkPositionType\" gtk-position-type
  (:export t
   :type-initializer \"gtk_position_type_get_type\")
  (:left 0)
  (:right 1)
  (:top 2)
  (:bottom 3))
  @end{pre}
  @begin[code]{table}
    @entry[:left]{The feature is at the left edge.}
    @entry[:right]{The feature is at the right edge.}
    @entry[:top]{The feature is at the top edge.}
    @entry[:bottom]{The feature is at the bottom edge.}
  @end{table}
  @see-class{gtk-notebook}
  @see-class{gtk-scale}")

;;; ----------------------------------------------------------------------------
;;; enum GtkReliefStyle
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkReliefStyle" gtk-relief-style
  (:export t
   :type-initializer "gtk_relief_style_get_type")
  (:normal 0)
  (:half 1)
  (:none 2))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-relief-style atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-relief-style atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{Indicated the relief to be drawn around a @class{gtk-button} button.}
  @begin{pre}
(define-g-enum \"GtkReliefStyle\" gtk-relief-style
  (:export t
   :type-initializer \"gtk_relief_style_get_type\")
  (:normal 0)
  (:half 1)
  (:none 2))
  @end{pre}
  @begin[code]{table}
    @entry[:normal]{Draw a normal relief.}
    @entry[:half]{Draw a half relief. Deprecated in 3.14, does the same as
      @code{:normal}.}
    @entry[:none]{Draw no relief.}
  @end{table}
  @see-class{gtk-button}")

;;; ----------------------------------------------------------------------------
;;; enum GtkScrollStep
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkScrollStep" gtk-scroll-step
  (:export t
   :type-initializer "gtk_scroll_step_get_type")
  (:steps 0)
  (:pages 1)
  (:ends 2)
  (:horizontal-steps 3)
  (:horizontal-pages 4)
  (:horizontal-ends 5))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-scroll-step atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-scroll-step atdoc:*external-symbols*)
 "@version{2013-3-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkScrollStep\" gtk-scroll-step
  (:export t
   :type-initializer \"gtk_scroll_step_get_type\")
  (:steps 0)
  (:pages 1)
  (:ends 2)
  (:horizontal-steps 3)
  (:horizontal-pages 4)
  (:horizontal-ends 5))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; enum GtkScrollType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkScrollType" gtk-scroll-type
  (:export t
   :type-initializer "gtk_scroll_type_get_type")
  (:none 0)
  (:jump 1)
  (:step-backward 2)
  (:step-forward 3)
  (:page-backward 4)
  (:page-forward 5)
  (:step-up 6)
  (:step-down 7)
  (:page-up 8)
  (:page-down 9)
  (:step-left 10)
  (:step-right 11)
  (:page-left 12)
  (:page-right 13)
  (:start 14)
  (:end 15))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-scroll-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-scroll-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{}
  @begin{pre}
(define-g-enum \"GtkScrollType\" gtk-scroll-type
  (:export t
   :type-initializer \"gtk_scroll_type_get_type\")
  (:none 0)
  (:jump 1)
  (:step-backward 2)
  (:step-forward 3)
  (:page-backward 4)
  (:page-forward 5)
  (:step-up 6)
  (:step-down 7)
  (:page-up 8)
  (:page-down 9)
  (:step-left 10)
  (:step-right 11)
  (:page-left 12)
  (:page-right 13)
  (:start 14)
  (:end 15))
  @end{pre}")

;;; ----------------------------------------------------------------------------
;;; enum GtkSelectionMode
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkSelectionMode" gtk-selection-mode
  (:export t
   :type-initializer "gtk_selection_mode_get_type")
  (:none 0)
  (:single 1)
  (:browse 2)
  (:multiple 3))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-selection-mode atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-selection-mode atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{Used to control what selections users are allowed to make.}
  @begin{pre}
(define-g-enum \"GtkSelectionMode\" gtk-selection-mode
  (:export t
   :type-initializer \"gtk_selection_mode_get_type\")
  (:none 0)
  (:single 1)
  (:browse 2)
  (:multiple 3))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No selection is possible.}
    @entry[:single]{Zero or one element may be selected.}
    @entry[:browse]{Exactly one element is selected. In some circumstances, such
      as initially or during a search operation, it is possible for no element
      to be selected with @code{:browse}. What is really enforced is that the
      user  cannot deselect a currently selected element except by selecting
      another element.}
    @entry[:multiple]{Any number of elements may be selected. The Ctrl key may
      be used to enlarge the selection, and the Shift key to select between the
      focus and the child pointed to. Some widgets may also allow Click-drag to
      select a range of elements.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum GtkShadowType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkShadowType" gtk-shadow-type
  (:export t
   :type-initializer "gtk_shadow_type_get_type")
  (:none 0)
  (:in 1)
  (:out 2)
  (:etched-in 3)
  (:etched-out 4))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-shadow-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-shadow-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Used to change the appearance of an outline typically provided by a
    @class{gtk-frame} widget.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkShadowType\" gtk-shadow-type
  (:export t
   :type-initializer \"gtk_shadow_type_get_type\")
  (:none 0)
  (:in 1)
  (:out 2)
  (:etched-in 3)
  (:etched-out 4))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No outline.}
    @entry[:in]{The outline is bevelled inwards.}
    @entry[:out]{The outline is bevelled outwards like a button.}
    @entry[:etched-in]{The outline has a sunken 3d appearance.}
    @entry[:etched-out]{The outline has a raised 3d appearance.}
  @end{table}
  @see-class{gtk-frame}")

;;; ----------------------------------------------------------------------------
;;; enum GtkStateType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkStateType" gtk-state-type
  (:export t
   :type-initializer "gtk_state_type_get_type")
  (:normal 0)
  (:active 1)
  (:prelight 2)
  (:selected 3)
  (:insensitive 4)
  (:inconsistent 5)
  (:focused 6))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-state-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-state-type atdoc:*external-symbols*)
 "@version{2020-1-18}
  @begin{short}
    This type indicates the current state of a widget.
  @end{short}
  The state determines how the widget is drawn. The @sym{gtk-state-type}
  enumeration is also used to identify different colors in a deprecated
  @code{GtkStyle} object for drawing, so states can be used for subparts of a
  widget as well as entire widgets.
  @begin{pre}
(define-g-enum \"GtkStateType\" gtk-state-type
  (:export t
   :type-initializer \"gtk_state_type_get_type\")
  (:normal 0)
  (:active 1)
  (:prelight 2)
  (:selected 3)
  (:insensitive 4)
  (:inconsistent 5)
  (:focused 6))
  @end{pre}
  @begin[code]{table}
    @entry[:normal]{State during normal operation.}
    @entry[:active]{State of a currently active widget, such as a depressed
      button.}
    @entry[:prelight]{State indicating that the mouse pointer is over the widget
      and the widget will respond to mouse clicks.}
    @entry[:selected]{State of a selected item, such the selected row in a
      list.}
    @entry[:insensitive]{State indicating that the widget is unresponsive to
      user actions.}
    @entry[:inconsistent]{The widget is inconsistent, such as checkbuttons or
      radiobuttons that aren't either set to @em{true} nor @code{nil}, or
      buttons requiring the user attention.}
    @entry[:focused]{The widget has the keyboard focus.}
  @end{table}
  @begin[Warning:]{dictionary}
    The @sym{gtk-state-type} enumeration has been deprecated since version 3.14
    and should not be used in newly-written code. All APIs that are using this
    enumeration have been deprecated in favor of alternatives using the
    @symbol{gtk-state-flags} enumeration.
  @end{dictionary}
  @see-symbol{gtk-state-flags}")

;;; ----------------------------------------------------------------------------
;;; enum GtkStateFlags
;;; ----------------------------------------------------------------------------

(define-g-flags "GtkStateFlags" gtk-state-flags
  (:export t
   :type-initializer "gtk_state_flags_get_type")
  (:normal 0)
  (:active       #.(ash 1 0))
  (:prelight     #.(ash 1 1))
  (:selected     #.(ash 1 2))
  (:insensitive  #.(ash 1 3))
  (:inconsistent #.(ash 1 4))
  (:focused      #.(ash 1 5))
  (:backdrop     #.(ash 1 6))
  #+gtk-3-8
  (:dir-ltr      #.(ash 1 7))
  #+gtk-3-8
  (:dir-rtl      #.(ash 1 8))
  #+gtk-3-12
  (:link         #.(ash 1 9))
  #+gtk-3-12
  (:visited      #.(ash 1 10))
  #+gtk-3-14
  (:checked      #.(ash 1 11))
  #+gtk-3-20
  (:drop-active  #.(ash 1 12))
  )

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-state-flags atdoc:*symbol-name-alias*) "Flags"
      (gethash 'gtk-state-flags atdoc:*external-symbols*)
 "@version{2014-7-26}
  @short{Describes a widget state.}
  Widget states are used to match the widget against CSS pseudo-classes. Note
  that GTK extends the regular CSS classes and sometimes uses different names.
  @begin{pre}
(define-g-flags \"GtkStateFlags\" gtk-state-flags
  (:export t
   :type-initializer \"gtk_state_flags_get_type\")
  (:normal 0)
  (:active       #.(ash 1 0))
  (:prelight     #.(ash 1 1))
  (:selected     #.(ash 1 2))
  (:insensitive  #.(ash 1 3))
  (:inconsistent #.(ash 1 4))
  (:focused      #.(ash 1 5))
  (:backdrop     #.(ash 1 6))
  (:dir-ltr      #.(ash 1 7))
  (:dir-rtl      #.(ash 1 8))
  (:link         #.(ash 1 9))
  (:visited      #.(ash 1 10))
  (:checked      #.(ash 1 11))
  (:drop-active  #.(ash 1 12)))
  @end{pre}
  @begin[code]{table}
    @entry[:normal]{State during normal operation.}
    @entry[:active]{Widget is active.}
    @entry[:prelight]{Widget has a mouse pointer over it.}
    @entry[:selected]{Widget is selected.}
    @entry[:insensitive]{Widget is insensitive.}
    @entry[:inconsistent]{Widget is inconsistent.}
    @entry[:focused]{Widget has the keyboard focus.}
    @entry[:backdrop]{Widget is in a background toplevel window.}
    @entry[:dir-ltr]{Widget is in left-to-right text direction. Since 3.8.}
    @entry[:dir-rtl]{Widget is in right-to-left text direction. Since 3.8.}
    @entry[:link]{Widget is a link. Since 3.12.}
    @entry[:visited]{The location the widget points to has already been visited.
      Since 3.12.}
    @entry[:checked]{Widget is checked. Since 3.14}
    @entry[:drop-active]{Widget is highlighted as a drop target for DND.
      Since 3.20}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum GtkToolbarStyle
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkToolbarStyle" gtk-toolbar-style
  (:export t
   :type-initializer "gtk_toolbar_style_get_type")
  (:icons 0)
  (:text 1)
  (:both 2)
  (:both-horiz 3))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-toolbar-style atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-toolbar-style atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Used to customize the appearance of a @class{gtk-toolbar}. Note that setting
    the toolbar style overrides the user's preferences for the default toolbar
    style. Note that if the button has only a label set and @code{:icons} is
    used, the label will be visible, and vice versa.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkToolbarStyle\" gtk-toolbar-style
  (:export t
   :type-initializer \"gtk_toolbar_style_get_type\")
  (:icons 0)
  (:text 1)
  (:both 2)
  (:both-horiz 3))
  @end{pre}
  @begin[code]{table}
    @entry[:icons]{Buttons display only icons in the toolbar.}
    @entry[:text]{Buttons display only text labels in the toolbar.}
    @entry[:both]{Buttons display text and icons in the toolbar.}
    @entry[:both-horiz]{Buttons display icons and text alongside each other,
      rather than vertically stacked}
  @end{table}
  @see-class{gtk-toolbar}")

;;; ----------------------------------------------------------------------------
;;; enum GtkWindowPosition
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkWindowPosition" gtk-window-position
  (:export t
   :type-initializer "gtk_window_position_get_type")
  (:none 0)
  (:center 1)
  (:mouse 2)
  (:center-always 3)
  (:center-on-parent 4))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-window-position atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-window-position atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Window placement can be influenced using this enumeration. Note that using
    @code{:center-always} is almost always a bad idea. It will not necessarily
    work well with all window managers or on all windowing systems.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkWindowPosition\" gtk-window-position
  (:export t
   :type-initializer \"gtk_window_position_get_type\")
  (:none 0)
  (:center 1)
  (:mouse 2)
  (:center-always 3)
  (:center-on-parent 4))
  @end{pre}
  @begin[code]{table}
    @entry[:none]{No influence is made on placement.}
    @entry[:center]{Windows should be placed in the center of the screen.}
    @entry[:mouse]{Windows should be placed at the current mouse position.}
    @entry[:center-always]{Keep window centered as it changes size, etc.}
    @entry[:center-on-parent]{Center the window on its transient parent
      (see @fun{gtk-window-transient-for}).}
  @end{table}
  @see-function{gtk-window-transient-for}")

;;; ----------------------------------------------------------------------------
;;; enum GtkWindowType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkWindowType" gtk-window-type
  (:export t
   :type-initializer "gtk_window_type_get_type")
  (:toplevel 0)
  (:popup 1))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-window-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-window-type atdoc:*external-symbols*)
 "@version{2013-7-30}
  @begin{short}
    An enumeration for the possible types of a @class{gtk-window} widget.
  @end{short}
  A @class{gtk-window} widget can be one of the types @code{:toplevel} or
  @code{:popup}. Most things you would consider a \"window\" should have type
  @code{:toplevel}; windows with this type are managed by the window manager
  and have a frame by default. Call the function @fun{gtk-window-decorated} to
  toggle the frame. Windows with type @code{:popup} are ignored by the window
  manager; window manager keybindings will not work on them, the window manager
  will not decorate the window with a frame, many GTK+ features that rely on
  the window manager will not work (e. g. resize grips and
  maximization/minimization). The type @code{:popup} is used to implement
  widgets such as @class{gtk-menu} or tooltips that you normally do not think
  of as windows per se. Nearly all windows should be of type @code{:toplevel}.
  In particular, do not use the type @code{:popup} just to turn off the window
  borders; use the function @fun{gtk-window-decorated} for that.
  @begin{pre}
(define-g-enum \"GtkWindowType\" gtk-window-type
  (:export t
   :type-initializer \"gtk_window_type_get_type\")
  (:toplevel 0)
  (:popup 1))
  @end{pre}
  @begin[code]{table}
    @entry[:toplevel]{A regular window, such as a dialog.}
    @entry[:popup]{A special window such as a tooltip.}
  @end{table}
  @see-class{gtk-window}
  @see-class{gtk-menu}
  @see-function{gtk-window-decorated}")

;;; ----------------------------------------------------------------------------
;;; enum GtkSortType
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkSortType" gtk-sort-type
  (:export t
   :type-initializer "gtk_sort_type_get_type")
  (:ascending 0)
  (:descending 1))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-sort-type atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-sort-type atdoc:*external-symbols*)
 "@version{2013-4-18}
  @short{Determines the direction of a sort.}
  @begin{pre}
(define-g-enum \"GtkSortType\" gtk-sort-type
  (:export t
   :type-initializer \"gtk_sort_type_get_type\")
  (:ascending 0)
  (:descending 1))
  @end{pre}
  @begin[code]{table}
    @entry[:ascending]{Sorting is in ascending order.}
    @entry[:descending]{Sorting is in descending order.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; enum GtkDragResult
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkDragResult" gtk-drag-result
  (:export t
   :type-initializer "gtk_drag_result_get_type")
  (:success 0)
  (:no-target 1)
  (:user-cancelled 2)
  (:timeout-expired 3)
  (:grab-broken 4)
  (:error 5))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-drag-result atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-drag-result atdoc:*external-symbols*)
 "@version{2013-4-18}
  @begin{short}
    Gives an indication why a drag operation failed. The value can by obtained
    by connecting to the \"drag-failed\" signal.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkDragResult\" gtk-drag-result
  (:export t
   :type-initializer \"gtk_drag_result_get_type\")
  (:success 0)
  (:no-target 1)
  (:user-cancelled 2)
  (:timeout-expired 3)
  (:grab-broken 4)
  (:error 5))
  @end{pre}
  @begin[code]{table}
    @entry[:success]{The drag operation was successful.}
    @entry[:no-target]{No suitable drag target.}
    @entry[:user-cancelled]{The user cancelled the drag operation.}
    @entry[:timeout-expired]{The drag operation timed out.}
    @entry[:grab-broken]{The pointer or keyboard grab used for the drag
      operation was broken.}
    @entry[:error]{The drag operation failed due to some unspecified error.}
  @end{table}")

;;; --- End of file gtk.enumerations.lisp --------------------------------------

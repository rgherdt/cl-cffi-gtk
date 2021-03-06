;;; ----------------------------------------------------------------------------
;;; gtk.tree-view-column.lisp
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
;;; GtkTreeViewColumn
;;;
;;;     A visible column in a GtkTreeView widget
;;;
;;; Types and Values
;;;
;;;     GtkTreeViewColumnSizing
;;;     GtkTreeViewColumn
;;;
;;; Functions
;;;
;;;     GtkTreeCellDataFunc
;;;
;;;     gtk_tree_view_column_new
;;;     gtk_tree_view_column_new_with_area
;;;     gtk_tree_view_column_new_with_attributes
;;;     gtk_tree_view_column_pack_start
;;;     gtk_tree_view_column_pack_end
;;;     gtk_tree_view_column_clear
;;;     gtk_tree_view_column_add_attribute
;;;     gtk_tree_view_column_set_attributes
;;;     gtk_tree_view_column_set_cell_data_func
;;;     gtk_tree_view_column_clear_attributes
;;;     gtk_tree_view_column_set_spacing                   Accessor
;;;     gtk_tree_view_column_get_spacing                   Accessor
;;;     gtk_tree_view_column_set_visible                   Accessor
;;;     gtk_tree_view_column_get_visible                   Accessor
;;;     gtk_tree_view_column_set_resizable                 Accessor
;;;     gtk_tree_view_column_get_resizable                 Accessor
;;;     gtk_tree_view_column_set_sizing                    Accessor
;;;     gtk_tree_view_column_get_sizing                    Accessor
;;;     gtk_tree_view_column_get_width                     Accessor
;;;     gtk_tree_view_column_get_fixed_width               Accessor
;;;     gtk_tree_view_column_set_fixed_width               Accessor
;;;     gtk_tree_view_column_set_min_width                 Accessor
;;;     gtk_tree_view_column_get_min_width                 Accessor
;;;     gtk_tree_view_column_set_max_width                 Accessor
;;;     gtk_tree_view_column_get_max_width                 Accessor
;;;     gtk_tree_view_column_clicked
;;;     gtk_tree_view_column_set_title                     Accessor
;;;     gtk_tree_view_column_get_title                     Accessor
;;;     gtk_tree_view_column_set_expand                    Accessor
;;;     gtk_tree_view_column_get_expand                    Accessor
;;;     gtk_tree_view_column_set_clickable                 Accessor
;;;     gtk_tree_view_column_get_clickable                 Accessor
;;;     gtk_tree_view_column_set_widget                    Accessor
;;;     gtk_tree_view_column_get_widget                    Accessor
;;;     gtk_tree_view_column_get_button
;;;     gtk_tree_view_column_set_alignment                 Accessor
;;;     gtk_tree_view_column_get_alignment                 Accessor
;;;     gtk_tree_view_column_set_reorderable               Accessor
;;;     gtk_tree_view_column_get_reorderable               Accessor
;;;     gtk_tree_view_column_set_sort_column_id            Accessor
;;;     gtk_tree_view_column_get_sort_column_id            Accessor
;;;     gtk_tree_view_column_set_sort_indicator            Accessor
;;;     gtk_tree_view_column_get_sort_indicator            Accessor
;;;     gtk_tree_view_column_set_sort_order                Accessor
;;;     gtk_tree_view_column_get_sort_order                Accessor
;;;     gtk_tree_view_column_cell_set_cell_data
;;;     gtk_tree_view_column_cell_get_size
;;;     gtk_tree_view_column_cell_get_position
;;;     gtk_tree_view_column_cell_is_visible
;;;     gtk_tree_view_column_focus_cell
;;;     gtk_tree_view_column_queue_resize
;;;     gtk_tree_view_column_get_tree_view
;;;     gtk_tree_view_column_get_x_offset                  Accessor
;;;
;;; Properties
;;;
;;;                  gfloat   alignment         Read / Write
;;;             GtkCellArea*  cell-area         Read / Write / Construct
;;;                gboolean   clickable         Read / Write
;;;                gboolean   expand            Read / Write
;;;                    gint   fixed-width       Read / Write
;;;                    gint   max-width         Read / Write
;;;                    gint   min-width         Read / Write
;;;                gboolean   reorderable       Read / Write
;;;                gboolean   resizable         Read / Write
;;; GtkTreeViewColumnSizing   sizing            Read / Write
;;;                    gint   sort-column-id    Read / Write
;;;                gboolean   sort-indicator    Read / Write
;;;             GtkSortType   sort-order        Read / Write
;;;                    gint   spacing           Read / Write
;;;                   gchar*  title             Read / Write
;;;                gboolean   visible           Read / Write
;;;               GtkWidget*  widget            Read / Write
;;;                    gint   width             Read
;;;                    gint   x-offset          Read
;;;
;;; Signals
;;;
;;;                    void   clicked           Run Last
;;;
;;; Object Hierarchy
;;;
;;;     GObject
;;;     ╰── GInitiallyUnowned
;;;         ╰── GtkTreeViewColumn
;;;
;;; Implemented Interfaces
;;;
;;;     GtkTreeViewColumn implements GtkCellLayout and GtkBuildable.
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; enum GtkTreeViewColumnSizing
;;; ----------------------------------------------------------------------------

(define-g-enum "GtkTreeViewColumnSizing" gtk-tree-view-column-sizing
  (:export t
   :type-initializer "gtk_tree_view_column_sizing_get_type")
  (:grow-only 0)
  (:autosize 1)
  (:fixed 2))

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-sizing atdoc:*symbol-name-alias*) "Enum"
      (gethash 'gtk-tree-view-column-sizing atdoc:*external-symbols*)
 "@version{2013-5-12}
  @begin{short}
    The sizing method the column uses to determine its width. Please note that
    @code{:autosize} are inefficient for large views, and can make columns
    appear choppy.
  @end{short}
  @begin{pre}
(define-g-enum \"GtkTreeViewColumnSizing\" gtk-tree-view-column-sizing
  (:export t
   :type-initializer \"gtk_tree_view_column_sizing_get_type\")
  (:grow-only 0)
  (:autosize 1)
  (:fixed 2))
  @end{pre}
  @begin[code]{table}
    @entry[:grow-only]{Columns only get bigger in reaction to changes in the
      model.}
    @entry[:autosize]{Columns resize to be the optimal size everytime the model
      changes.}
    @entry[:fixed]{Columns are a fixed numbers of pixels wide.}
  @end{table}")

;;; ----------------------------------------------------------------------------
;;; struct GtkTreeViewColumn
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkTreeViewColumn" gtk-tree-view-column
  (:superclass g-initially-unowned
   :export t
   :interfaces ("GtkBuildable"
                "GtkCellLayout")
   :type-initializer "gtk_tree_view_column_get_type")
  ((alignment
    gtk-tree-view-column-alignment
    "alignment" "gfloat" t t)
   (cell-area
    gtk-tree-view-column-cell-area
    "cell-area" "GtkCellArea" t t)
   (clickable
    gtk-tree-view-column-clickable
    "clickable" "gboolean" t t)
   (expand
    gtk-tree-view-column-expand
    "expand" "gboolean" t t)
   (fixed-width
    gtk-tree-view-column-fixed-width
    "fixed-width" "gint" t t)
   (max-width
    gtk-tree-view-column-max-width
    "max-width" "gint" t t)
   (min-width
    gtk-tree-view-column-min-width
    "min-width" "gint" t t)
   (reorderable
    gtk-tree-view-column-reorderable
    "reorderable" "gboolean" t t)
   (resizable
    gtk-tree-view-column-resizable
    "resizable" "gboolean" t t)
   (sizing
    gtk-tree-view-column-sizing
    "sizing" "GtkTreeViewColumnSizing" t t)
   (sort-column-id
    gtk-tree-view-column-sort-column-id
    "sort-column-id" "gint" t t)
   (sort-indicator
    gtk-tree-view-column-sort-indicator
    "sort-indicator" "gboolean" t t)
   (sort-order
    gtk-tree-view-column-sort-order
    "sort-order" "GtkSortType" t t)
   (spacing
    gtk-tree-view-column-spacing
    "spacing" "gint" t t)
   (title
    gtk-tree-view-column-title
    "title" "gchararray" t t)
   (visible
    gtk-tree-view-column-visible
    "visible" "gboolean" t t)
   (widget
    gtk-tree-view-column-widget
    "widget" "GtkWidget" t t)
   (width
    gtk-tree-view-column-width
    "width" "gint" t nil)
   (x-offset
    gtk-tree-view-column-x-offset
    "x-offset" "gint" t nil)))

#+cl-cffi-gtk-documentation
(setf (documentation 'gtk-tree-view-column 'type)
 "@version{2013-5-14}
  @begin{short}
    The @class{gtk-tree-view-column} object represents a visible column in a
    @class{gtk-tree-view} widget. It allows to set properties of the column
    header, and functions as a holding pen for the cell renderers which
    determine how the data in the column is displayed.
  @end{short}

  Please refer to the tree widget conceptual overview for an overview of all
  the objects and data types related to the tree widget and how they work
  together.
  @begin[Signal Details]{dictionary}
    @subheading{The \"clicked\" signal}
      @begin{pre}
 lambda (treeviewcolumn)
      @end{pre}
  @end{dictionary}
  @see-slot{gtk-tree-view-column-alignment}
  @see-slot{gtk-tree-view-column-cell-area}
  @see-slot{gtk-tree-view-column-clickable}
  @see-slot{gtk-tree-view-column-expand}
  @see-slot{gtk-tree-view-column-fixed-width}
  @see-slot{gtk-tree-view-column-max-width}
  @see-slot{gtk-tree-view-column-min-width}
  @see-slot{gtk-tree-view-column-reorderable}
  @see-slot{gtk-tree-view-column-resizable}
  @see-slot{gtk-tree-view-column-sizing}
  @see-slot{gtk-tree-view-column-sort-column-id}
  @see-slot{gtk-tree-view-column-sort-indicator}
  @see-slot{gtk-tree-view-column-sort-order}
  @see-slot{gtk-tree-view-column-spacing}
  @see-slot{gtk-tree-view-column-title}
  @see-slot{gtk-tree-view-column-visible}
  @see-slot{gtk-tree-view-column-widget}
  @see-slot{gtk-tree-view-column-width}
  @see-slot{gtk-tree-view-column-x-offset}")

;;; ----------------------------------------------------------------------------
;;; Property and Accessor Details
;;; ----------------------------------------------------------------------------

;;; --- gtk-tree-view-column-alignment -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "alignment"
                                               'gtk-tree-view-column) 't)
 "The @code{alignment} property of type @code{:float} (Read / Write) @br{}
  X Alignment of the column header text or widget. @br{}
  Allowed values: [0,1] @br{}
  Default value: 0")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-alignment atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-alignment 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-alignment object) => xalign}
  @syntax[]{(setf (gtk-tree-view-column-alignment object) xalign)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[xalign]{the alignment, which is between [0.0 and 1.0] inclusive}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{alignment} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-alignment} slot access function
  returns the current x alignment of the tree column.

  The @sym{(setf gtk-tree-view-column-alignment)} slot access function
  sets the alignment of the title or custom widget inside the column header.
  The alignment determines its location inside the button -0.0 for left,
  0.5 for center, 1.0 for right.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-cell-area -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "cell-area"
                                               'gtk-tree-view-column) 't)
 "The @code{cell-area} property of type @class{gtk-cell-area}
  (Read / Write / Construct) @br{}
  The @class{gtk-cell-area} object used to layout cell renderers for this
  column. If no area is specified when creating the tree view column with the
  @fun{gtk-tree-view-column-new-with-area} function a horizontally oriented
  @class{gtk-cell-area-box} object will be used.")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-cell-area atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-cell-area 'function)
 "@version{2013-3-26}
  Accessor of the @slot[gtk-tree-view-column]{cell-area} slot of the
  @class{gtk-tree-view-column} class.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-clickable -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "clickable"
                                               'gtk-tree-view-column) 't)
 "The @code{clickable} property of type @code{:boolean} (Read / Write) @br{}
  Whether the header can be clicked. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-clickable atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-clickable 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-clickable object) => clickable}
  @syntax[]{(setf (gtk-tree-view-column-clickable object) clickable)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[clickable]{@em{true} if the header is active}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{clickable} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-clickable} slot access function
  returns @em{true} if the user can click on the header for the column.

  The @sym{(setf gtk-tree-view-column-clickable)} slot access function
  sets the header to be active if clickable is @em{true}. When the header is
  active, then it can take keyboard focus, and can be clicked.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-expand --------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "expand"
                                               'gtk-tree-view-column) 't)
 "The @code{expand} property of type @code{:boolean} (Read / Write) @br{}
  Column gets share of extra width allocated to the widget. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-expand atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-expand 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-expand object) => expand}
  @syntax[]{(setf (gtk-tree-view-column-expand object) expand)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[expand]{@em{true} if the column should take available extra space,
    @code{nil} if not}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{expand} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-clickable} slot access function
  returns @em{true} if the column expands to take any available space.

  The @sym{(setf gtk-tree-view-column-clickable)} slot access function
  sets the column to take available extra space. This space is shared equally
  amongst all columns that have the expand set to @em{true}. If no column has
  this option set, then the last column gets all extra space. By default,
  every column is created with this @code{nil}.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-fixed-width ---------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "fixed-width"
                                               'gtk-tree-view-column) 't)
 "The @code{fixed-width} property of type @code{:int} (Read / Write) @br{}
  Current fixed width of the column. @br{}
  Allowed values: >= 1 @br{}
  Default value: 1")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-fixed-width atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-fixed-width 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-fixed-width object) => fixed-width}
  @syntax[]{(setf (gtk-tree-view-column-fixed-width object) fixed-width)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[fixed-width]{the size to set @arg{tree-column} to, must be greater
    than 0}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{fixed-width} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-fixed-width} slot access function
  gets the fixed width of the column.

  The @sym{(setf gtk-tree-view-column-fixed-width)} slot access function
  sets the size of the column in pixels. This is meaningful only if the sizing
  type is @code{:fixed}. The size of the column is clamped to the min/max width
  for the column. Please note that the min/max width of the column does not
  actually affect the @code{fixed-width} property of the widget, just the actual
  size when displayed.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-max-width -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "max-width"
                                               'gtk-tree-view-column) 't)
 "The @code{max-width} property of type @code{:int} (Read / Write) @br{}
  Maximum allowed width of the column. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1 @br{}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-max-width atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-max-width 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-max-width object) => max-width}
  @syntax[]{(setf (gtk-tree-view-column-max-width object) max-width)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[max-width]{the maximum width of the column in pixels, or -1}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{max-width} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-max-width} slot access function
  returns the maximum width in pixels of the tree column, or -1 if no
  maximum width is set.

  The @sym{(setf gtk-tree-view-column-max-width)} slot access function
  sets the maximum width of the tree column. If @arg{max-width} is -1,
  then the maximum width is unset. Note, the column can actually be wider than
  max width if it is the last column in a view. In this case, the column expands
  to fill any extra space.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-min-width -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "min-width"
                                               'gtk-tree-view-column) 't)
 "The @code{min-width} property of type @code{:int} (Read / Write )@br{}
  Minimum allowed width of the column. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-min-width atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-min-width 'function)
 "@version{2013-3-26}
  @syntax[]{(gtk-tree-view-column-min-width object) => min-width}
  @syntax[]{(setf (gtk-tree-view-column-min-width object) min-width)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[min-width]{the minimum width of the column in pixels, or -1}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{min-width} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-min-width} slot access function
  returns the minimum width in pixels of the tree column, or -1 if no
  minimum width is set.

  The @sym{(setf gtk-tree-view-column-min-width)} slot access function
  sets the minimum width of the tree column. If @arg{min-width} is -1,
  then the minimum width is unset.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-reorderable ---------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "reorderable"
                                               'gtk-tree-view-column) 't)
 "The @code{reorderable} property of type @code{:boolean}
  (Read / Write) @br{}
  Whether the column can be reordered around the headers. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-reorderable atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-reorderable 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-reorderable object) => reorderable}
  @syntax[]{(setf (gtk-tree-view-column-reorderable object) reorderable)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[reorderable]{@em{true}, if the column can be reordered}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{reorderable} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  If @code{reorderable} is @em{true}, then the column can be reordered by the
  end user dragging the header.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-resizable -----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "resizable"
                                               'gtk-tree-view-column) 't)
 "The @code{resizable} property of type @code{:boolean} (Read / Write) @br{}
  Column is user-resizable. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-resizable atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-resizable 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-resizable object) => resizable}
  @syntax[]{(setf (gtk-tree-view-column-resizable object) resizable)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[resizable]{@em{true}, if the column can be resized}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{resizable} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-resizable} slot access function
  returns @em{true} if the tree column can be resized by the end user.

  If @code{resizable} is @em{true}, then the user can explicitly resize the
  column by grabbing the outer edge of the column button. If @code{resizable} is
  @em{true} and sizing mode of the column is @code{:autosize}, then the sizing
  mode is changed to @code{:grow-only}.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-sizing --------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "sizing"
                                               'gtk-tree-view-column) 't)
 "The @code{sizing} property of type @symbol{gtk-tree-view-column-sizing}
  (Read / Write) @br{}
  Resize mode of the column. @br{}
  Default value: @code{:grow-only}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-sizing atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-sizing 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-sizing object) => type}
  @syntax[]{(setf (gtk-tree-view-column-sizing object) type)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[type]{a value of the @class{gtk-tree-view-column-sizing}
    enumeration}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{sizing} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-sizing} slot access function
  returns the current type of the tree-column.

  The @sym{(setf gtk-tree-view-column-sizing)} slot access function
  sets the growth behavior of the tree column to type.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-sort-column-id ------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "sort-column-id"
                                               'gtk-tree-view-column) 't)
 "The @code{sort-column-id} property of type @code{:int} (Read / Write) @br{}
  Logical sort column ID this column sorts on when selected for sorting.
  Setting the sort column ID makes the column header clickable. Set to -1 to
  make the column unsortable. @br{}
  Allowed values: >= -1 @br{}
  Default value: -1")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-sort-column-id atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-sort-column-id 'function)
 "@version{2013-3-26}
  @syntax[]{(gtk-tree-view-column-sort-column-id object) => sort-column-id}
  @syntax[]{(setf (gtk-tree-view-column-sort-column-id object) sort-column-id)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[sort-column-id]{the @code{sort-column-id} of the model to sort on}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{sort-column-id} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-sort-column-id} slot access function
  gets the logical @code{sort-column-id} that the model sorts on when this
  column is selected for sorting.

  The @sym{(setf gtk-tree-view-column-sort-column-id)} slot access function
  sets the logical @arg{sort-column-id} that this column sorts on when this
  column is selected for sorting. Doing so makes the column header clickable.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-sort-indicator ------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "sort-indicator"
                                               'gtk-tree-view-column) 't)
 "The @code{sort-indicator} property of type @code{:boolean}
  (Read / Write) @br{}
  Whether to show a sort indicator. @br{}
  Default value: @code{nil}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-sort-indicator atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-sort-indicator 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-sort-indicator object) => setting}
  @syntax[]{(setf (gtk-tree-view-column-sort-indicator object) setting)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[setting]{@em{true} to display an indicator that the column is
    sorted}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{sort-indicator} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  Call this function with a setting of @em{true} to display an arrow in the
  header button indicating the column is sorted. Call the
  @fun{gtk-tree-view-column-sort-order} function to change the direction of the
  arrow.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-sort-order ----------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "sort-order"
                                               'gtk-tree-view-column) 't)
 "The @code{sort-order} property of type @symbol{gtk-sort-type}
  (Read / Write) @br{}
  Sort direction the sort indicator should indicate. @br{}
  Default value: @code{:ascending}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-sort-order atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-sort-order 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-sort-order object) => order}
  @syntax[]{(setf (gtk-tree-view-column-sort-order object) order)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[order]{sort order that the sort indicator should indicate}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{sort-order} sort of the
    @class{gtk-tree-view-column} class.
  @end{short}

  This does not actually sort the model. Use the function
  @fun{gtk-tree-view-column-sort-column-id} if you want automatic sorting
  support. This function is primarily for custom sorting behavior, and should
  be used in conjunction with the @fun{gtk-tree-sortable-set-sort-column}
  function to do that. For custom models, the mechanism will vary.

  The sort indicator changes direction to indicate normal sort or reverse
  sort. Note that you must have the sort indicator enabled to see anything
  when calling this function; see the @fun{gtk-tree-view-column-sort-indicator}
  function.
  @see-class{gtk-tree-view-column}
  @see-function{gtk-tree-view-column-sort-column-id}
  @see-function{gtk-tree-view-column-sort-indicator}
  @see-function{gtk-tree-sortable-set-sort-column}")

;;; --- gtk-tree-view-column-spacing -------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "spacing"
                                               'gtk-tree-view-column) 't)
 "The @code{spacing} property of type @code{:int} (Read / Write) @br{}
  Space which is inserted between cells. @br{}
  Allowed values: >= 0 @br{}
  Default value: 0")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-spacing atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-spacing 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-spacing object) => spacing}
  @syntax[]{(setf (gtk-tree-view-column-spacing object) spacing)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[spacing]{distance between cell renderers in pixels}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{spacing} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-spacing} slot access function
  returns the spacing of the tree column.

  The @sym{(setf gtk-tree-view-column-spacing)} slot access function
  sets the spacing field of the tree column, which is the number of pixels to
  place between cell renderers packed into it.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-title ---------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "title"
                                               'gtk-tree-view-column) 't)
 "The @code{title} property of type @code{:string} (Read / Write) @br{}
  Title to appear in column header. @br{}
  Default value: \"\"")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-title atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-title 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-title object) => title}
  @syntax[]{(setf (gtk-tree-view-column-title object) title)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[title]{the title of the @arg{tree-column} object}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{title} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-spacing} slot access function
  returns the title of the column.

  The @sym{(setf gtk-tree-view-column-spacing)} slot access function
  sets the title of the  tree column. If a custom widget has been set, then
  this value is ignored.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-visible -------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "visible"
                                               'gtk-tree-view-column) 't)
 "The @code{visible} property of type @code{:boolean} (Read / Write) @br{}
  Whether to display the column. @br{}
  Default value: @em{true}")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-visible atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-visible 'function)
 "@version{2013-3-26}
  @syntax[]{(gtk-tree-view-column-visible object) => visible}
  @syntax[]{(setf (gtk-tree-view-column-visible object) visible)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[visible]{@em{true} if the @arg{tree-column} is visible}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{visible} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-visible} slot access function
  returns whether the column is visible or not. If it is visible, then the tree
  will show the column.

  The @sym{(setf gtk-tree-view-column-spacing)} slot access function
  sets the visibility of the tree column.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-widget --------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "widget"
                                               'gtk-tree-view-column) 't)
 "The @code{widget} property of type @class{gtk-widget} (Read / Write) @br{}
  Widget to put in column header button instead of column title.")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-widget atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-widget 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-widget object) => visible}
  @syntax[]{(setf (gtk-tree-view-column-widget object) visible)}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[widget]{a child @class{gtk-widget}, or @code{nil}}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{widget} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-widget} slot access function
  returns the @class{gtk-widget} in the button on the column header. If a
  custom widget has not been set then @code{nil} is returned.

  The @sym{(setf gtk-tree-view-column-widget)} slot access function
  sets the widget in the header to be @arg{widget}. If widget is @code{nil},
  then the header button is set with a @class{gtk-label} widget set to the
  title of the tree column.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-width ---------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "width"
                                               'gtk-tree-view-column) 't)
 "The @code{width} property of type @code{:int} (Read) @br{}
  Current width of the column. @br{}
  Allowed values: >= 0 @br{}
  Default value: 0")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-width atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-width 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-widget object) => visible}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[width]{the current width of the tree column}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{width} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-width} slot access function
  returns the current size of the tree column in pixels.
  @see-class{gtk-tree-view-column}")

;;; --- gtk-tree-view-column-x-offset ------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation (atdoc:get-slot-from-name "x-offset"
                                               'gtk-tree-view-column) 't)
 "The @code{x-offset} property of type @code{:int} (Read) @br{}
  Current x position of the column. @br{}
  Default value: 0")

#+cl-cffi-gtk-documentation
(setf (gethash 'gtk-tree-view-column-x-offset atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gtk-tree-view-column-x-offset 'function)
 "@version{2019-5-4}
  @syntax[]{(gtk-tree-view-column-x-offset object) => offset}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[offset]{the current x offset in pixels}
  @begin{short}
    Accessor of the @slot[gtk-tree-view-column]{x-offset} slot of the
    @class{gtk-tree-view-column} class.
  @end{short}

  The @sym{gtk-tree-view-column-width} slot access function
  returns the current x offset of the tree column in pixels.
  @see-class{gtk-tree-view-column}")

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_new ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-tree-view-column-new))

(defun gtk-tree-view-column-new ()
 #+cl-cffi-gtk-documentation
 "@version{2013-5-13}
  @return{A newly created @class{gtk-tree-view-column} object.}
  Creates a new @class{gtk-tree-view-column} object."
  (make-instance 'gtk-tree-view-column))

(export 'gtk-tree-view-column-new)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_new_with_area ()
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-tree-view-column-new-with-area))

(defun gtk-tree-view-column-new-with-area (area)
 #+cl-cffi-gtk-documentation
 "@version{2013-5-14}
  @argument[area]{the @class{gtk-cell-area} that the newly created column should
    use to layout cells}
  @return{A newly created @class{gtk-tree-view-column} object.}
  @begin{short}
    Creates a new @class{gtk-tree-view-column} using area to render its cells.
  @end{short}
  @see-class{gtk-tree-view-column}"
  (make-instance 'gtk-tree-view-column
                 :cell-area area))

(export 'gtk-tree-view-column-new-with-area)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_new_with_attributes ()
;;; ----------------------------------------------------------------------------

(defun gtk-tree-view-column-new-with-attributes (title cell &rest attributes)
 #+cl-cffi-gtk-documentation
 "@version{2013-9-28}
  @argument[title]{the title to set the header to}
  @argument[cell]{the @class{gtk-cell-renderer} object}
  @argument[attributes]{a list of attributes}
  @return{A newly created @class{gtk-tree-view-column} object.}
  @begin{short}
    Creates a new @class{gtk-tree-view-column} with a number of default values.
  @end{short}
  This is equivalent to calling the functions
  @fun{gtk-tree-view-column-set-title}, @fun{gtk-tree-view-column-pack-start},
  and @fun{gtk-tree-view-column-set-attributes} on the newly created
  @class{gtk-tree-view-column} object.

  Here's a simple example:
  @begin{pre}
 (let* ((renderer (gtk-cell-renderer-text-new))
        (column (gtk-tree-view-column-new-with-attributes \"Example\"
                                                          renderer
                                                          \"text\" 0
                                                          \"foreground\" 1)))
   ... )
  @end{pre}
  @see-class{gtk-tree-view-column}
  @see-class{gtk-cell-renderer}
  @see-function{gtk-tree-view-column-set-title}
  @see-function{gtk-tree-view-column-pack-start}
  @see-function{gtk-tree-view-column-set-attributes}"
  (let ((column (make-instance 'gtk-tree-view-column
                               :title title)))
    (gtk-tree-view-column-pack-start column cell :expand t)
    (apply #'gtk-tree-view-column-set-attributes
           (cons column (cons cell attributes)))
    column))

(export 'gtk-tree-view-column-new-with-attributes)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_pack_start ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_pack_start" %gtk-tree-view-column-pack-start)
    :void
  (tree-column (g-object gtk-tree-view-column))
  (cell (g-object gtk-cell-renderer))
  (expand :boolean))

(defun gtk-tree-view-column-pack-start (tree-column cell &key (expand t))
 #+cl-cffi-gtk-documentation
 "@version{2013-9-28}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell]{the @class{gtk-cell-renderer} object}
  @argument[expand]{@em{true} if cell is to be given extra space allocated to
    @arg{tree-column} object}
  @begin{short}
    Packs the cell into the beginning of the column.
  @end{short}
  If @arg{expand} is @code{nil}, then the cell is allocated no more space than
  it needs. Any unused space is divided evenly between cells for which
  @arg{expand} is @em{true}.
  @see-class{gtk-tree-view-column}
  @see-class{gtk-cell-renderer}
  @see-function{gtk-tree-view-column-pack-end}"
  (%gtk-tree-view-column-pack-start tree-column cell expand))

(export 'gtk-tree-view-column-pack-start)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_pack_end ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_pack_end" %gtk-tree-view-column-pack-end) :void
  (tree-column (g-object gtk-tree-view-column))
  (cell (g-object gtk-cell-renderer))
  (expand :boolean))

(defun gtk-tree-view-column-pack-end (tree-column cell &key (expand t))
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell]{the @class{gtk-cell-renderer} object}
  @argument[expand]{@em{true} if cell is to be given extra space allocated to
    @arg{tree-column}}
  Adds the cell to end of the column. If expand is @code{nil}, then the cell is
  allocated no more space than it needs. Any unused space is divided evenly
  between cells for which expand is @em{true}."
  (%gtk-tree-view-column-pack-end tree-column cell expand))

(export 'gtk-tree-view-column-pack-end)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_clear ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_clear" gtk-tree-view-column-clear) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  Unsets all the mappings on all renderers on the @arg{tree-column}."
  (tree-column (g-object gtk-tree-view-column)))

(export 'gtk-tree-view-column-clear)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_add_attribute ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_add_attribute"
           gtk-tree-view-column-add-attribute) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-9-28}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell-renderer]{the @class{gtk-cell-renderer} object to set
    attributes on}
  @argument[attribute]{an attribute on the renderer}
  @argument[column]{the column position on the model to get the attribute from}
  @begin{short}
    Adds an attribute mapping to the list in @arg{tree-column}.
  @end{short}
  The @arg{column} is the column of the model to get a value from, and the
  attribute is the parameter on @arg{cell-renderer} to be set from the value.
  So for example if column 2 of the model contains strings, you could have the
  \"text\" attribute of a @class{gtk-cell-renderer-text} get its values from
  column 2.
  @see-class{gtk-tree-view-column}
  @see-class{gtk-cell-renderer}
  @see-class{gtk-cell-renderer-text}
  @see-function{gtk-tree-view-column-new-with-attributes}"
  (tree-column (g-object gtk-tree-view-column))
  (cell-renderer (g-object gtk-cell-renderer))
  (attribute :string)
  (column :int))

(export 'gtk-tree-view-column-add-attribute)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_set_attributes ()
;;; ----------------------------------------------------------------------------

(defun gtk-tree-view-column-set-attributes (tree-column
                                            cell-renderer
                                            &rest attributes)
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell-renderer]{the @class{gtk-cell-renderer} we are setting the
    attributes of}
  @argument[arguments]{a list of attributes}
  Sets the attributes in the list as the attributes of @arg{tree-column}. The
  attributes should be in attribute/column order, as in the function
  @fun{gtk-tree-view-column-add-attribute}. All existing attributes are removed,
  and replaced with the new attributes."
  (let ((n (/ (length attributes) 2)))
    (assert (eql n (truncate (length attributes) 2)))
    (dotimes (i n)
      (gtk-tree-view-column-add-attribute tree-column
                                          cell-renderer
                                          (pop attributes)
                                          (pop attributes)))))

(export 'gtk-tree-view-column-set-attributes)

;;; ----------------------------------------------------------------------------
;;; GtkTreeCellDataFunc ()
;;;
;;; void (*GtkTreeCellDataFunc) (GtkTreeViewColumn *tree_column,
;;;                              GtkCellRenderer *cell,
;;;                              GtkTreeModel *tree_model,
;;;                              GtkTreeIter *iter,
;;;                              gpointer data);
;;;
;;; A function to set the properties of a cell instead of just using the
;;; straight mapping between the cell and the model. This is useful for
;;; customizing the cell renderer. For example, a function might get an integer
;;; from the tree_model, and render it to the "text" attribute of "cell" by
;;; converting it to its written equivilent. This is set by calling
;;; gtk_tree_view_column_set_cell_data_func()
;;;
;;; tree_column :
;;;     A GtkTreeColumn
;;;
;;; cell :
;;;     The GtkCellRenderer that is being rendered by tree_column
;;;
;;; tree_model :
;;;     The GtkTreeModel being rendered
;;;
;;; iter :
;;;     A GtkTreeIter of the current row rendered
;;;
;;; data :
;;;     user data
;;; ----------------------------------------------------------------------------

(defcallback gtk-tree-cell-data-func-cb :void
    ((tree-column (g-object gtk-tree-view-column))
     (cell (g-object gtk-cell-renderer))
     (tree-model (g-object gtk-tree-model))
     (iter (g-boxed-foreign gtk-tree-iter))
     (data :pointer))
  (let ((fn (glib::get-stable-pointer-value data)))
    (restart-case
        (funcall fn tree-column cell tree-model iter)
      (return-from-gtk-tree-cell-data-func-cb () nil))))

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_set_cell_data_func ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_set_cell_data_func"
          %gtk-tree-view-column-set-cell-data-func) :void
  (tree-column (g-object gtk-tree-view-column))
  (cell-renderer (g-object gtk-cell-renderer))
  (func :pointer)
  (func-data :pointer)
  (destroy-notify :pointer))

(defun gtk-tree-view-column-set-cell-data-func (tree-column cell-renderer func)
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell-renderer]{a @class{gtk-cell-renderer} object}
  @argument[func]{the @class{gtk-tree-view-column-func} to use}
  Sets the @code{GtkTreeViewColumnFunc} to use for the column. This function is
  used instead of the standard attributes mapping for setting the column value,
  and should set the value of @arg{tree-column}'s cell renderer as appropriate.
  @arg{func} may be @code{nil} to remove an older one."
  (%gtk-tree-view-column-set-cell-data-func
                             tree-column
                             cell-renderer
                             (callback gtk-tree-cell-data-func-cb)
                             (glib::allocate-stable-pointer func)
                             (callback glib::stable-pointer-destroy-notify-cb)))

(export 'gtk-tree-view-column-set-cell-data-func)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_clear_attributes ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_clear_attributes"
           gtk-tree-view-column-clear-attributes) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell-renderer]{a @class{gtk-cell-renderer} to clear the attribute
    mapping on}
  Clears all existing attributes previously set with the function
  @fun{gtk-tree-view-column-set-attributes}.
  @see-function{gtk-tree-view-column-set-attributes}"
  (tree-column (g-object gtk-tree-view-column))
  (cell-renderer (g-object gtk-cell-renderer)))

(export 'gtk-tree-view-column-clear-attributes)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_clicked ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_clicked" gtk-tree-view-column-clicked) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  Emits the \"clicked\" signal on the column. This function will only work if
  @arg{tree-column} is clickable."
  (tree-column (g-object gtk-tree-view-column)))

(export 'gtk-tree-view-column-clicked)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_get_button ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_get_button" gtk-tree-view-column-get-button)
    (g-object gtk-widget)
 #+cl-cffi-gtk-documentation
 "@version{2013-4-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @return{The button for the column header.}
  @begin{short}
    Returns the button used in the treeview column header.
  @end{short}
  @see-class{gtk-tree-view-column}"
  (tree-column (g-object gtk-tree-view-column)))

(export 'gtk-tree-view-column-get-button)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_cell_set_cell_data ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_cell_set_cell_data"
           gtk-tree-view-column-cell-set-cell-data) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[tree-model]{the @class{gtk-tree-model} to to get the cell renderers
    attributes from}
  @argument[iter]{the @class{gtk-tree-iter} to to get the cell renderer's
    attributes from}
  @argument[is-expander]{@em{true}, if the row has children}
  @argument[is-expanded]{@em{true}, if the row has visible children}
  Sets the cell renderer based on the @arg{tree-model} and @arg{iter}. That is,
  for every attribute mapping in @arg{tree-column}, it will get a value from the
  set column on the @arg{iter}, and use that value to set the attribute on the
  cell renderer. This is used primarily by the @class{gtk-tree-view}."
  (tree-column (g-object gtk-tree-view-column))
  (tree-model (g-object gtk-tree-model))
  (iter (g-boxed-foreign gtk-tree-iter))
  (is-expander :boolean)
  (is-expanded :boolean))

(export 'gtk-tree-view-column-cell-set-cell-data)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_cell_get_size ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_cell_get_size"
          %gtk-tree-view-column-cell-get-size) :void
  (tree-column (g-object gtk-tree-view-column))
  (cell-area (g-boxed-foreign gdk-rectangle))
  (x-offset (:pointer :int))
  (y-offset (:pointer :int))
  (width (:pointer :int))
  (height (:pointer :int)))

(defun gtk-tree-view-column-cell-get-size (tree-column cell-area)
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell-area]{the area a cell in the column will be allocated,
    or @code{nil}}
  @argument[x-offset]{location to return x offset of a cell relative to
    @arg{cell-area}, or @code{nil}}
  @argument[y_offset]{location to return y offset of a cell relative to
    @arg{cell-area}, or @code{nil}}
  @argument[width]{location to return width needed to render a cell,
    or @code{nil}}
  @argument[height]{location to return height needed to render a cell,
    or @code{nil}}
  Obtains the width and height needed to render the column. This is used
  primarily by the @class{gtk-tree-view}."
  (with-foreign-objects ((x-offset :int)
                         (y-offset :int)
                         (width :int)
                         (height :int))
    (%gtk-tree-view-column-cell-get-size tree-column
                                         cell-area
                                         x-offset
                                         y-offset
                                         width
                                         height)
    (values (mem-ref x-offset :int)
            (mem-ref y-offset :int)
            (mem-ref width :int)
            (mem-ref height :int))))

(export 'gtk-tree-view-column-cell-get-size)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_cell_get_position ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_cell_get_position"
          %gtk-tree-view-column-cell-get-position) :boolean
  (tree-column (g-object gtk-tree-view-column))
  (cell-renderer (g-object gtk-cell-renderer))
  (x-offset (:pointer :int))
  (width (:pointer :int)))

(defun gtk-tree-view-column-cell-get-position (tree-column cell-renderer)
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell-renderer]{a @class{gtk-cell-renderer} object}
  @argument[x-offset]{return location for the horizontal position of cell within
    @arg{tree-column}, may be @code{nil}}
  @argument[width]{return location for the width of cell, may be @code{nil}}
  @return{@em{True} if cell belongs to @arg{tree-column}.}
  Obtains the horizontal position and size of a cell in a column. If the cell
  is not found in the column, @arg{start-pos} and @arg{width} are not changed
  and @code{nil} is returned."
  (with-foreign-objects ((x-offset :int) (width :int))
    (when (%gtk-tree-view-column-cell-get-position tree-column
                                                   cell-renderer
                                                   x-offset
                                                   width)
      (values (mem-ref x-offset :int)
              (mem-ref width :int)))))

(export 'gtk-tree-view-column-cell-get-position)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_cell_is_visible ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_cell_is_visible"
           gtk-tree-view-column-cell-is-visible) :boolean
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @begin{return}
    @em{True}, if any of the cells packed into the @arg{tree-column} are
    currently visible.
  @end{return}
  Returns @em{true} if any of the cells packed into the @arg{tree-column} are
  visible. For this to be meaningful, you must first initialize the cells with
  the @fun{gtk-tree-view-column-cell-set-cell-data} function."
  (tree-column (g-object gtk-tree-view-column)))

(export 'gtk-tree-view-column-cell-is-visible)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_focus_cell ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_focus_cell" gtk-tree-view-column-focus-cell)
    :void
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @argument[cell]{a @class{gtk-cell-renderer} object}
  @begin{short}
    Sets the current keyboard focus to be at cell, if the column contains 2 or
    more editable and activatable cells.
  @end{short}
  @see-class{gtk-tree-view-column}"
  (tree-column (g-object gtk-tree-view-column))
  (cell-renderer (g-object gtk-cell-renderer)))

(export 'gtk-tree-view-column-focus-cell)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_queue_resize ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_queue_resize"
           gtk-tree-view-column-queue-resize) :void
 #+cl-cffi-gtk-documentation
 "@version{2013-12-17}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @begin{short}
    Flags the column, and the cell renderers added to this column, to have their
    sizes renegotiated.
  @end{short}
  @see-class{gtk-tree-view-column}
  @see-class{gtk-tree-view-column-queue-resize}"
  (tree-column (g-object gtk-tree-view-column)))

(export 'gtk-tree-view-column-queue-resize)

;;; ----------------------------------------------------------------------------
;;; gtk_tree_view_column_get_tree_view ()
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_tree_view_column_get_tree_view"
           gtk-tree-view-column-get-tree-view) (g-object gtk-widget)
 #+cl-cffi-gtk-documentation
 "@version{2013-5-16}
  @argument[tree-column]{a @class{gtk-tree-view-column} object}
  @begin{return}
    The tree view wherein column has been inserted if any, @code{nil} otherwise.
  @end{return}
  @begin{short}
    Returns the @class{gtk-tree-view} wherein @arg{tree-column} has been
    inserted. If column is currently not inserted in any tree view,
    @code{nil} is returned.
  @end{short}
  @see-class{gtk-tree-view-column}"
  (tree-column (g-object gtk-tree-view-column)))

(export 'gtk-tree-view-column-get-tree-view)

;;; --- End of file gtk.tree-view-column.lisp ----------------------------------

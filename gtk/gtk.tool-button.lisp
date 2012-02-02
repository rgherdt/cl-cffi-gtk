;;; ----------------------------------------------------------------------------
;;; gtk.tool-button.lisp
;;; 
;;; This file contains code from a fork of cl-gtk2.
;;; See http://common-lisp.net/project/cl-gtk2/
;;; 
;;; The documentation has been copied from the GTK 3.2.3 Reference Manual
;;; See http://www.gtk.org.
;;; 
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2012 Dr. Dieter Kaiser
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
;;; GtkToolButton
;;; 
;;; A GtkToolItem subclass that displays buttons
;;; 
;;; Synopsis
;;; 
;;;     GtkToolButton
;;;     
;;;     gtk_tool_button_new
;;;     gtk_tool_button_new_from_stock
;;;     gtk_tool_button_set_label
;;;     gtk_tool_button_get_label
;;;     gtk_tool_button_set_use_underline
;;;     gtk_tool_button_get_use_underline
;;;     gtk_tool_button_set_stock_id
;;;     gtk_tool_button_get_stock_id
;;;     gtk_tool_button_set_icon_name
;;;     gtk_tool_button_get_icon_name
;;;     gtk_tool_button_set_icon_widget
;;;     gtk_tool_button_get_icon_widget
;;;     gtk_tool_button_set_label_widget
;;;     gtk_tool_button_get_label_widget
;;; 
;;; Object Hierarchy
;;; 
;;;   GObject
;;;    +----GInitiallyUnowned
;;;          +----GtkWidget
;;;                +----GtkContainer
;;;                      +----GtkBin
;;;                            +----GtkToolItem
;;;                                  +----GtkToolButton
;;;                                        +----GtkMenuToolButton
;;;                                        +----GtkToggleToolButton
;;; 
;;; Implemented Interfaces
;;; 
;;; GtkToolButton implements AtkImplementorIface, GtkBuildable and
;;; GtkActivatable.
;;;
;;; Properties
;;; 
;;;   "icon-name"                gchar*                : Read / Write
;;;   "icon-widget"              GtkWidget*            : Read / Write
;;;   "label"                    gchar*                : Read / Write
;;;   "label-widget"             GtkWidget*            : Read / Write
;;;   "stock-id"                 gchar*                : Read / Write
;;;   "use-underline"            gboolean              : Read / Write
;;; 
;;; Style Properties
;;; 
;;;   "icon-spacing"             gint                  : Read / Write
;;; 
;;; Signals
;;; 
;;;   "clicked"                                        : Action
;;; 
;;; Description
;;; 
;;; GtkToolButtons are GtkToolItems containing buttons.
;;; 
;;; Use gtk_tool_button_new() to create a new GtkToolButton. Use
;;; gtk_tool_button_new_with_stock() to create a GtkToolButton containing a
;;; stock item.
;;; 
;;; The label of a GtkToolButton is determined by the properties "label-widget",
;;; "label", and "stock-id". If "label-widget" is non-NULL, then that widget is
;;; used as the label. Otherwise, if "label" is non-NULL, that string is used as
;;; the label. Otherwise, if "stock-id" is non-NULL, the label is determined by
;;; the stock item. Otherwise, the button does not have a label.
;;; 
;;; The icon of a GtkToolButton is determined by the properties "icon-widget"
;;; and "stock-id". If "icon-widget" is non-NULL, then that widget is used as
;;; the icon. Otherwise, if "stock-id" is non-NULL, the icon is determined by
;;; the stock item. Otherwise, the button does not have a icon.
;;;
;;; ----------------------------------------------------------------------------
;;;
;;; Property Details
;;;
;;; ----------------------------------------------------------------------------
;;; The "icon-name" property
;;; 
;;;   "icon-name"                gchar*                : Read / Write
;;; 
;;; The name of the themed icon displayed on the item. This property only has an
;;; effect if not overridden by "label", "icon_widget" or "stock_id" properties.
;;; 
;;; Default value: NULL
;;; 
;;; Since 2.8
;;;
;;; ----------------------------------------------------------------------------
;;; The "icon-widget" property
;;; 
;;;   "icon-widget"              GtkWidget*            : Read / Write
;;; 
;;; Icon widget to display in the item.
;;;
;;; ----------------------------------------------------------------------------
;;; The "label" property
;;; 
;;;   "label"                    gchar*                : Read / Write
;;; 
;;; Text to show in the item.
;;; 
;;; Default value: NULL
;;;
;;; ----------------------------------------------------------------------------
;;; The "label-widget" property
;;; 
;;;   "label-widget"             GtkWidget*            : Read / Write
;;; 
;;; Widget to use as the item label.
;;;
;;; ----------------------------------------------------------------------------
;;; The "stock-id" property
;;; 
;;;   "stock-id"                 gchar*                : Read / Write
;;; 
;;; The stock icon displayed on the item.
;;; 
;;; Default value: NULL
;;;
;;; ----------------------------------------------------------------------------
;;; The "use-underline" property
;;; 
;;;   "use-underline"            gboolean              : Read / Write
;;; 
;;; If set, an underline in the label property indicates that the next character
;;; should be used for the mnemonic accelerator key in the overflow menu.
;;; 
;;; Default value: FALSE
;;;
;;; ----------------------------------------------------------------------------
;;;
;;; Style Property Details
;;;
;;; ----------------------------------------------------------------------------
;;; The "icon-spacing" style property
;;; 
;;;   "icon-spacing"             gint                  : Read / Write
;;; 
;;; Spacing in pixels between the icon and label.
;;; 
;;; Allowed values: >= 0
;;; 
;;; Default value: 3
;;;
;;; ----------------------------------------------------------------------------
;;;
;;; Signal Details
;;;
;;; ----------------------------------------------------------------------------
;;; The "clicked" signal
;;; 
;;; void user_function (GtkToolButton *toolbutton,
;;;                     gpointer       user_data)       : Action
;;; 
;;; This signal is emitted when the tool button is clicked with the mouse or
;;; activated with the keyboard.
;;; 
;;; toolbutton :
;;;     the object that emitted the signal
;;; 
;;; user_data :
;;;     user data set when the signal handler was connected.
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; struct GtkToolButton
;;; 
;;; struct GtkToolButton;
;;; ----------------------------------------------------------------------------

(define-g-object-class "GtkToolButton" gtk-tool-button
  (:superclass gtk-tool-item
    :export t
    :interfaces ("AtkImplementorIface" "GtkActivatable" "GtkBuildable")
    :type-initializer "gtk_tool_button_get_type")
  ((icon-name gtk-tool-button-icon-name
    "icon-name" "gchararray" t t)
   (icon-widget gtk-tool-button-icon-widget
    "icon-widget" "GtkWidget" t t)
   (label gtk-tool-button-label
    "label" "gchararray" t t)
   (label-widget gtk-tool-button-label-widget
    "label-widget" "GtkWidget" t t)
   (stock-id gtk-tool-button-stock-id
    "stock-id" "gchararray" t t)
   (use-underline gtk-tool-button-use-underline
    "use-underline" "gboolean" t t)))

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_new ()
;;; 
;;; GtkToolItem * gtk_tool_button_new (GtkWidget *icon_widget,
;;;                                    const gchar *label);
;;; 
;;; Creates a new GtkToolButton using icon_widget as contents and label as
;;; label.
;;; 
;;; label :
;;;     a string that will be used as label, or NULL
;;; 
;;; icon_widget :
;;;     a widget that will be used as the button contents, or NULL
;;; 
;;; Returns :
;;;     A new GtkToolButton
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_new_from_stock ()
;;; 
;;; GtkToolItem * gtk_tool_button_new_from_stock (const gchar *stock_id);
;;; 
;;; Creates a new GtkToolButton containing the image and text from a stock item.
;;; Some stock ids have preprocessor macros like
;;; GTK_STOCK_OK and GTK_STOCK_APPLY.
;;; 
;;; It is an error if stock_id is not a name of a stock item.
;;; 
;;; stock_id :
;;;     the name of the stock item
;;; 
;;; Returns :
;;;     A new GtkToolButton
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_set_label ()
;;; 
;;; void gtk_tool_button_set_label (GtkToolButton *button, const gchar *label);
;;; 
;;; Sets label as the label used for the tool button. The "label" property only
;;; has an effect if not overridden by a non-NULL "label_widget" property. If
;;; both the "label_widget" and "label" properties are NULL, the label is
;;; determined by the "stock_id" property. If the "stock_id" property is also
;;; NULL, button will not have a label.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; label :
;;;     a string that will be used as label, or NULL
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_get_label ()
;;; 
;;; const gchar * gtk_tool_button_get_label (GtkToolButton *button);
;;; 
;;; Returns the label used by the tool button, or NULL if the tool button
;;; doesn't have a label. or uses a the label from a stock item. The returned
;;; string is owned by GTK+, and must not be modified or freed.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; Returns :
;;;     The label, or NULL
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_set_use_underline ()
;;; 
;;; void gtk_tool_button_set_use_underline (GtkToolButton *button,
;;;                                         gboolean use_underline);
;;; 
;;; If set, an underline in the label property indicates that the next character
;;; should be used for the mnemonic accelerator key in the overflow menu. For
;;; example, if the label property is "_Open" and use_underline is TRUE, the
;;; label on the tool button will be "Open" and the item on the overflow menu
;;; will have an underlined 'O'.
;;; 
;;; Labels shown on tool buttons never have mnemonics on them; this property
;;; only affects the menu item on the overflow menu.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; use_underline :
;;;     whether the button label has the form "_Open"
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_get_use_underline ()
;;; 
;;; gboolean gtk_tool_button_get_use_underline (GtkToolButton *button);
;;; 
;;; Returns whether underscores in the label property are used as mnemonics on
;;; menu items on the overflow menu. See gtk_tool_button_set_use_underline().
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; Returns :
;;;     TRUE if underscores in the label property are used as mnemonics on menu
;;;     items on the overflow menu.
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_set_stock_id ()
;;; 
;;; void gtk_tool_button_set_stock_id (GtkToolButton *button,
;;;                                    const gchar *stock_id);
;;; 
;;; Sets the name of the stock item. See gtk_tool_button_new_from_stock(). The
;;; stock_id property only has an effect if not overridden by non-NULL "label"
;;; and "icon_widget" properties.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; stock_id :
;;;     a name of a stock item, or NULL
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_get_stock_id ()
;;; 
;;; const gchar * gtk_tool_button_get_stock_id (GtkToolButton *button);
;;; 
;;; Returns the name of the stock item. See gtk_tool_button_set_stock_id(). The
;;; returned string is owned by GTK+ and must not be freed or modifed.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; Returns :
;;;     the name of the stock item for button.
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_set_icon_name ()
;;; 
;;; void gtk_tool_button_set_icon_name (GtkToolButton *button,
;;;                                     const gchar *icon_name);
;;; 
;;; Sets the icon for the tool button from a named themed icon. See the docs for
;;; GtkIconTheme for more details. The "icon_name" property only has an effect
;;; if not overridden by non-NULL "label", "icon_widget" and "stock_id"
;;; properties.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; icon_name :
;;;     the name of the themed icon
;;; 
;;; Since 2.8
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_get_icon_name ()
;;; 
;;; const gchar * gtk_tool_button_get_icon_name (GtkToolButton *button);
;;; 
;;; Returns the name of the themed icon for the tool button, see
;;; gtk_tool_button_set_icon_name().
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; Returns :
;;;     the icon name or NULL if the tool button has no themed icon
;;; 
;;; Since 2.8
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_set_icon_widget ()
;;; 
;;; void gtk_tool_button_set_icon_widget (GtkToolButton *button,
;;;                                       GtkWidget *icon_widget);
;;; 
;;; Sets icon as the widget used as icon on button. If icon_widget is NULL the
;;; icon is determined by the "stock_id" property. If the "stock_id" property is
;;; also NULL, button will not have an icon.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; icon_widget :
;;;     the widget used as icon, or NULL
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_get_icon_widget ()
;;; 
;;; GtkWidget * gtk_tool_button_get_icon_widget (GtkToolButton *button);
;;; 
;;; Return the widget used as icon widget on button.
;;; See gtk_tool_button_set_icon_widget().
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; Returns :
;;;     The widget used as icon on button, or NULL.
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_set_label_widget ()
;;; 
;;; void gtk_tool_button_set_label_widget (GtkToolButton *button,
;;;                                        GtkWidget *label_widget);
;;; 
;;; Sets label_widget as the widget that will be used as the label for button.
;;; If label_widget is NULL the "label" property is used as label. If "label" is
;;; also NULL, the label in the stock item determined by the "stock_id" property
;;; is used as label. If "stock_id" is also NULL, button does not have a label.
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; label_widget :
;;;     the widget used as label, or NULL
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; gtk_tool_button_get_label_widget ()
;;; 
;;; GtkWidget * gtk_tool_button_get_label_widget (GtkToolButton *button);
;;; 
;;; Returns the widget used as label on button.
;;; See gtk_tool_button_set_label_widget().
;;; 
;;; button :
;;;     a GtkToolButton
;;; 
;;; Returns :
;;;     The widget used as label on button, or NULL.
;;; 
;;; Since 2.4
;;; ----------------------------------------------------------------------------


;;; --- End of file gtk.tool-button.lisp ---------------------------------------
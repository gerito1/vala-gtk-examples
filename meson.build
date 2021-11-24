project('vala-gtk-examples', ['c', 'vala'],
  version : '0.1',
  default_options : ['warning_level=3'])

gtk_dep = dependency('gtk+-3.0')

executable('actionbar',
           'actionbar.vala',
           dependencies : [gtk_dep],
           install : true)

executable('box',
           'box.vala',
           dependencies : [gtk_dep],
           install : true)

executable('buttonbox',
           'buttonbox.vala',
           dependencies : [gtk_dep],
           install : true)

executable('button',
           'button.vala',
           dependencies : [gtk_dep],
           install : true)

executable('checkbutton',
           'checkbutton.vala',
           dependencies : [gtk_dep],
           install : true)

executable('comboboxtext',
           'comboboxtext.vala',
           dependencies : [gtk_dep],
           install : true)

executable('combobox',
           'combobox.vala',
           dependencies : [gtk_dep],
           install : true)

executable('entrybuffer',
           'entrybuffer.vala',
           dependencies : [gtk_dep],
           install : true)

executable('entrycompletion',
           'entrycompletion.vala',
           dependencies : [gtk_dep],
           install : true)

executable('entry',
           'entry.vala',
           dependencies : [gtk_dep],
           install : true)

executable('filechooserbutton',
           'filechooserbutton.vala',
           dependencies : [gtk_dep],
           install : true)

executable('flowbox',
           'flowbox.vala',
           dependencies : [gtk_dep],
           install : true)

executable('fontbutton',
           'fontbutton.vala',
           dependencies : [gtk_dep],
           install : true)

executable('grid',
           'grid.vala',
           dependencies : [gtk_dep],
           install : true)

executable('label',
           'label.vala',
           dependencies : [gtk_dep],
           install : true)

executable('listbox',
           'listbox.vala',
           dependencies : [gtk_dep],
           install : true)

executable('notebook',
           'notebook.vala',
           dependencies : [gtk_dep],
           install : true)

executable('paned',
           'paned.vala',
           dependencies : [gtk_dep],
           install : true)

executable('radiobutton',
           'radiobutton.vala',
           dependencies : [gtk_dep],
           install : true)

executable('scale',
           'scale.vala',
           dependencies : [gtk_dep],
           install : true)

executable('searchentry',
           'searchentry.vala',
           dependencies : [gtk_dep],
           install : true)

executable('separator',
           'separator.vala',
           dependencies : [gtk_dep],
           install : true)


gtksourceview_dep = dependency('gtksourceview-4', required : false)
if gtksourceview_dep.found()
    executable('sourceview',
           'sourceview.vala',
           dependencies : [gtk_dep, gtksourceview_dep],
           install : true)
else
    warning ('[-] Skipping sourceview.vala')
    warning ('\tIt requires gtksourceview-4, but is not available.' )
    warning ('\tCheck your system documentation to install it.')
endif

executable('spinbutton',
           'spinbutton.vala',
           dependencies : [gtk_dep],
           install : true)

executable('spinner',
           'spinner.vala',
           dependencies : [gtk_dep],
           install : true)

executable('stacksidebar',
           'stacksidebar.vala',
           dependencies : [gtk_dep],
           install : true)

executable('stackswitcher',
           'stackswitcher.vala',
           dependencies : [gtk_dep],
           install : true)

executable('stack',
           'stack.vala',
           dependencies : [gtk_dep],
           install : true)

executable('texteditor',
           'texteditor.vala',
           dependencies : [gtk_dep],
           install : true)

executable('togglebutton',
           'togglebutton.vala',
           dependencies : [gtk_dep],
           install : true)

webkit2gtk_dep = dependency('webkit2gtk-4.0', required : false)
if webkit2gtk_dep.found()
    executable('webkit2',
           'webkit2.vala',
           dependencies : [gtk_dep, webkit2gtk_dep],
          install : true)
 else
    warning ('[-] Skipping webkit2.vala')
    warning ('\tIt requires webkit2gtk-4.0, but is not available.')
    warning ('\tCheck your system documentation to install it.')
endif


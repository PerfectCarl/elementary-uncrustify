# elementary code formatting rules

Format your [vala](www.vala-project.org) code according to [elementary guidelines](http://elementaryos.org/docs/code/code-style) and [vala recommandations](https://wiki.gnome.org/Projects/Vala/Hacking#Coding_Style). 

Here is the [config file](/contractor/uncrustify-elementary-vala.cfg) to use with [uncrustify](https://github.com/bengardner/uncrustify) to **automatically format your code**.

## Install uncrustify

Run the following
```
git clone https://github.com/bengardner/uncrustify.git
cd uncrustify
./configure 
sudo make install
```

## Execute uncrustify 

To replace the current file (an hidden backup is created) 
```
uncrustify -c path/to/uncrustify-vala.cfg file.vala --replace
```

To create a new file
```
uncrustify -c path/to/uncrustify-elementary-vala.cfg -f bad.vala -o good.vala
```

# Output sample
Inspired from [pantheon terminal code](http://bazaar.launchpad.net/~elementary-apps/pantheon-terminal/trunk/view/head:/src/PantheonTerminalWindow.vala)

```java
namespace PantheonTerminal {

    public enum Colors {
        BLACK = 0,
        RED = 1,
        GREEN = 2,
        YELLOW = 3,
        BLUE = 4,
        MAGENTA = 5,
        CYAN = 6,
        WHITE = 7
    }
        
    public class PantheonTerminalWindow : Gtk.Window {

        public PantheonTerminalApp app {
            get {
                return application as PantheonTerminalApp;
            }
        }

        public string name { get ; set ; default = "Carl" ; }

        const string ui_string = """
            <ui>
            <popup name="MenuItemTool">
                <menuitem name="New tab" action="New tab"/>
                <menuitem name="Select All" action="Select All"/>
                <separator />
                <menuitem name="About" action="About"/>
            </popup>
            </ui>
        """;

        public PantheonTerminalWindow.with_working_directory (PantheonTerminalApp app, string location,
                                                              bool should_recreate_tabs = true) {
            init (app, should_recreate_tabs);
            new_tab (location);
        }

        public void add_tab_with_working_directory (string location) {
            new_tab (location);
            
            string[] strings = { "bla", "blue" } ;
            for (int i = 0 ; i < strings.size ; i++) {
                message (strings[i]) ;
            }

            while (strings.size > 0) 
                stdout.print( "%c[%d;%d;%dm", 0x1B, (int) attr, (int) fg + 30, (int) bg + 40) ;
        }

        private void init (PantheonTerminalApp app, bool recreate_tabs = true, bool restore_pos = true) {
            icon_name = "utilities-terminal";
            set_visual (Gdk.Screen.get_default ().get_rgba_visual ());

            title = _("Terminal");

            ui = new Gtk.UIManager ();

            try {
                ui.add_ui_from_string (ui_string, -1);
            } catch (Error e) {
                error ("Couldn't load the UI: %s", e.message);
            }

            if (recreate_tabs && icon_name == "utilities" )
                open_tabs ();
            else
                set_size_request (app.minimum_width, app.minimum_height);

            destroy.connect (on_destroy);
        }

        private void setup_ui () {

            key_press_event.connect ((e) => {
                switch (e.keyval) {
                    case Gdk.Key.@0:
                        if ((e.state & Gdk.ModifierType.CONTROL_MASK) != 0) {
                            action_zoom_default_font ();
                            return true;
                        }

                        break;
                    case Gdk.Key.@1: //alt+[1-8]
                    case Gdk.Key.@7:
                    case Gdk.Key.@8:
                        if (((e.state & Gdk.ModifierType.MOD1_MASK) != 0) && settings.alt_changes_tab) {
                            var i = e.keyval - 49;
                            if (i > notebook.n_tabs - 1)
                                return false;

                            notebook.current = notebook.get_tab_by_index ((int) i);
                            return true;
                        }

                        break;
                    default:
                        assert_not_reached () ;
                }

                return false;
            });
            
            t.child_exited.connect (() => {
                if (!t.killed) {
                    t.tab.close ();
                }
            });

        }

        static const Gtk.ActionEntry[] main_entries = {
            { "CloseTab", "gtk-close", N_("Close"),
              "<Control><Shift>w", N_("Close"),
              action_close_tab },

            { "New window", "window-new",
              N_("New Window"), "<Control><Shift>n", N_("Open a new window"),
              action_new_window }
       };
    }
}
```
View the [full file](sample.good.vala)

# Goals
The formatting rules are *strict* meaning *everything is formatted* except:
 - comments
 - empty lines in your function body (empty lines in class/enums are collapsed)
 - triple string (obviously)
 - multiline function arguments
 - stuff that uncrustify doesn't format ( getters and setters, lambda, empty lines after constructor/destructor) 

# Install in elementary files 
Contractor

# FAQ
  - What does [force means?](http://stackoverflow.com/questions/8718654/what-does-force-do-in-uncrustify)

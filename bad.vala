public    enum Colors

{

        BLACK = 0,
     RED     = 1,
        GREEN   = 2,
YELLOW = 3          ,
        BLUE    = 4,
        MAGENTA =        5,
        CYAN    = 6,
        WHITE =  7             }

    // Mixing tabs and space
private    string  get_color_code(Style attr, Colors    fg,    Colors bg =    background_color)
    {
        /* Command is the control command to the terminal */
		if   ( bg== Colors.BLACK)
			return "%c[%d;%dm".printf   ( 0x1B, (int)attr, (int)fg + 30);
		            else
return "%c[%d;%d;%dm"    .    printf (   0x1B, (  int  )   attr,    (  int  )fg+30, (int)bg + 40);}
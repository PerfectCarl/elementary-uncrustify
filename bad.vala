
   namespace Opera 

{
  public Class Act 
    {

public      enum Colors

{

BLACK     = 0   ,
RED  = 1,
GREEN   = 2,
	YELLOW = 3    ,
     BLUE    = 4,
	MAGENTA =        5,
	CYAN    = 6,
	    WHITE =  7}

public string name { get ; 
  set ; default = "Carl" ; }

  static     private   string secret =    "very"  ;

   public Act  (  )     {
 }

   public ~Act  (  )     {
          }

	

	public int i_am_lost () 
{
}



        public int do_something (PantheonTerminalApp app, string location,
                                                              bool should_recreate_tabs = true) {
            do_it (app, should_recreate_tabs);
            new_tab (location);
return 0;
        }

//      Comment this
/*Comment that     */
   private string 
 get_color_code(Style attr, Colors fg,    Colors bg =    background_color)
{


		switch( a_value )
		{

		case ENUM.val1:

			var casting= (  int ) do_something () ;
			break ;case ENUM.val2:

			do_some_other_thing(    ) ;
			break ;

		default:
			assert_not_reached (    ) ;
		}


	string sql     = """ 
		SELECT * 
       FROM table 
 WHERE id = 1
""" ; 
	if  ( truth == false ) 
{
	go_mad() ;
}
else
{
	the_kids_will_be_alright () ;
}

	if  ( truth == false )  {
	go_mad() ;
   } else    {   
	the_kids_will_be_alright () ;
}

	var strings  =  Gee.ArrayList  <   String >  ( ) ;  
	for(    int   i = 0 ; i   < strings.size ;    i++  )
{
	message( strings[i]) ; 
}

    gtkwidget.clicked.connect( (widdget)  => { message ("Clicked" ) ; }) ; 

    gtkwidget.enabled.connect( (widdget)  => { 
			message ("Clicked" ) ; 

}) ; 
try 
{
ui.add_ui_from_string (ui_string, -1);
} 
catch (Error e) 
{
error ("Couldn't load the UI: %s", e.message);
}

  throw   ( new Error("big error" )  ) ;
   // Pointer arithmetic here. Why not 
   *    void data = null ; 
 some_function   ( & (data*)) ;
          string[] array = {  "bla"   , "blue"      
  } ; 
	/* Command is the control command to the terminal */
	if   ( bg== Colors.BLACK)
           return "%c[%d;%dm".printf   ( 0x1B, (int)attr, (int)fg + 30);
	else
    return "%c[%d;%d;%dm".   printf (   0x1B, (  int  )   attr,    (  int  )fg+30, (int)bg + 40);}

}}

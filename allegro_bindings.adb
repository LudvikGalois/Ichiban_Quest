
package body Allegro_Bindings is
   function Allegro_Init return unsigned_char;
   pragma Import (C, Allegro_Init, "allegro_init");

   function Allegro_Install_Keyboard return unsigned_char;
   pragma Import (C, Allegro_Install_Keyboard, "al_install_keyboard");

   function Allegro_Init_Image_Addon return unsigned_char;
   pragma Import (C, Allegro_Init_Image_Addon, "al_init_image_addon");

   function Allegro_Create_Display (width : Int; height : Int) return System.Address;
   pragma Import (C, Allegro_Create_Display, "al_create_display");

   function Allegro_Create_Timer (interval : Double) return System.Address;
   pragma Import (C, Allegro_Create_Timer, "al_create_timer");

   function Allegro_Create_Event_Queue return System.Address;
   pragma Import (C, Allegro_Create_Event_Queue, "al_create_event_queue");

   procedure Allegro_Start_Timer (target_timer : Timer);
   pragma Import (C, Allegro_Start_Timer, "al_start_timer");

   function Allegro_Get_Keyboard_Event_Source return Event_Source;
   pragma Import (C, Allegro_Get_Keyboard_Event_Source,
                  "al_get_keyboard_event_source");

   function Allegro_Get_Timer_Event_Source (target_timer : Timer)
                                            return Event_Source;
   pragma Import (C, Allegro_Get_Timer_Event_Source,
                  "al_get_timer_event_source");

   function Allegro_Get_Display_Event_Source (target_display : Display)
                                              return Event_Source;
   pragma Import (C, Allegro_Get_Display_Event_Source,
                  "al_get_display_event_source");

   procedure Allegro_Register_Event_Source (target_queue : Event_Queue;
                                            target_source : Event_Source);
   pragma Import (C, Allegro_Register_Event_Source, "al_register_event_source");

   procedure Allegro_Wait_For_Event (target_queue : Event_Queue;
                                     target_event : System.Address);
   pragma Import (C, Allegro_Wait_For_Event, "al_wait_for_event");

   function Allegro_Load_Bitmap (filepath : char_array) return System.Address;
   pragma Import (C, Allegro_Load_Bitmap, "al_load_bitmap");

   function Allegro_Map_RGB (red : Unsigned_char; blue : Unsigned_char;
                             green : Unsigned_char) return Color;
   pragma Import (C, Allegro_Map_RGB, "al_map_rgb");

   procedure Allegro_Clear_To_Color (target_color : Color);
   pragma Import (C, Allegro_Clear_To_Color, "al_clear_to_color");

   procedure Allegro_Flip_Display;
   pragma Import (C, Allegro_Flip_Display, "al_flip_display");

   procedure Allegro_Draw_Bitmap (target_bitmap : Bitmap; dx : Float;
                                  dy : Float; flags : Int);
   pragma Import (C, Allegro_Draw_Bitmap, "al_draw_bitmap");

   procedure Init is begin
      if Allegro_Init = 0 then
         raise Init_Error;
      end if;
   end Init;

   procedure Install_Keyboard is begin
      if Allegro_Install_Keyboard = 0 then
         raise Keyboard_Error;
      end if;
   end Install_Keyboard;

   procedure Init_Image_Addon is begin
      if Allegro_Init_Image_Addon = 0 then
         raise Image_Addon_Init_Error;
      end if;
   end Init_Image_Addon;

   function Create_Display (width : Int; height : Int) return Display is
      disp : System.Address := Allegro_Create_Display (width, height);
   begin
      if disp = System.Null_Address then
         raise Display_Error;
      end if;
      return Display (disp);
   end Create_Display;

   function Create_Timer (interval : Double) return Timer is
      new_timer : System.Address := Allegro_Create_Timer (interval);
   begin
      if new_timer = System.Null_Address then
         raise Timer_Init_Error;
      end if;
      return Timer (new_timer);
   end Create_Timer;

   function Create_Event_Queue return Event_Queue is
      queue : System.Address := Allegro_Create_Event_Queue;
   begin
      if queue = System.Null_Address then
         raise Event_Queue_Init_Error;
      end if;
      return Event_Queue (queue);
   end Create_Event_Queue;

   function Get_Keyboard_Event_Source return Event_Source is
   begin
      return Allegro_Get_Keyboard_Event_Source;
   end Get_Keyboard_Event_Source;

   function Get_Timer_Event_Source (target_timer : Timer) return Event_Source is
   begin
      return Allegro_Get_Timer_Event_Source (target_timer);
   end Get_Timer_Event_Source;

   function Get_Display_Event_Source (target_display : Display)
                                      return Event_Source is
   begin
      return Allegro_Get_Display_Event_Source (target_display);
   end Get_Display_Event_Source;

   procedure Start_Timer (target_timer : Timer) is
   begin
      Allegro_Start_Timer(target_timer);
   end Start_Timer;

   procedure Register_Event_Source (target_queue  : Event_Queue ;
                                    target_source : Event_Source ) is
   begin
      Allegro_Register_Event_Source (target_queue, target_source);
   end Register_Event_Source;

   procedure Wait_For_Event (target_queue : in Event_Queue ;
                             target_event : out Event) is
   begin
      Allegro_Wait_For_Event(target_queue, target_event'Address);
   end Wait_For_Event;

   function Load_Bitmap (filepath : String) return Bitmap is
      new_bitmap : System.Address := Allegro_Load_Bitmap (To_C (filepath));
   begin
      if new_bitmap = System.Null_Address then
         raise Bitmap_Load_Error;
      end if;
      return Bitmap (new_bitmap);
   end Load_Bitmap;

   function Map_RGB (red : Color_Channel; blue : Color_Channel;
                     green : Color_Channel) return Color is
   begin
      return Allegro_Map_RGB (Unsigned_char (red), Unsigned_char (blue),
                              Unsigned_char (green));
   end Map_RGB;

   procedure Clear_To_Color (target_color : Color) is
   begin
      Allegro_Clear_To_Color(target_color);
   end Clear_To_Color;

   procedure Flip_Display is
   begin
      Allegro_Flip_Display;
   end Flip_Display;

   procedure Draw_Bitmap (target_bitmap : Bitmap; dx : Float; dy : Float) is
   begin
      Allegro_Draw_Bitmap (target_bitmap, dx, dy, 0);
   end Draw_Bitmap;

end Allegro_Bindings;

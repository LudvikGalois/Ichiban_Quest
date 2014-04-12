with Interfaces.C; use Interfaces.C;
with System; use System;
with Allegro_Keycodes; use Allegro_Keycodes;

package Allegro_Bindings is
   Init_Error : Exception;
   Keyboard_Error : Exception;
   Image_Addon_Init_Error : Exception;
   Display_Error : Exception;
   Timer_Init_Error : Exception;
   Event_Queue_Init_Error : Exception;
   Bitmap_Load_Error : Exception;

   type Display is new System.Address;
   type Event_Queue is new System.Address;
   type Event_Source is new System.Address;
   type Timer is new System.Address;
   type Bitmap is new System.Address;
   type Joystick is new System.Address;
   type User_Event_Descriptor is new System.Address;

   procedure Init;
   procedure Init_Image_Addon;
   procedure Install_Keyboard;

   function Create_Display (width : Int; height : Int) return Display;
   function Create_Timer (interval : Double) return Timer;
   function Create_Event_Queue return Event_Queue;
   function Load_Bitmap (filepath : String) return Bitmap;


   function Get_Keyboard_Event_Source return Event_Source;
   function Get_Timer_Event_Source (target_timer : Timer) return Event_Source;
   function Get_Display_Event_Source
     (target_display : Display) return Event_Source;

   procedure Start_Timer(target_timer : Timer);
   procedure Register_Event_Source (target_queue : Event_Queue;
                                    target_source : Event_Source);

   type Event_Type_Number is new Unsigned;

   type Event_Type is (Any_Event, Display_Event, Keyboard_Event,
                       Mouse_Event, Timer_Event, Joystick_Event, User_Event);

   -- Because we don't implement all events we've artificially added
   -- the required padding
   subtype Padding_Size is Integer range 0 .. 17;
   type Event_Padding is array (Padding_Size) of Int;

   type Event_Data (event_data_type : Event_Type := Any_Event) is
      record
         ev_type : Event_Type_Number;
         src_type : System.Address;
         timestamp : Double;
         case event_data_type is
            when Any_Event =>
               is_any_event : Boolean := True;
            when Display_Event =>
               disp_x : Int;
               disp_y : Int;
               disp_width : Int;
               disp_height : Int;
               disp_orientation : Int;
            when Keyboard_Event =>
               key_current_display : Display;
               key_keycode : Keycode;
               key_unichar : Int;
               key_modifiers : Unsigned;
               key_repeat : Unsigned_Char;
            when Mouse_Event =>
               mouse_x : Int;
               mouse_y : Int;
               mouse_z : Int;
               mouse_w : Int;
               mouse_dx : Int;
               mouse_dy : Int;
               moust_dz : Int;
               moust_dw : Int;
               mouse_button : Unsigned;
               mouse_pressure : Float;
            when Timer_Event =>
               timer_count : Long;
               timer_error : Double;
            when Joystick_Event =>
               joystick_id : Joystick;
               joystick_stick : Int;
               joystick_axis : Int;
               joystick_pos : Float;
               joystick_button : Int;
            when User_Event =>
               user_internal_descr : User_Event_Descriptor;
               user_data1 : Int;
               user_data2 : Int;
               user_data3 : Int;
               user_data4 : Int;
         end case;
      end record;

   pragma Unchecked_Union (Event_Data);
   pragma Convention (C, Event_Data);

   type Event (is_padding : Boolean := False) is
      record
         case is_padding is
            when True => padding : Event_Padding;
            when False => ev_data : Event_Data;
         end case;
      end record;

   pragma Unchecked_Union (Event);
   pragma Convention (C, Event);

   procedure Wait_For_Event (target_queue : in Event_Queue;
                             target_event : out Event);

   type Color is
      record
         red : Float;
         green : Float;
         blue : Float;
         alpha : Float;
      end record;
   pragma Convention (C, Color);

   type Color_Channel is mod 256;

   Function Map_RGB (red : Color_Channel; blue : Color_Channel;
                     green : Color_Channel) return Color;

   procedure Clear_To_Color (target_color : Color);

   procedure Flip_Display;

   procedure Draw_Bitmap (target_bitmap : Bitmap; dx : Float; dy : Float);

   Joystick_Axis_Event : constant Event_Type_Number := 1;
   Joystick_Button_Down_Event : constant Event_Type_Number := 2;
   Joystick_Button_Up_Event : constant Event_Type_Number := 3;
   Joystick_Configuration_Event : constant Event_Type_Number := 4;

   Key_Down_Event : constant Event_Type_Number := 10;
   Key_Char_Event : constant Event_Type_Number := 11;
   Key_Up_Event : constant Event_Type_Number := 12;

   Mouse_Axes_Event : constant Event_Type_Number := 20;
   Mouse_Button_Down_Event : constant Event_Type_Number := 21;
   Mouse_Button_Up_Event : constant Event_Type_Number := 22;
   Mouse_Enter_Display_Event : constant Event_Type_Number := 23;
   Mouse_Leave_Display_Event : constant Event_Type_Number := 24;
   Mouse_Warped_Event : constant Event_Type_Number := 25;

   Timer_Tick_Event : constant Event_Type_Number := 30;

   Display_Expose_Event : constant Event_Type_Number := 40;
   Display_Resize_Event : constant Event_Type_Number := 41;
   Display_Close_Event : constant Event_Type_Number := 42;
   Display_Lost_Event : constant Event_Type_Number := 43;
   Display_Found_Event : constant Event_Type_Number := 44;
   Display_Switch_In_Event : constant Event_Type_Number := 45;
   Display_Switch_Out_Event : constant Event_Type_Number := 46;
   Display_Orientation_Event : constant Event_Type_Number := 47;


end Allegro_Bindings;

with Ada.Text_IO;
with Allegro_Bindings;
with Interfaces.C; use Interfaces.C;

procedure Ichiban_Quest is
   package Allegro renames Allegro_Bindings;
begin
   Allegro.Init;
   Allegro.Install_Keyboard;
   Allegro.Init_Image_Addon;
   declare
      display : Allegro.Display := Allegro.Create_Display(width  => 640,
                                                          height => 480);
      timer : Allegro.Timer := Allegro.Create_Timer (interval => 1.0/60.0);
      event_queue : Allegro.Event_Queue := Allegro.Create_Event_Queue;
      test_image : Allegro.Bitmap := Allegro.Load_Bitmap("./image-small.png");
      event : Allegro.Event;
   begin
      Allegro.Register_Event_Source
        (event_queue, Allegro.Get_Display_Event_Source (Display));
      Allegro.Register_Event_Source
        (event_queue, Allegro.Get_Keyboard_Event_Source);
      Allegro.Register_Event_Source
        (event_queue, Allegro.Get_Timer_Event_Source (Timer));
      Allegro.Clear_To_Color (Allegro.Map_RGB (0,0,0));
      Allegro.Draw_Bitmap (test_image, 100.0, 100.0);
      Allegro.Flip_Display;
      Allegro.Start_Timer (timer);
        loop
           Allegro.Wait_For_Event(event_queue, event);
           case event.ev_data.ev_type is
              when Allegro.Timer_Tick_Event =>
                 Allegro.Flip_Display;
              when Allegro.Key_Down_Event => exit;
              when others => null;
           end case;
        end loop;
   end;

end Ichiban_Quest;

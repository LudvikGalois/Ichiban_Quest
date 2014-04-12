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
      test_image : Allegro.Bitmap := Allegro.Load_Bitmap("./Doge-small.png");
      event : Allegro.Event;
      image_dx : Float := -4.0 ;
      image_dy : Float := 4.0;
      image_x  : Float := 200.0;
      image_y : Float  := 200.0;
   begin
      Allegro.Register_Event_Source
        (event_queue, Allegro.Get_Display_Event_Source (Display));
      Allegro.Register_Event_Source
        (event_queue, Allegro.Get_Keyboard_Event_Source);
      Allegro.Register_Event_Source
        (event_queue, Allegro.Get_Timer_Event_Source (Timer));
      Allegro.Clear_To_Color (Allegro.Map_RGB (0,0,0));
      Allegro.Start_Timer (timer);

      loop
         Allegro.Wait_For_Event(event_queue, event);
         case event.ev_data.ev_type is
            when Allegro.Timer_Tick_Event =>
               if image_x > 600.0 or image_x < 10.0 then
                  image_dx := image_dx * (-1.0);
               end if;
               if image_y > 400.0 or image_y < 10.0 then
                  image_dy := image_dy * (-1.0);
               end if;
               image_x := image_x + image_dx;
               image_y := image_y + image_dy;
               Allegro.Clear_To_Color (Allegro.Map_RGB (0,0,0));
               Allegro.Draw_Bitmap (test_image, image_x, image_y);
               Allegro.Flip_Display;
            when Allegro.Key_Down_Event => exit;
            when others => null;
         end case;
      end loop;
   end;

end Ichiban_Quest;

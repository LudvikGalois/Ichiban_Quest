with Ada.Text_IO;
with Allegro_Bindings;
with Allegro_Keycodes;
with Interfaces.C; use Interfaces.C;

procedure Ichiban_Quest is
   package Allegro renames Allegro_Bindings;
   package AK renames Allegro_Keycodes;
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
      image_x  : Float := 200.0;
      image_y : Float  := 200.0;

      type Arrow_Keys is (Up, Left, Right, Down);
      keys_down : array (Arrow_Keys) of Boolean;

   begin
      keys_down(Up) := False;
      keys_down(Left) := False;
      keys_down(Right) := False;
      keys_down(Down) := False;
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
               if keys_down(Up) then
                  image_y := image_y - 5.0;
               end if;
               if keys_down(Down) then
                  image_y := image_y + 5.0;
               end if;
               if keys_down(Left) then
                  image_x := image_x - 5.0;
               end if;
               if keys_down(Right) then
                  image_x := image_x + 5.0;
               end if;
               Allegro.Clear_To_Color (Allegro.Map_RGB (0,0,0));
               Allegro.Draw_Bitmap (test_image, image_x, image_y);
               Allegro.Flip_Display;
            when Allegro.Key_Down_Event =>
               case event.ev_data.key_keycode is
                  when AK.Key_Enter => exit;
                  when AK.Key_Up => keys_down(Up) := True;
                  when AK.Key_Down => keys_down(Down) := True;
                  when AK.Key_Left => keys_down(Left) := True;
                  when AK.Key_Right => keys_down(Right) := True;
                  when others => null;
               end case;
            when Allegro.Key_Up_Event =>
               case event.ev_data.key_keycode is
                  when AK.Key_Up => keys_down(Up) := False;
                  when AK.Key_Down => keys_down(Down) := False;
                  when AK.Key_Left => keys_down(Left) := False;
                  when AK.Key_Right => keys_down(Right) := False;
                  when others => null;
               end case;
            when others => null;
         end case;
      end loop;
   end;

end Ichiban_Quest;

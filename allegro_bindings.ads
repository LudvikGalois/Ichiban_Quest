package Allegro_Bindings is
   procedure Allegro_Init;
   pragma Import (C, Allegro_Init, "allegro_init");
end Allegro_Bindings;

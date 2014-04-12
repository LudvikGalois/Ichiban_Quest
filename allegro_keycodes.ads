with Interfaces.C; use Interfaces.C;

package Allegro_Keycodes is

   type Keycode is new Int;

   Key_A : constant Keycode := 1;
   Key_B : constant Keycode := 2;
   Key_C : constant Keycode := 3;
   Key_D : constant Keycode := 4;
   Key_E : constant Keycode := 5;
   Key_F : constant Keycode := 6;
   Key_G : constant Keycode := 7;
   Key_H : constant Keycode := 8;
   Key_I : constant Keycode := 9;
   Key_J : constant Keycode := 10;
   Key_K : constant Keycode := 11;
   Key_L : constant Keycode := 12;
   Key_M : constant Keycode := 13;
   Key_N : constant Keycode := 14;
   Key_O : constant Keycode := 15;
   Key_P : constant Keycode := 16;
   Key_Q : constant Keycode := 17;
   Key_R : constant Keycode := 18;
   Key_S : constant Keycode := 19;
   Key_T : constant Keycode := 20;
   Key_U : constant Keycode := 21;
   Key_V : constant Keycode := 22;
   Key_W : constant Keycode := 23;
   Key_X : constant Keycode := 24;
   Key_Y : constant Keycode := 25;
   Key_Z : constant Keycode := 26;

   Key_0 : constant Keycode := 27;
   Key_1 : constant Keycode := 28;
   Key_2 : constant Keycode := 29;
   Key_3 : constant Keycode := 30;
   Key_4 : constant Keycode := 31;
   Key_5 : constant Keycode := 32;
   Key_6 : constant Keycode := 33;
   Key_7 : constant Keycode := 34;
   Key_8 : constant Keycode := 35;
   Key_9 : constant Keycode := 36;

   Key_Pad_0 : constant Keycode := 37;
   Key_Pad_1 : constant Keycode := 38;
   Key_Pad_2 : constant Keycode := 39;
   Key_Pad_3 : constant Keycode := 40;
   Key_Pad_4 : constant Keycode := 41;
   Key_Pad_5 : constant Keycode := 42;
   Key_Pad_6 : constant Keycode := 43;
   Key_Pad_7 : constant Keycode := 44;
   Key_Pad_8 : constant Keycode := 45;
   Key_Pad_9 : constant Keycode := 46;

   Key_F1 : constant Keycode := 47;
   Key_F2 : constant Keycode := 48;
   Key_F3 : constant Keycode := 49;
   Key_F4 : constant Keycode := 50;
   Key_F5 : constant Keycode := 51;
   Key_F6 : constant Keycode := 52;
   Key_F7 : constant Keycode := 53;
   Key_F8 : constant Keycode := 54;
   Key_F9 : constant Keycode := 55;
   Key_F10 : constant Keycode := 56;
   Key_F11 : constant Keycode := 57;
   Key_F12 : constant Keycode := 58;

   Key_Escape : constant Keycode := 59;
   Key_Tilde : constant Keycode := 60;
   Key_Minus : constant Keycode := 61;
   Key_Equals : constant Keycode := 62;
   Key_Backspace : constant Keycode := 63;
   Key_Tab : constant Keycode := 64;
   Key_Open_Brace : constant Keycode := 65;
   Key_Close_Brace : constant Keycode := 66;
   Key_Enter : constant Keycode := 67;
   Key_Semicolon : constant Keycode := 68;
   Key_Quote : constant Keycode := 69;
   Key_Backslash : constant Keycode := 70;
   Key_Backslash2 : constant Keycode := 71;
   Key_Comma : constant Keycode := 72;
   Key_Full_Stop : constant Keycode := 73;
   Key_Slash : constant Keycode := 74;
   Key_Space : constant Keycode := 75;

   Key_Insert : constant Keycode := 76;
   Key_Delete : constant Keycode := 77;
   Key_Home  : constant Keycode := 78;
   Key_End  : constant Keycode := 79;
   Key_Page_Up  : constant Keycode := 80;
   Key_Page_Down  : constant Keycode := 81;
   Key_Left : constant Keycode := 82;
   Key_Right : constant Keycode := 83;
   Key_Up : constant Keycode := 84;
   Key_Down : constant Keycode := 85;

   Key_Pad_Slash : constant Keycode := 86;
   Key_Pad_Asterisk : constant Keycode := 87;
   Key_Pad_Minus : constant Keycode := 88;
   Key_Pad_Plus : constant Keycode := 89;
   Key_Pad_Delete : constant Keycode := 90;
   Key_Pad_Enter : constant Keycode := 91;

   Key_Print_Screen : constant Keycode := 92;
   Key_Pause : constant Keycode := 93;

   Key_ABNT_C1 : constant Keycode := 94; -- wtf is this?
   Key_Yen : constant Keycode := 95;
   Key_Kana : constant Keycode := 96;
   Key_Convert : constant Keycode := 97;
   Key_No_Convert : constant Keycode := 98;
   Key_At : constant Keycode := 99;
   Key_Circumflex : constant Keycode := 100;
   Key_Colon2 : constant Keycode := 101;
   Key_Kanji : constant Keycode := 102;

   Key_Pad_Equals : constant Keycode := 103;
   Key_Backquote : constant Keycode := 104;
   Key_Semicolon2 : constant Keycode := 105;
   Key_Command : constant Keycode := 106;
   Key_Unknown : constant Keycode := 107;

   Key_Modifiers : constant Keycode := 215;

   Key_Left_Shift : constant Keycode := 215;
   Key_Right_Shift : constant Keycode := 216;
   Key_Left_Control : constant Keycode := 217;
   Key_Right_Control : constant Keycode := 218;
   Key_Alt : constant Keycode := 219;
   Key_Alt_Gr : constant Keycode := 220;
   Key_Left_Win : constant Keycode := 221;
   Key_Right_Win : constant Keycode := 222;
   Key_Menu : constant Keycode := 223;
   Key_Scroll_Lock : constant Keycode := 224;
   Key_Num_Lock : constant Keycode := 225;
   Key_Caps_Lock : constant Keycode := 226;

   type Key_Modifier is (Keymod_Shift, Keymod_Control, Keymod_Alt,
                         Keymod_LWin, Keymod_RWin, Keymod_Menu,
                         Keymod_AltGr, Keymod_Command, Keymod_Scroll_Lock,
                         Keymod_Numlock, Keymod_Capslock, Keymod_InAltSeq,
                         Keymod_Accent1, Keymod_Accent2, Keymod_Accent3,
                         Keymod_Accent4);

   type Key_Modifier_Flags is array (Key_Modifier) of Boolean;
   for Key_Modifier_Flags'Size use 32; -- because fuck you C, that's why
   pragma Pack (Key_Modifier_Flags);
   pragma Warnings (Off, Key_Modifier_Flags); -- See above comment


end Allegro_Keycodes;

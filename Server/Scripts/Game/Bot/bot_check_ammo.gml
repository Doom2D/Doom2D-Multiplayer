//checks if bot has any ammo
if (w == 1 || w == 4) && a1 < 1 {return false;}
if (w == 1 || w == 4) && a1 > 1 {return true;}
if (w == 2 || w == 3 || w == 8) && a2 < 1 {return false;}
if (w == 2 || w == 3 || w == 8) && a2 > 1 {return true;}
if (w == 5) && a3 < 1 {return false;}
if (w == 5) && a3 > 1 {return true;}
if (w == 6 && a4 < 1) {return false;}
if (w == 6 && a4 > 1) {return true;}
if (w == 7 && a4 < 40) {return false;}
if (w == 7 && a4 > 39) {return true;}
if w == 0 || w == 9 {return true;}

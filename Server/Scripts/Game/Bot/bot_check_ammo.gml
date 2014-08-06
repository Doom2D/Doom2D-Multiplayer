//checks if bot has any ammo

if (w == 0 || w == 9) {return true;}

if (w == 1 || w == 4) { if a1 > 0  {return true;} else {return false;} }

if (w == 2 || w == 8) { if a2 > 0  {return true;} else {return false;} }
if  w == 3            { if a2 > 1  {return true;} else {return false;} }

if  w == 5            { if a3 > 0  {return true;} else {return false;} }

if  w == 6            { if a4 > 0  {return true;} else {return false;} }
if  w == 7            { if a4 > 39 {return true;} else {return false;} }

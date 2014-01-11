//derp interpolation
if !global.cl_interp || xto == 99999 {exit;}
if x > xto {x -= (x - xto) / global.cl_interp;} else {x += (xto - x) / global.cl_interp;}
if y > yto {y -= (y - yto) / global.cl_interp;} else {y += (yto - y) / global.cl_interp;}

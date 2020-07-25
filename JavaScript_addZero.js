// Add prefix zeros. i.e. Add 0s to the time clock UTC for better formatting.

function addZero(x,n) {
  
  while (x.toString().length < n) { 
    x = '0' + x; 
  } 
  return x; 

}
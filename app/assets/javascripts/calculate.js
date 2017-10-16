var grades = [65.95, 56.98, 78.62, 96.1, 90.3, 72.24, 92.34, 60.00, 81.43, 86.22, 88.33, 9.03,
 49.93, 52.34, 53.11, 50.10, 88.88, 55.32, 55.69, 61.68, 70.44, 70.54, 90.0, 71.11, 80.01];

var bounds = [100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 0];
var aplus = 0;
var a = 0;
var aminus = 0;
var bplus = 0;
var b = 0;
var bminus = 0;
var cplus = 0;
var c = 0;
var cminus = 0;
var d = 0;
var f = 0;


function onboundchanged(fieldid) {
  resetcounters();
  sortgrades();
  // alert(grades);
  setbounds(fieldid);
  displayhistogram();
}

function sortgrades(){
  grades.sort().reverse();
}

function resetcounters(){
// TODO
}

function setbounds(fieldid){
    var inputbound = document.getElementById('l'+fieldid).value;
    bounds[fieldid] = inputbound;
    // alert(bounds[fieldid]);
}


function displayhistogram() {
  resetelementids();
  for (var i in grades) {
    // alert(grades[i]);
    if (grades[i]<bounds[0] && grades[i]>= bounds[1]) { aplus++;
        document.getElementById('r0').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[1] && grades[i]>= bounds[2]) { a++;
        document.getElementById('r1').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[2] && grades[i]>= bounds[3]) { aminus++;
      document.getElementById('r2').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[3] && grades[i]>= bounds[4]) { bplus++;
        document.getElementById('r3').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[4] && grades[i]>= bounds[5]) { b++;
        document.getElementById('r4').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[5] && grades[i]>= bounds[6]) { bminus++;
        document.getElementById('r5').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[6] && grades[i]>= bounds[7]) { cplus++;
        document.getElementById('r6').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[7] && grades[i]>= bounds[8]) { c++;
        document.getElementById('r7').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[8] && grades[i]>= bounds[9]) { cminus++;
        document.getElementById('r8').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[9] && grades[i]>= bounds[10]) { d++;
        document.getElementById('r9').innerHTML += "<img src='redtiny.png'/>";
    }
    if (grades[i]<bounds[10] && grades[i]>= bounds[11]) { f++;
        document.getElementById('r10').innerHTML += "<img src='redtiny.png'/>";
    }
  }

}

function resetelementids(){
   document.getElementById('r0').innerHTML = "";
   document.getElementById('r1').innerHTML = "";
   document.getElementById('r2').innerHTML = "";
   document.getElementById('r3').innerHTML = "";
   document.getElementById('r4').innerHTML = "";
   document.getElementById('r5').innerHTML = "";
   document.getElementById('r6').innerHTML = "";
   document.getElementById('r7').innerHTML = "";
   document.getElementById('r8').innerHTML = "";
   document.getElementById('r9').innerHTML = "";
   document.getElementById('r10').innerHTML = "";
}


// ---------------------------------------------------------------------- /
//  p5.js Polar Clock v1.0.0
//  Jeff McCarley : 180526
//  Sketch to create polar clock of various configurations
// ---------------------------------------------------------------------- /
//  TODO :
//    -create SoftClock class
//    -create clock array
// ---------------------------------------------------------------------- /
// Rotation offset to bring midnight to PI/2 radians (90deg)
var DELTA_OFFSET;
// Frames Per Second
var  FPS = 10;
// Radians Per Second : calculated in setup()
var RPS;
// Current time
var hh;     // hour
var mm;     // minute
var ss;     // second
// Current angles
var thetaSecond = 0;
var thetaMinute = 0;
var thetaHour = 0;
// Figure metrics
var figureSize = 0.0;
var shapeRadius = 0.0;
// Pre-defined clock themes :
var themeIndex = 0;
var themes = [
  {
    name : "Red",
    colorSecond : "#F00",
    colorMinute : "#A00",
    colorHour   : "#600",
    colorFace   : "#AAA",
    colorHand   : "#FFF",
    fillHand    : false
  },
  {
    name : "Yellow",
    colorSecond : "#FE0 ",
    colorMinute : "#FA0",
    colorHour   : "#630",
    colorFace   : "#AAA",
    colorHand   : "#FE0",
    fillHand    : false
  },
  {
    name : "Green",
    colorSecond : "#0F0",
    colorMinute : "#0A0",
    colorHour   : "#060",
    colorFace   : "#AAA",
    colorHand   : "#FFF",
    fillHand    : false
  },
  {
    name : "Cyan",
    colorSecond : "#0FF",
    colorMinute : "#0AA",
    colorHour   : "#066",
    colorFace   : "#AAA",
    colorHand   : "#0FF",
    fillHand    : false
  },
  {
    name : "Blue",
    colorSecond : "#00F",
    colorMinute : "#00C",
    colorHour   : "#009",
    colorFace   : "#AAA",
    colorHand   : "#FFF",
    fillHand    : false
  },
  {
    name : "Magenta",
    colorSecond : "#F0F",
    colorMinute : "#A0A",
    colorHour   : "#606",
    colorFace   : "#AAA",
    colorHand   : "#F0F",
    fillHand    : false
  },
  {
    name : "Gray",
    colorSecond : "#EEE",
    colorMinute : "#CCC",
    colorHour   : "#AAA",
    colorFace   : "#555",
    colorHand   : "#F00",
    fillHand    : false
  },
  {
    name : "Hot",
    colorSecond : "#FE0",
    colorMinute : "#FA0",
    colorHour   : "#F00",
    colorFace   : "#AAA",
    colorHand   : "#555",
    fillHand    : true
  },
  {
    name : "Cold",
    colorSecond : "#0A0",
    colorMinute : "#00A",
    colorHour   : "#A0A",
    colorFace   : "#AAA",
    colorHand   : "#555",
    fillHand    : true
  },
  {
    name : "RGB",
    colorSecond : "#F00",
    colorMinute : "#0F0",
    colorHour   : "#00F",
    colorFace   : "#AAA",
    colorHand   : "#555",
    fillHand    : true
  }
];

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function drawFace() {
  //
  noStroke();
  fill(themes[themeIndex].colorFace);
  ellipse(0, 0, figureSize * 0.95);
}

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function drawMarkers() {
  //
  noStroke();
  fill("#555");
  //
  for (var i = 0; i < 60; i++) {
    var theta = RPS * i;
    //
    if ((i % 5) == 0) {
      // major
      ellipse(shapeRadius * cos(theta), shapeRadius * sin(theta), 10);
    } else {
      // minor
      ellipse(shapeRadius * cos(theta), shapeRadius * sin(theta), 5);
    }
  }
}

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function drawHands() {
  //
  stroke(themes[themeIndex].colorFace);
  strokeWeight(3);
  // Hour arc
  if (hh) {
    fill(themes[themeIndex].colorHour);
    arc(0, 0, figureSize * 0.94, figureSize * 0.94, 0, thetaHour, PIE);
  }
  // Minute arc
  if (mm) {
    fill(themes[themeIndex].colorMinute);
    arc(0, 0, figureSize * 0.64, figureSize * 0.64,  0, thetaMinute, PIE);
  }
  // Second arc
  if (ss) {
    fill(themes[themeIndex].colorSecond);
    arc(0, 0, figureSize * 0.34, figureSize * 0.34,  0, thetaSecond, PIE);
  }
  // Hour marker
  strokeWeight(1);
  stroke("#000");
  fill(themes[themeIndex].colorHour);
  ellipse(shapeRadius * cos(thetaHour), shapeRadius * sin(thetaHour), 10);
  // Minute marker
  stroke("#000");
  fill(themes[themeIndex].colorMinute);
  ellipse(shapeRadius * cos(thetaMinute), shapeRadius * sin(thetaMinute), 10);
  // Second hand
  if (themes[themeIndex].fillHand) {
    fill(themes[themeIndex].colorSecond);
  } else {
    noFill();
  }
  strokeWeight(3);
  stroke(themes[themeIndex].colorHand);
  line(0, 0, (shapeRadius-7) * cos(thetaSecond), (shapeRadius-7) * sin(thetaSecond));
  ellipse(shapeRadius * cos(thetaSecond), shapeRadius * sin(thetaSecond), 10);
  // center point...
  noStroke();
  fill(themes[themeIndex].colorFace);
  ellipse(0, 0, 15);
  fill("#555");
  ellipse(0, 0, 10);
}

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function softClock() {
  // update time structure
  if (ss < 59) {
    ss++;
  } else {
    ss = 0;
    if (mm < 59) {
      mm++;
    } else {
      mm = 0;
      if (hh < 11) {
        hh++;
      } else {
        hh = 0;
      }
    }
  }
  // console.log(hh, mm, ss);

  if (hh > 11) hh = hh - 12;

  thetaHour   = (RPS * 5.0) * hh;
  thetaMinute =  RPS * mm;
  thetaSecond =  RPS * ss;
  // console.log(thetaHour, thetaMinute, thetaSecond);
}

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function setup() {
  // if (location.pathname == "/simple_pages/demo") {

  // photogenic time
  // hh = 4;
  // mm = 40;
  // ss = 50;
  // themeIndex = 9;

  // test time
  // hh = 11;
  // mm = 59;
  // ss = 45;

  // get client time
  hh = hour();
  mm = minute();
  ss = second();

  // calculate radians per second
  RPS = (2 * PI) / 60.0;
  // PI is now available...
  DELTA_OFFSET = -(PI / 2.0);
  // configure canvas...
//  var containerSize = document.getElementById("container").clientWidth;
  var containerSize = 300;
  figureSize = containerSize * 0.75;
  shapeRadius = figureSize  / 2;
  createCanvas(containerSize, containerSize).parent(document.getElementById("canvas"));
  // set color configuration
  colorMode(RGB, 100, 100, 100, 100);
  // set frame rate
  frameRate(FPS);
  // render first frame
  drawFrame();
}
// }

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function draw() {
  // if (location.pathname == "/simple_pages/demo") {
  // one frame per second
  if (frameCount % FPS == 0) {
    // update time data :
    softClock();
    // step through themes
    if (ss%15 == 0) {
      themeIndex = (themeIndex < themes.length-1) ? themeIndex+1 : 0;
    }
    // draw a single frame
    drawFrame();
    // halt & save...
    // frameRate(0);
    // save(themes[themeIndex].name + '.png');
  }
}
// }

// ---------------------------------------------------------------------- /
//
// ---------------------------------------------------------------------- /
function drawFrame() {
  // configure canvas coordinates :
  translate(width/2, height/2);
  rotate(DELTA_OFFSET);
  // set background color :
  background("#ccc");
  // render clock components :
  drawFace();
  drawMarkers();
  drawHands();
}

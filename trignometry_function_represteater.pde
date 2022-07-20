float angle = 0;
float angleChangeFactor = 1;
float maxAngleChange = 10;
float rectWidth = 6;
float upperHeight = 150;
float leftGap = 100;
boolean fromRight = true;
boolean renderingDetails = true;
color startingColor = #ff0000;
color endingColor = #0000ff;
Function currentFunction = Function.Sine;
void setup() {
  size(1700, 900);
}
void draw() {
  background(0);
  renderProgressBar();
  stroke(0, 155, 0);
  int count = 0;
  noStroke();
  for (float a = leftGap; a < width; a += rectWidth) {
    float functionH = 0, y = 0;
    float thetha = angle + a;
    if (currentFunction == Function.Sine)
      functionH = sin(radians(thetha));
    else if (currentFunction == Function.Cosine)
      functionH = cos(radians(thetha));
    else if (currentFunction == Function.Tangant)
      functionH = tan(radians(thetha));
    else if (currentFunction == Function.Cosecant)
      functionH = 1/sin(radians(thetha));
    else if (currentFunction == Function.Secant)
      functionH = 1/cos(radians(thetha));
    else if (currentFunction == Function.Cotangant)
      functionH = 1/tan(radians(thetha));
    y = map(functionH, -1, 1, upperHeight, height * (0.75));
    float b = map(a, 0, width, 1, 255);
    float g = map(y, upperHeight, height, 1, 255);
    float r = 255;
    fill(r, g, b);
    //rect(a, y, rectWidth, height - y);
    circle(a, y, rectWidth);
    count++;
  }
  if (renderingDetails)
    renderDetails();
  println("Rect count : " +count);
  renderFunctionBoxs();
  angle += (progressValue * angleChangeFactor);
  if (angle >= 360 || angle <= -360)
    angle %= 360;
}
void keyPressed() {
  if (keyCode == 'q' || keyCode =='Q')
    angleChangeFactor *= -1;
  if (keyCode == 's' || keyCode =='S')
    currentFunction = Function.Sine;
  if (keyCode == 'c' || keyCode =='C')
    currentFunction = Function.Cosine;
  if (keyCode == 't' || keyCode =='T')
    currentFunction = Function.Tangant;
  if (keyCode == 'm' || keyCode =='M')
    rectWidth += 1;
  if (keyCode == 'n' || keyCode =='N')
    if (rectWidth != 1)
      rectWidth -= 1;
  if (keyCode == 'p' || keyCode == 'P')
    renderingDetails = !renderingDetails;
  if (keyCode == UP)
    maxAngleChange += 1;
  if (keyCode == DOWN)
    maxAngleChange -= 1;
}
void renderDetails() {
  fill(125);
  textSize(25);
  stroke(0, 155, 0);
  // X and Y axis.
  text("X", 10, (cos(radians(45)) * height * (0.75)) - (upperHeight/2) - 20);
  text("Y", 70, (cos(radians(45)) * height * (0.75)) - (upperHeight/2) - 80);
  // details
  String str ="Function type : "+currentFunction.string;
  text( str, (width - str.length())/2, 50);
  text("Angle : "+angle, 110, height - 100);
  text("Angle Change Factor : "+angleChangeFactor, 110, height - 50);
  str = "Max Angle Change : "+maxAngleChange;
  text(str, (width  + str.length())/2, height - 50);
  text("Particle Size : " + rectWidth, (width  + str.length())/2 - 250, height - 50);
  line(0, (cos(radians(45)) * height * (0.75)) - (upperHeight/2), width, (cos(radians(45)) * height * (0.75)) - (upperHeight/2));
  line(100, 0, 100, height);
  println("Function type : " + currentFunction.string);
}
void renderFunctionBoxs() {
  float boxSize = 50;
  float boxGap = 10;
  stroke(125);
  for (int a = 0; a < 6; a++) {
    float rectWidth = (Function.values()[a].string.length() * 10);
    float rectHeight = boxSize - boxGap;
    float x = (100 - rectWidth) / 2;
    float y = boxSize + (cos(radians(45)) * height * (0.75)) - (upperHeight/2) + (a*boxSize) + boxGap;
    strokeWeight(1);
    stroke(60, 240, 214);
    fill(255);
    if (mousePressed)
      if (mouseX > x && mouseX < (x +  rectWidth)&&
        mouseY > y && mouseY < (y + rectHeight))
        currentFunction = Function.values()[a];
    if (Function.values()[a] == currentFunction)
      strokeWeight(5);
    rect(x, y, rectWidth, rectHeight);
    fill(0);
    textSize(20);
    text(Function.values()[a].string, x+(Function.values()[a].string.length()/2), y + (boxSize / 2));
  }
}

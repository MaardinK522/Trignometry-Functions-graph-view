PVector rect = new PVector(25, 30 *(30/maxAngleChange));
float progressValue = 1;
float delta = 0.1;
void renderProgressBar() {
  if (mouseY > 30 && mouseY < 350 && mousePressed)
    if ( mouseX > rect.x && mouseX < rect.x + 50 && mouseY > rect.y && mouseY < rect.y + 50) {
      rect.y = mouseY - 25;
    } else {
    }
  stroke(255);
  strokeWeight(5);
  line(50, 30, 50, 350);
  fill(255);
  stroke(125);
  rect(rect.x, rect.y, 50, 50);
  //circle(rect.x + 25, rect.y + 25, 2);
  float progressBarLength = dist(50, 30, 50, 350) / maxAngleChange;
  progressValue = dist(rect.x + 25, rect.y, 50, 30) / progressBarLength;
  fill(0);
  text(progressValue, rect.x, rect.y + 25);
}

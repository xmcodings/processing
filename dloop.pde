// double loop interaction artDesign
int circleWidth = 50;
int numforsc_1 = 19;    // 19
int numforsc_2 = 17;    // 17
int numforlc_1 = 31;    // 31
int numforlc_2 = 23;    // 23
SCircle sc = new SCircle();
LCircle lc = new LCircle();

int bg1[] = {241,214,147,0,220};
int bg2[] = {213,150,86,0,220};
int bg3[] = {140, 102, 58,0,220};

int r,g,b;

int bgcounter = 0;

void setup()
{
  size(800, 800);
  r = bg1[0];
  g = bg2[0];
  b = bg3[0];

}
void draw()
{
  background(r, g, b);

  for (int x = circleWidth; x < width- circleWidth/2; x += (width / (circleWidth)))
  {
    for (int y = circleWidth; y < height- circleWidth/2; y += (height / (circleWidth)))
    {
      if ((x * y) % numforsc_1 == 0 && (x * y) % numforsc_2 == 0)
      {

        sc.xcenter = x;
        sc.ycenter = y;
        if(mousePressed)
        {
          sc.mousepress(); 
        }
        else{
        sc.circleShadow();
        }
        sc.drawCircle(x, y, circleWidth);
      }
      if ((x * y) % numforlc_1 == 0 && (x + y) % numforlc_2 == 0)
      {
        lc.xcenter = x;
        lc.ycenter = y;
        if(mousePressed)
        {
          lc.mousepress(); 
        }
        else{
        lc.circleShadow();
        }
        lc.drawCircle(x, y, circleWidth*2);
      }
    }
  }
}

void mouseDragged()
{
  println("mousepress");
  if(mouseButton == LEFT)
  {
    if(sc.s4 < 120)
    {
      sc.s4 = sc.s4 + 1;
    }
  sc.s1 = (sc.s1+1)%255;
  sc.s2 = (sc.s1 + sc.s2)%255;
  sc.s3 = (sc.s1 + sc.s4)%255;
  }
  else{
    if(sc.s4 > -50)
    {
    sc.s4 = sc.s4 - 1;
  }
  }
}
void mouseClicked()
{
   if(mouseButton == RIGHT)
   {
     println("clicked");
     println(bgcounter);
     r = bg1[bgcounter];
     g = bg2[bgcounter];
     b = bg3[bgcounter];
     if(bgcounter == 4)
     {
       bgcounter = 0;
     }
      bgcounter ++;
   }
}

class SCircle {

  float xcenter;
  float ycenter;
  int c1,c2,c3, c4;
  int s1,s2,s3,s4 = 60;  
  color c_fill = color(125,114,58);
  color shadow = color(s1,s2,s3,s4);

  void drawCircle(float x, float y, float wid)
  {
    stroke(82,74,37);
    fill(c_fill);
    strokeWeight(2);
    circle(x, y, wid);
  }
  void circleShadow()
  {
    float distX = mouseX - xcenter;
    float distY = mouseY - ycenter;
    float angle = atan2(distY, distX);
    float oppositeAngle = angle+PI;
    int linedist = 900;
    stroke(s1,s2,s3,s4);
    float px = xcenter + cos(oppositeAngle) * linedist;
    float py = ycenter + sin(oppositeAngle) * linedist;
    strokeWeight(circleWidth);
    line(xcenter, ycenter, px, py);
  }

  void mousepress()
  {
    float distX = mouseX - xcenter;
    float distY = mouseY - ycenter;
    float angle = atan2(distY, distX);
    float oppositeAngle = angle;
    int linedist = 900;
    
    stroke(s1,s2,s3,s4);
    float px = xcenter + cos(oppositeAngle) * linedist;
    float py = ycenter + sin(oppositeAngle) * linedist;
    strokeWeight(circleWidth);
    line(xcenter, ycenter, px, py);
  }
}
class LCircle {
  float xcenter;
  float ycenter;
  int c1,c2,c3, c4;
  int s1,s2,s3,s4 = 60;  
  color c_fill = color(73,84,54);
  color shadow = color(s1,s2,s3,s4);
  
  void drawCircle(float x, float y, float wid)
  {
    stroke(43,49,32);
    fill(c_fill);
    strokeWeight(2);
    circle(x, y, wid);
  }
  void circleShadow()
  {
    float distX = mouseX - xcenter;
    float distY = mouseY - ycenter;
    float angle = atan2(distY, distX);
    float oppositeAngle = angle + PI;
    int linedist = 900;
    stroke(shadow);
    float px = xcenter + cos(oppositeAngle) * linedist;
    float py = ycenter + sin(oppositeAngle) * linedist;
    strokeWeight(circleWidth*2);
    line(xcenter, ycenter, px, py);
  }

  void mousepress()
  {
    float distX = mouseX - xcenter;
    float distY = mouseY - ycenter;
    float angle = atan2(distY, distX);
    float oppositeAngle = angle;
    int linedist = 900;
    stroke(shadow);
    float px = xcenter + cos(oppositeAngle) * linedist;
    float py = ycenter + sin(oppositeAngle) * linedist;
    strokeWeight(circleWidth*2);
    line(xcenter, ycenter, px, py);
  }
}

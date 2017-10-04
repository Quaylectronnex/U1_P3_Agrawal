
// IMAGES
/*
right side of the screen is width. center is x/2; and y/2;
 Void keyPressed()--------- operation
 {
 background (random(255), random(255), random(255); to change bg color every time a key is pressed  
 }
 mouseX: to change the mouse position
 mouseY: to change the mouse position
 float: can do decimals when int can't.
 return: gives you an answer. Score like stuff.
 if (mouseX> buttonX && mouseX<buttonX. Use && for easy nested if statements.
 */
import processing.sound.*;
SoundFile file;
import processing.video.*;
Movie myMovie;
int scene = 0;
int x = 0;
int y =100;
int x2 = 0;
int y2 = 700;
int x3 = 0;
int y3 = 500;
int x4 = 0;
int y4 = 300;
PImage zeldarrow;
PImage dlarrow;
PImage linkarrow;
PImage garrow;
PImage screen;
PImage ganon;
PImage linky;
PImage zeld;
PImage dlink;
PImage vict;
boolean gameOver = false;
int HEALTH=4;
float[] hp=new float[HEALTH];
float arrowX = 450;
float arrowY = 100;
float arrowX2 = 450;
float arrowY2 = 300;
float arrowX3 = 450;
float arrowY3 = 500;
float arrowX4 = 450;
float arrowY4 = 700;
boolean arrowExists = false;
boolean hasTheMovieStarted = false;

void setup ()
{
  fullScreen(P2D);
  linkarrow = loadImage("Arrow.png");
  screen = loadImage("Splash.PNG");
  linky =  loadImage("Link.png");
  ganon = loadImage("Ganondorf.png"); 
  zeld = loadImage("Zelda.png");
  dlink = loadImage ("Dark Link.png");
  dlarrow = loadImage ("Darrow.png");
  zeldarrow = loadImage ("Zarrow.png");
  garrow = loadImage ("Ganonarrow.png");
  file = new SoundFile(this, "Hyrule.mp3");
  file.play();
  file.amp(0.5);
  myMovie = new Movie(this, "Dragmire.mp4");
  myMovie.play();
  myMovie.speed(0.5);
  myMovie.volume(0);
  for (int i=0; i<HEALTH; i++)
  {
    hp[i]=100;
  }
}



void draw ()
{
  SplashScreen();
  Movie();
}



void Movie()
{
  if (gameOver==true)
  {
    image(vict, 0, 0, width, height);
    if (hasTheMovieStarted == false) {
      hasTheMovieStarted = true;
      myMovie.jump(0.1);
      myMovie.loop();
    }
    image(myMovie, 0, 0, width, height);
    myMovie.frameRate(30);
  }
}

void SplashScreen()
{
  if (scene==0)
  {
    image( screen, 0, 0, width, height);
  }
  if (scene==1)
  {
    PlayGame();
  }
}


void movieEvent(Movie m) 
{
  m.read();
}




void Arrow ()
{
  if (arrowExists == true) {

    arrowX = arrowX + 30;
    arrowY = arrowY + 0;

    if (arrowX>2200)
    {
      arrowX= -1000;
    }
    image(linkarrow, arrowX, arrowY);
  }

  if (millis() % 3000 == 0) {
    arrowExists = true;
  }
}

void Dlarrow ()
{
  if (arrowExists == true) {

    arrowX2 = arrowX2 + 30;
    arrowY2 = arrowY2 + 0;

    if (arrowX2>2200)
    {
      arrowX2= -1000;
    }
    image(dlarrow, arrowX2, arrowY2);
  }
} 


void Zeldarrow ()
{
  if (arrowExists == true) {

    arrowX3 = arrowX3 + 30;
    arrowY3 = arrowY3 + 0;

    if (arrowX3>2200)
    {
      arrowX3= -1000;
    }
    image(zeldarrow, arrowX3, arrowY3);
  }

  if (millis() % 3000 == 0) {
    arrowExists = true;
  }
  {
  }

  if (millis() % 3000 == 0) {
    arrowExists = true;
  }
}

void Garrow ()
{
  if (arrowExists == true) {

    arrowX4 = arrowX4 + 30;
    arrowY4 = arrowY4 + 0;

    if (arrowX4>2200)
    {
      arrowX4= -1000;
    }
    image(garrow, arrowX4, arrowY4);
  }

  if (millis() % 3000 == 0) {
    arrowExists = true;
  }
}

void PlayGame()
{
  background(0);

  if (gameOver == false) {
    Collision();
    Link();
    Ganondorf();
    Zelda();
    DarkLink();
    Arrow();
    Dlarrow();
    Zeldarrow();
    Garrow();
  }

  fill(255, 51, 30);
  rect(x, y, hp[0], 5);

  fill(255, 51, 30);
  rect(x2, y2, hp[1], 5);

  fill(255, 51, 30);
  rect(x3, y3, hp[2], 5);

  fill(255, 51, 30);
  rect(x4, y4, hp[3], 5);
}

void Link()
{
  image(linky, x, y);
  x=x+10;
  if (x>2200)
  {
    x= -1000;
  }
}


void Ganondorf()
{
  image(ganon, x2, y2);
  x2=x2+10;
  if (x2>2200)
  {
    x2= -1000;
  }
}

void Zelda()
{
  image(zeld, x3, y3);
  x3=x3+10;
  if (x3>2200)
  {
    x3= -1000;
  }
}

void DarkLink()
{
  image(dlink, x4, y4);
  x4=x4+10;
  if (x4>2200)
  {
    x4= -1000;
  }
}


void keyPressed()
{

  if (key ==' ')
  {
    scene=1;
  }

  if (key =='w')
  {
    y = y -20;
  }

  if (key =='a')
  {
    x =x-20;
  }

  if (key =='s')
  {
    y = y +20;
  }

  if (key =='d')
  {
    x= x+20;
  }
  if (key =='t')
  {
    y2 = y2 -20;
  }

  if (key =='f')
  {
    x2 =x2-20;
  }

  if (key =='g')
  {
    y2 = y2 +20;
  }

  if (key =='h')
  {
    x2= x2+20;
  }
  if (key =='i')
  {
    y3 = y3 -20;
  }

  if (key =='j')
  {
    x3 =x3-20;
  }

  if (key =='k')
  {
    y3 = y3 +20;
  }

  if (key =='l')
  {
    x3= x3+20;
  }

  if (keyCode == UP)
  {
    y4 = y4 -20;
  }

  if (keyCode == DOWN)
  {

    y4 = y4 +20;
  }


  if (keyCode == LEFT)
  {
    x4 =x4-20;
  }
  if (keyCode == RIGHT)
  {
    x4= x4+20;
  }
}


void Collision()
{
  if (x>2200)
  {
    x= -1000;
  }

  if (dist(x, y, x2, y2)<50)
  {

    hp[0]--;
    hp[1]--;
    if (hp[0]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    if (hp[1]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }

  if (dist(x, y, x3, y3)<50)
  {

    hp[0]--;
    hp[2]--;
    if (hp[0]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    if (hp[2]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }
  if (dist(x2, y2, x4, y4)<50)
  {

    hp[1]--;
    hp[3]--;

    if (hp[1]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }
  if (dist(x2, y2, x3, y3)<50)
  {
    if (hp[3]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    hp[1]--;
    hp[2]--;

    if (hp[1]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }
  if (hp[2]<1)
  {
    vict = loadImage ("victory.jpg");
    gameOver=true;
  }

  if (dist(x3, y3, x4, y4)<50)
  {

    hp[2]--;
    hp[3]--;

    if (hp[2]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }



    if (hp[3]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }
  if (dist(x, y, x4, y4)<50)
  {
    for (int i=0; i<HEALTH; i++)
    {
      hp[0]--;
      hp[3]--;
    }
    if (hp[0]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    if (hp[3]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }
}
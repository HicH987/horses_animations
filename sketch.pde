color[] horseColor = {#751919, #7F7F7F,#171718, #440B84, #356CA5,#A55D35,#A53D35, #ffffff};
// PImage img;
PImage BgTop;
PImage BgBottom;
ArrayList<PImage> animation;
ArrayList<Sprite> horses;

boolean horseOut;
int index=0;

void setup() {
    size(1000,413); 
    frameRate(30);
    BgTop = loadImage("/assets/background/background-top.png");
    BgBottom = loadImage("/assets/background/background-bottom.png");

    animation = new ArrayList<PImage>();
    for (int i=0; i<7; i++)
        animation.add(loadImage("/assets/horse/horse-run-0"+i+".png"));
   
    horses = new ArrayList<Sprite>();
    for (int i = 0; i < 10; i++) 
        horses.add(new Sprite(animation, 20+ i*2, 220, random(0.2, 0.4), horseColor[floor(random(0, horseColor.length))]));

}

void draw() {
    backgroundScroll(BgTop);
    for (Sprite horse: horses) {
        horse.show();
        horse.animate();
    }
    backgroundScroll(BgBottom);
}


void backgroundScroll(PImage img) {
     //NB image is wider than screen
    int x = frameCount % img.width;
    copy(img, x, 0, img.width, height, 0, 0, img.width, height);
    
    int x2 = img.width - x;
    if(x2 < width)
        copy(img, 0, 0, img.width, height, x2, 0, img.width, height);
}


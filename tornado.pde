/*
Making a Tornado/Hurricane with circles of different sizes and sin waves (WIP)
moving forward and disappering
*/

int x = 0;
int x_dis = 0;
int y = 0;
int x2 = 0;
int y2 = 0;

final int QTY_ELLIPSES = 30;
final int INITIAL_H = 150;

int ellipse_h2 = INITIAL_H;

float dislocation=0;

int[] reds = new int[QTY_ELLIPSES];
int[] greens = new int[QTY_ELLIPSES];
int[] blues = new int[QTY_ELLIPSES];


void setup(){
  size(800, 600);
  //noFill();
  //strokeWeight(3);
  randomSeed(0);
  for(int i=0; i<QTY_ELLIPSES; i++){
    reds[i] = int(random(256));
    greens[i] = int(random(256));
    blues[i] = int(random(256));
  }
}

void draw(){
  background(180);
  
  
  for(int i=0; i<QTY_ELLIPSES; i++){
    
    x2 = x_dis;
    y2 = y;
    y = int( (i+1)*(float(height)/QTY_ELLIPSES)); //factor para el numero de elipses
    
    dislocation= random(-width/20, width/20);
    x_dis= int(x + dislocation);
    
    //color change
    stroke(reds[(i+frameCount)%QTY_ELLIPSES]);
    fill(reds[(i+frameCount)%(QTY_ELLIPSES/3)], greens[(i+frameCount)%(QTY_ELLIPSES/3)], blues[(i+frameCount)%(QTY_ELLIPSES/3)]);
    
    int ellipse_h = int( INITIAL_H - (float(INITIAL_H)/QTY_ELLIPSES*i));
    
    ellipse(x_dis, y, height-y,ellipse_h);
    //print("alto elipse" + (i+1) + ": " + ellipse_h + "\n");
    
    /*
    Si las elipses no se tocan, genera más con el mismo alto para acompletar el espacio
    NO TOCARSE es más complejo de lo que suponía, habría que calcular sobre la línea que une los centros...
    :(
    */
    int cuantos_px = (y - ellipse_h/2) - (y2 + ellipse_h2/2);
    if( cuantos_px > 0 ){
      int cuantas = cuantos_px / (INITIAL_H/QTY_ELLIPSES);
      for(int j=1;j<=cuantas;j++){
          ellipse(x2, y2+ellipse_h2*j, height-(y2+j),(INITIAL_H/QTY_ELLIPSES));
          
      }
      print("ok: " + cuantos_px + "\n");
      print("#: " + cuantas + "\n");
    }
    
    
    
    ellipse_h2 = ellipse_h;

    /*Trace lines from ellipses edges*/
    if(i!=0){
      stroke(255,255,0);
      line(x_dis+(height-y)/2, y, x2+(height-y2)/2, y2);
      line(x_dis-(height-y)/2, y, x2-(height-y2)/2, y2);
    }
  }
  
  
  x+= 20;
  x = x%(width+100);
  
  text("w: " + width + " h: " + height + "\n#: " + QTY_ELLIPSES + " O: " + INITIAL_H, width - 100, 20);
  
  delay(1800);
  
//save for gif  
//  saveFrame("f###.gif");
//  if(frameCount == 60)
//    exit();
}


Object[] objectList = new Object[24];

String[] names  = {"kort", "kompas", "vand", "sandwich", "sukker", "dåsemad", "banan", "æble", "ost", "øl"}; //,"solcreme", "kamera", "T-shirt", "bukser", "praply", "vandtætte bukser", "vandtæt overtøj", "pung", "solbriller", "håndklæde", "sokker", "bog", "notesbog", "telt"};//String array med de forskellige tings navne
int   [] weight = {90, 130, 1530, 500, 150, 680, 270, 390, 230, 520}; //, 110, 320, 240, 480, 730, 420, 430, 220, 70, 180, 40, 300, 900, 2000};//Array med de forskellige tings vægt i gram
int   [] value  = {150, 35, 200, 160, 60, 45, 60, 40, 30, 10}; //, 70, 30, 15, 10, 40, 70, 75, 80, 20, 12, 50, 10, 1, 150};//Array med de forskellige tings pris i kroner
float fitness   = 0; 
float veight    = 0;
float backpackSize = 2500; //Taskens plads i gram
int backpackLength = 10;
//ArrayList<Pakninger> Combo = new ArrayList<Pakninger>();

int backpack[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; //object number 0-9, fitness number 10, weight number 11
int numBackpack = 0; // hvor mange rygsække vi starter med
//to do change 3 lines above to arraylist


PrintWriter output;




void setup() {
  size (800, 600);
  output = createWriter("data.txt");

  for (int i=0; i<backpackLength; i++) {
    for (int j = 0; j<names.length; j++) {
      float choose = random(1);
      if (choose > 0.5) {
        backpack[j]= 1;
        veight += weight[j];
        fitness += value[j];
        backpack[backpack.length-2] = (int) fitness;
        backpack[backpack.length-1] = (int) veight;
        if (veight>backpackSize)
          backpack[backpack.length-2] = 0;
      }
    }

    writeBackpack();
    numBackpack++;
    for (int j = 0; j< backpack.length; j++) {
      backpack[j] = 0;
    }
  }
}

void writeBackpack() {
  for (int i=0; i<backpack.length; i++) {
    output.print(backpack[i] + " ");
  }
  output.println();
  output.flush();
  if (numBackpack == 25) {
    output.close();
  }
}
















void draw () {
//  background(100);
//  if (names.length!=weight.length || names.length !=value.length|| names.length != objectList.length)  //Tjekker om der er lige mange af de forskellige tal i names, weight og value arraysne
//  {
//    println("not same amount of names, weight and values");
//    println("names: "+ names.length+"  weight: "+weight.length+"  value: "+value.length);
//    noLoop();
//  }
//  for (int i=0; i<names.length-1; i++) {  //Samler dataen for de forskellige objekter
//    objectList[i] = new Object(names[i], weight[i], value[i]);
//    println("name = "+objectList[i].name+"  weight = "+objectList[i].weight+"  value = "+objectList[i].value);
//    noLoop();
//  }
//  for (int i=0; i<Combo.length; i++) { 
//    for (Combo[i]>backpackSize; ) {
//    } else
//{
//  Combo.remove(Combo.length);
//}
}


/*To do
 Taske max capacitet                                           Tjek
 Forskellige objekters pris og vægt (fra udleveret skema)      Tjek
 klasse der laver de forskellige taske pakninger
 Mulighed for ændring af mængden af tasker
 Kigger på den gamle versionen af tasken og den nye og gemmer den der er bedst
 en graf der visuelt viser hvor meget værdi de forskellige tasker har (søjle diagram) Speciel farve for den der gjorde det best
 
 Mutationer(idk how yet)
 
 */

//------------------------------------------------------------------------------------------------------------------------------------------

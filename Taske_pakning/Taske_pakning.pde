//Forbedret udgave kommer inden den 22. december

String[] names  = {"kort", "kompas", "vand", "sandwich", "sukker", "dåsemad", "banan", "æble", "ost", "øl", "solcreme", "kamera", "T-shirt", "bukser", "praply", "vandtætte bukser", "vandtæt overtøj", "pung", "solbriller", "håndklæde", "sokker", "bog", "notesbog", "telt"};//String array med de forskellige tings navne
int   [] weight = {90, 130, 1530, 500, 150, 680, 270, 390, 230, 520, 110, 320, 240, 480, 730, 420, 430, 220, 70, 180, 40, 300, 900, 2000};//Array med de forskellige tings vægt i gram
int   [] value  = {150, 35, 200, 160, 60, 45, 60, 40, 30, 10, 70, 30, 15, 10, 40, 70, 75, 80, 20, 12, 50, 10, 1, 150};//Array med de forskellige tings pris i kroner
float fitness   = 0; 
float veight    = 0;
float backpackSize = 5000; //Taskens plads i gram
int backpackLength = 10;
int totalFitness = 0;
int [] backpack = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; //object number 0-9, fitness number 10, weight number 11

int numBackpack = 0; // hvor mange rygsække vi starter med


int [][] backpacks = new  int [backpackLength][backpack.length] ;
int [][] backpacks2 = new  int [backpackLength][backpack.length] ;




PrintWriter output;




void setup() {
  size (100, 100);



  if (names.length!=weight.length || names.length !=value.length)  //Tjekker om der er lige mange af de forskellige tal i names, weight og value arraysne
  {
    println("not same amount of names, weight and values");
    println("names: "+ names.length+"  weight: "+weight.length+"  value: "+value.length);
    noLoop();
  }

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
        if (veight>backpackSize) {
          backpack[backpack.length-2] = 0;
        }
      }
      backpacks[i][j]=backpack[j];
    }
    backpacks[i][backpack.length-2] = (int) fitness;
    backpacks[i][backpack.length-1] = (int) veight;

    if (veight>backpackSize) {
      backpacks[i][backpack.length-2] = 0;
    }
    writeBackpack();

    numBackpack++;
    for (int j = 0; j< backpack.length; j++) {
      backpack[j] = 0;
    }
    veight=0;
    fitness=0;
  }
  println("Første generation");

  for (int i=0; i<backpackLength; i++) {
    for (int j = 0; j<names.length+2; j++) {
      print(backpacks[i][j]+" ");
    }   
    println();
  }

  //Linjerne under tjekker hvad det højeste og andet højeste tal er
  int highestFit=0;
  int secHighestFit=0;

  for (int i=0; i<backpackLength; i++) {
    if (backpacks[i][backpack.length-2]>=highestFit) {
      secHighestFit=highestFit;
      highestFit=backpacks[i][backpack.length-2];
    }
  }
  for (int i=0; i<backpackLength; i++) {

    if (backpacks[i][backpack.length-2]==highestFit) {
      for (int j=i+1; j<backpackLength; j++) {
        if (backpacks[j][backpack.length-2]>=secHighestFit) {
          secHighestFit=backpacks[j][backpack.length-2];
        }
      }
    }
  }
  println("Highest fitness = "+highestFit);
  println("Second  highest = "+secHighestFit);

  for (int i=0; i<backpackLength; i++) {
    totalFitness +=backpacks[i][backpack.length-2];
  }
  println("Total Fitness   = " + totalFitness);
  int postmalone =0;
  float fitnesTimes10 = totalFitness / backpackLength;
  int gay=0;
  println("fitness / "+ backpackLength+" = " + fitnesTimes10);

  for (int i = 0; i<backpackLength; i++) {
    postmalone = ceil(backpacks[i][backpack.length-2] / fitnesTimes10);

    for (int r=0; r <postmalone; postmalone--) {
      if (gay < backpackLength) {
        for (int j=0; j <backpack.length; j++) {
          backpacks2[gay][j] = backpacks[i][j];
        }
        gay++;
      }
    }
  }
println("Anden generation");
  for (int i=0; i<backpackLength; i++) {
    for (int j = 0; j<names.length+2; j++) {
      print(backpacks2[i][j]+" ");
    }   
    println();
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
  background(100);
}




/*To do
 Taske max capacitet                                           Tjek
 Forskellige objekters pris og vægt (fra udleveret skema)      Tjek
 klasse der laver de forskellige taske pakninger               Tjek
 Mulighed for ændring af mængden af tasker                     Tjek
 Laver lille djævel fra 2 forældre
 en graf der visuelt viser hvor meget værdi de forskellige tasker har (søjle diagram) Speciel farve for den der gjorde det best
 
 Mutationer(idk how yet)
 
 */

//------------------------------------------------------------------------------------------------------------------------------------------

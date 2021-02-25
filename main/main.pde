import java.util.Collections;
GameTracker mainTracker;
boolean stopKeyRepeat;
int debugTimer = 0;

void setup(){
  size(1280, 720);
  mainTracker = new GameTracker(4);
  mainTracker.startOfTurn();
  for(int i = 0; i < mainTracker.playerList.get(mainTracker.currentPlayer).hand.size(); i++){
    println("Card " + (i+1) + " has value " + mainTracker.playerList.get(mainTracker.currentPlayer).hand.get(i).value + " and color code " + mainTracker.playerList.get(0).hand.get(i).colorID);
  }
}

void draw(){
  clear();
  for(int i = 0; i < mainTracker.playerList.get(mainTracker.currentPlayer).hand.size(); i++){
    text((i+1) + ": " + constructCardName(mainTracker.playerList.get(mainTracker.currentPlayer).hand.get(i)), 50, 50+20*i);
  }
  text("Current card on play pile: " + constructCardName(mainTracker.mainDeck.play.get(mainTracker.mainDeck.play.size() - 1)), 200, 200);
  text("Value of stopKeyRepeat: " + str(stopKeyRepeat), 500, 50);
  text("Value of keyPressed: " + str(keyPressed), 500, 70);
  text("Current gamestate: " + mainTracker.gameState, 500, 90);
  text("Current player: " + (mainTracker.currentPlayer+1), 500, 110);
  for(int i = 0; i < mainTracker.playerList.size(); i++){
    text("Player " + (i+1) + " has " + mainTracker.playerList.get(i).hand.size() + " cards in hand.", 200, 50 + 20*i);
  }
  
  //debug to see all player hands
  for(int playerIndex = 0; playerIndex < 4; playerIndex++){
    text("Player " + (playerIndex+1) + "'s hand:", 500+110*playerIndex, 480);
    for(int i = 0; i < mainTracker.playerList.get(playerIndex).hand.size(); i++){
      text((i+1) + ": " + constructCardName(mainTracker.playerList.get(playerIndex).hand.get(i)), 500+110*playerIndex, 500+20*i);
    }
  }
  
  //println(debugTimer);
  debugTimer++;
  switch(mainTracker.gameState){
    case 1:
      mainTracker.startOfTurn();
      break;
    case 4:
      mainTracker.endOfTurn();
      break;
  }
}

void keyPressed(){
  if(stopKeyRepeat == false){
    stopKeyRepeat = true;
    if(mainTracker.gameState == 2){
      switch(key){
        //just default case for now - keeping this as a switch because the chance of me needing this to do other shit is "yes" even if just for debug
        case 'z':
          mainTracker.playerList.get(mainTracker.currentPlayer).hand.remove(0); //debug for testing win condition
          mainTracker.gameState = 4;
          break;
        default:
          try{
            mainTracker.playCard(mainTracker.currentPlayer, mainTracker.playerList.get(mainTracker.currentPlayer).hand.get(((int)key - 49)));
          } catch(IndexOutOfBoundsException e) {
            break;
          } finally {
            if(mainTracker.gameState == 2){
              mainTracker.gameState = 4;
            }
          }
      }
    }else if(mainTracker.gameState == 3){
      if((int)key - 48 < 5){
        mainTracker.mainDeck.play.get(mainTracker.mainDeck.play.size()-1).colorID = (int)key - 48;
        mainTracker.gameState = 4;
      }
    }
  }
}

void keyReleased(){
  stopKeyRepeat = false;
}

String constructCardName(Card card){
  String text = "";
  switch(card.colorID){
      case 0:
        break;
      case 1:
        text += "Red ";
        break;
      case 2:
        text += "Blue ";
        break;
      case 3:
        text += "Green ";
        break;
      case 4:
        text += "Yellow ";
        break;
    }
    switch(card.value){
      case 1111:
        text += "Plus Two";
        break;
      case 2222:
        text += "Reverse";
        break;
      case 3333:
        text += "Skip";
        break;
      case 4444:
        text += "Wildcard";
        break;
      case 5555:
        text += "Plus Four";
        break;
      default:
        text += card.value;
        break;
    }
    return text;
}

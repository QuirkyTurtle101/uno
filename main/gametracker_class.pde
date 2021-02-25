class GameTracker{
  //data
  ArrayList<Player> playerList;
  CardDeck mainDeck;
  int currentPlayer = 0; //in the hypothetical future where this shit works, here's what we use to track what player is in play at the moment
  boolean hasDrawn = false;
  int gameState;
  //gamestates listed below: (more to be added as needed)
  //0 = start of game, players draw cards
  //1 = checking to see if player can play something
  //2 = player can play something, wait for player to play a card
  //3 = player is picking a wildcard color
  //4 = end of turn, has anyone won the game?
  //5 = game is over, show end screen
  //anything else = something has gone horribly, terribly wrong, abort mission
  
  //constructor
  GameTracker(int playerCount){
    //first we fill the playerList with Player objects - these will be our players
    playerList = new ArrayList<Player>();
    for(int i = 0; i < playerCount; i++){
      playerList.add(new Player(i));
    }
    println("There are " + playerList.size() + " players."); //debug purposes
    
    //then we create the deck and the play pile, bundled together as a CardDeck object, and initialize it
    mainDeck = new CardDeck();
    mainDeck.initializeDeck();
    
    //finally we set the gameState to 0 (starting the game)
    gameState = 0;
  }
  
  //methods
  void startOfTurn(){
    switch(gameState){
      case 0:
        for(int i = 0; i < playerList.size(); i++){
          drawPenalty(playerList.get(i), 7, false);
        }
        for(int i = 0; i < mainDeck.deck.size(); i++){
          println("Top card is color ID " + mainDeck.deck.get(i).colorID);
          if(mainDeck.deck.get(i).colorID != 0){
            mainDeck.play.add(mainDeck.deck.get(i));
            mainDeck.deck.remove(i);
            break;
          }
        }
        gameState = 1;
        //this falls through
      case 1:
        for(int i = 0; i < playerList.get(currentPlayer).hand.size(); i++){
          if(playerList.get(currentPlayer).hand.get(i).value == mainDeck.play.get(mainDeck.play.size()-1).value || playerList.get(currentPlayer).hand.get(i).colorID == mainDeck.play.get(mainDeck.play.size()-1).colorID || playerList.get(currentPlayer).hand.get(i).value >= 4444){
            gameState = 2;
          }
        }
        if(hasDrawn == true){
          gameState = 4;
        }
        if(gameState == 1 && hasDrawn == false){
          drawPenalty(playerList.get(currentPlayer), 1, false);
          hasDrawn = true;
        }
    }
  }
  
  void endOfTurn(){
    if(playerList.get(currentPlayer).hand.size() == 0){
      gameState = 5;
    } else {
      if(currentPlayer == 3){
        currentPlayer = 0;
      } else {
        currentPlayer++;
      }
      hasDrawn = false;
      gameState = 1;
    }
  }
  
  void drawPenalty(Player targetPlayer, int numberOfCards, boolean endOfTurn){
    for(int i = 0; i < numberOfCards; i++){
      targetPlayer.hand.add(mainDeck.drawCard());
    }
    if(endOfTurn == false){
      gameState = 1;
    }
  }
  
  void reverseTurn(){
    
  }
  
  void skipPlayer(){
    
  }
  
  void playCard(int player, Card card){
    if(gameState == 2 && (card.value == mainDeck.play.get(mainDeck.play.size()-1).value || card.colorID == mainDeck.play.get(mainDeck.play.size()-1).colorID || card.value >= 4444)){
      mainDeck.cardPlayed(card);
      playerList.get(player).hand.remove(playerList.get(player).hand.indexOf(card));
      int penalty;
      switch(card.value){ //handles special cards
        case 1111: //+2
          penalty = currentPlayer+1;
          if(penalty > 4){
            penalty = 1;
          }
          drawPenalty(playerList.get(penalty), 2, false);
          break;
        case 2222: //reverse
          //turn order isnt implemented
          break;
        case 3333: //skip
          //tba
          break;
        case 5555: //plus four
          penalty = currentPlayer+1;
          if(penalty > 4){
            penalty = 1;
          }
          drawPenalty(playerList.get(penalty), 4, true);
          //no break - it falls through to wildcard code. this is also why it's out of order. fuck you, i won't change it
        case 4444: //wildcard
          gameState = 3;
          break;
        default:
          break; //i don't know that this is necessary to put here, but am i taking the risk? nah not today
      }
    }
  }
}

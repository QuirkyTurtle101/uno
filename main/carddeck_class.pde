class CardDeck{
  //data
  ArrayList<Card> deck;
  ArrayList<Card> play;
  
  //constructor
  //f
  
  //methods
  void initializeDeck(){
    //NOTE TO SELF: uno deck has 25 of each color and 8 wild cards
    //ids of special cards are:
    //plus two: 1111
    //reverse: 2222
    //skip: 3333
    //wildcard: 4444
    //plus four: 5555
    
    deck = new ArrayList<Card>();
    play = new ArrayList<Card>();
    
    String[] cardData = loadStrings(dataPath("") + "\\cardlist.txt");
    String[] cardValue;
    String[] cardColor; 
    //String[] cardImg;
    
    for(int i = 0; i < cardData.length; i++){
      cardValue = match(cardData[i], "<value>(.*?)</value>");
      cardColor = match(cardData[i], "<color>(.*?)</color>");
      //cardImg = match(cardData[i], "<img>(.*?)</img>");
      deck.add(new Card(cardValue[1], cardColor[1]/*, cardPath[1]*/));
      //println("Card has value " + cardValue[1] + " and color value " + cardColor[1]); //debug
    }
    
    Collections.shuffle(deck);
  }
  
  Card drawCard(){
    Card tempCard = deck.get(0);
    deck.remove(tempCard);
    return(tempCard);
  }
  
  void cardPlayed(Card playedCard){
    play.add(playedCard);
  }
}

class TicTacToe() {  def informState(board: TttBoard) = println("test")};class TttBoard() {  var state = ("","","","","","","","","");    def this(inState: (String,String,String,String,String,String,String,String,String))  {    this;    state = inState  }};val game = new TicTacToe();val board = new TttBoard();
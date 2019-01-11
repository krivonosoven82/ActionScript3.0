package{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import gameClasses.Button;
	
	
	[SWF(width="500", height="600", frameRate="65")]
	
	public class Tetromino extends Sprite{
		private var back:Shape = new Shape();
		//create field
		private const ROWS_FIELD:uint = 20;
		private const COLUMN_FIELD:uint = 10;
		private const TILE_SIZE:uint = 24;
		private var fieldArray:Array;
		private var fieldSprite:Sprite;
		//tetromino
		private var tetrominoes:Array = new Array();
		private var colors:Array=new Array();
		//for generate random tetromino
		private var tetromino:Sprite;
		private var currentTetromino:uint;
		private var currentRotation:uint;
		private var tRow:int;
		private var tCol:int;
		//for tetrominoes fall
		private var timeCount:Timer = new Timer(500);
		//game over
		private var gameOver:Boolean = false;
		//next tetromino
		private var nextTetromino:uint;
		//button start
		private var startBtn:Button = new Button();
		private var textBtnStart:TextField = new TextField();
		private var format:TextFormat = new TextFormat();
		//text game over
		private var textGameOver:TextField = new TextField(); 
		private var formatGameOver:TextFormat = new TextFormat();
		
		private var btnLeft:Button = new Button();
		private var btnRotate:Button = new Button();
		private var btnRight:Button = new Button();
		private var btnDown:Button = new Button();
		private var textLeft:TextField = new TextField(); 
		private var textRotate:TextField = new TextField(); 
		private var textRight:TextField = new TextField(); 
		private var textDown:TextField = new TextField(); 
		private var formatBtn:TextFormat = new TextFormat();
		//score
		private var score:int = 0;
		private var textScore:TextField = new TextField(); 
		private var formatScore:TextFormat = new TextFormat();
		
		public function Tetromino(){
			stage.scaleMode = StageScaleMode.NO_SCALE;   //нет 
			stage.align = StageAlign.TOP_LEFT;   		//расположение в верхнем левом улгу
			
			addChild(back);
			back.graphics.beginFill(0x199ebd);
			back.graphics.drawRect(0, 0, 600, 600);
			back.graphics.endFill();
			
			//add game field
			generateField();
			
			//add score
			addChild(textScore);
			textScore.x = 310;
			textScore.y = 150;
			textScore.text = "Score: " + String(score);
			formatScore.size = 20;
			textScore.setTextFormat(formatScore);
			
			//add button start
			addChild(startBtn);
			startBtn.drawButton(0x00ff00, 40);
			startBtn.x = 350;
			startBtn.y = 440;
			textBtnStart.text = "Start";
			textBtnStart.x = -20;
			textBtnStart.y = -12;
			format.size = 20;
			startBtn.addChild(textBtnStart);
			textBtnStart.setTextFormat(format);	
			startBtn.addEventListener(MouseEvent.CLICK, gameStart);
			
			addChild(btnLeft);
			btnLeft.name = "btnLeft";
			btnLeft.drawButton(0x0000ff, 20);
			btnLeft.x = 300;
			btnLeft.y = 300;
			btnLeft.addChild(textLeft);
			textLeft.text = "L";
			textLeft.x = -8;
			textLeft.y = -12;
			formatBtn.size = 20;
			formatBtn.color = 0xffffff;
			textLeft.setTextFormat(formatBtn);	
			
			addChild(btnRotate);
			btnRotate.name = "btnRotate";
			btnRotate.drawButton(0x0000ff, 20);
			btnRotate.x = 350;
			btnRotate.y = 250;
			btnRotate.addChild(textRotate);
			textRotate.text = "U";
			textRotate.x = -8;
			textRotate.y = -12;
			formatBtn.size = 20;
			formatBtn.color = 0xffffff;
			textRotate.setTextFormat(formatBtn);
			
			addChild(btnRight);
			btnRight.name = "btnRight";
			btnRight.drawButton(0x0000ff, 20);
			btnRight.x = 400;
			btnRight.y = 300;
			btnRight.addChild(textRight);
			textRight.text = "R";
			textRight.x = -8;
			textRight.y = -12;
			formatBtn.size = 20;
			formatBtn.color = 0xffffff;
			textRight.setTextFormat(formatBtn);
			
			addChild(btnDown);
			btnDown.name = "btnDown";
			btnDown.drawButton(0x0000ff, 20);
			btnDown.x = 350;
			btnDown.y = 350;
			btnDown.addChild(textDown);
			textDown.text = "D";
			textDown.x = -8;
			textDown.y = -12;
			formatBtn.size = 20;
			formatBtn.color = 0xffffff;
			textDown.setTextFormat(formatBtn);
			
			btnLeft.addEventListener(MouseEvent.MOUSE_DOWN, toLeft);
			btnRotate.addEventListener(MouseEvent.MOUSE_DOWN, toRotate);
			btnRight.addEventListener(MouseEvent.MOUSE_DOWN, toRight);
			btnDown.addEventListener(MouseEvent.MOUSE_DOWN, toDown);
			
		}
		
		
		private function gameStart(e:MouseEvent):void{
			startBtn.removeEventListener(MouseEvent.CLICK, gameStart);
			

			createTetrominoes();
			nextTetromino=Math.floor(Math.random()*7);
			generateRandomTetromino();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKDown);
		}
		
		
		private function generateField():void{
			fieldArray=new Array  ;
			fieldSprite=new Sprite  ;
			addChild(fieldSprite);
			fieldSprite.graphics.lineStyle(0x000000);
			for (var i:uint=0; i<20; i++) {
				fieldArray[i]=new Array  ;
				for (var j:uint=0; j<10; j++) {
					fieldArray[i][j]=0;
					fieldSprite.graphics.beginFill(0xc0c0c0);
					fieldSprite.graphics.drawRect(TILE_SIZE*j, TILE_SIZE*i, TILE_SIZE, TILE_SIZE);
					fieldSprite.graphics.endFill();
				}
			}
		}
		
		// Функция инициализирует связанные с Tetromino массивы.
		private function createTetrominoes():void{
			// I
			tetrominoes[0]=[[[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0]],
							[[0,1,0,0],[0,1,0,0],[0,1,0,0],[0,1,0,0]]];
			colors[0]=0x00FFFF;
			// T
			tetrominoes[1]=[[[0,0,0,0],[1,1,1,0],[0,1,0,0],[0,0,0,0]],
							[[0,1,0,0],[1,1,0,0],[0,1,0,0],[0,0,0,0]],
							[[0,1,0,0],[1,1,1,0],[0,0,0,0],[0,0,0,0]],
							[[0,1,0,0],[0,1,1,0],[0,1,0,0],[0,0,0,0]]];
			colors[1]=0x767676;
			// L
			tetrominoes[2]=[[[0,0,0,0],[1,1,1,0],[1,0,0,0],[0,0,0,0]],
							[[1,1,0,0],[0,1,0,0],[0,1,0,0],[0,0,0,0]],
							[[0,0,1,0],[1,1,1,0],[0,0,0,0],[0,0,0,0]],
							[[0,1,0,0],[0,1,0,0],[0,1,1,0],[0,0,0,0]]];
			colors[2]=0xFFA500;
			// J
			tetrominoes[3]=[[[1,0,0,0],[1,1,1,0],[0,0,0,0],[0,0,0,0]],
							[[0,1,1,0],[0,1,0,0],[0,1,0,0],[0,0,0,0]],
							[[0,0,0,0],[1,1,1,0],[0,0,1,0],[0,0,0,0]],
							[[0,1,0,0],[0,1,0,0],[1,1,0,0],[0,0,0,0]]];
			colors[3]=0x0000FF;
			// Z
			tetrominoes[4]=[[[0,0,0,0],[1,1,0,0],[0,1,1,0],[0,0,0,0]],
							[[0,0,1,0],[0,1,1,0],[0,1,0,0],[0,0,0,0]]];
			colors[4]=0xFF0000;
			// S
			tetrominoes[5]=[[[0,0,0,0],[0,1,1,0],[1,1,0,0],[0,0,0,0]],
							[[0,1,0,0],[0,1,1,0],[0,0,1,0],[0,0,0,0]]];
			colors[5]=0x00FF00;
			// O
			tetrominoes[6]=[[[0,1,1,0],[0,1,1,0],[0,0,0,0],[0,0,0,0]]];
			colors[6]=0xFFFF00;
		}
		
		// Функция сгенерирует случайное тетромино для размещения на игровом поле
		private function generateRandomTetromino():void {
			if (!gameOver) {
				currentTetromino = nextTetromino;
				nextTetromino=Math.floor(Math.random()*7);
				drawNext();
				currentRotation=0;
				tRow=0;
				if (tetrominoes[currentTetromino][0][0].indexOf(1)==-1) {
					tRow=-1;
				}
				tCol=3;
				drawTetromino();
				if (canFit(tRow,tCol,currentRotation)) {
					timeCount.addEventListener(TimerEvent.TIMER,onTime);
					timeCount.start();
				} else {
					endGame();
//					startBtn.addEventListener(MouseEvent.CLICK, gameStart);
				}
			}
		}
		
		// функция отображает Tetromino на экране
		private function drawTetromino():void {
			var ct:uint=currentTetromino;
			tetromino=new Sprite  ;
			addChild(tetromino);
			tetromino.graphics.lineStyle(0,0x000000);
			for (var i:int=0; i<tetrominoes[ct][currentRotation].length; i++) {
				for (var j:int=0; j<tetrominoes[ct][currentRotation][i].length; j++) {
					if (tetrominoes[ct][currentRotation][i][j]==1) {
						tetromino.graphics.beginFill(colors[ct]);
						tetromino.graphics.drawRect(TILE_SIZE*j, TILE_SIZE*i, TILE_SIZE, TILE_SIZE);
						tetromino.graphics.endFill();
					}
				}
			}
			placeTetromino();
		}
		
		// функция помещает Tetromino в правильном месте в соответствии с tCol и tRowзначения
		private function placeTetromino():void {
			tetromino.x=tCol*TILE_SIZE;
			tetromino.y=tRow*TILE_SIZE;
		}
		
		// Функция будет обрабатывать нажатые клавиш
		private function onKDown(e:KeyboardEvent):void {
			if(!gameOver){
				switch (e.keyCode) {
					case 37 :
						moveLeft();
						break;
					case 38 :
						moveRotate();
						break;
					case 39 :
					moveRight();
						break;
					case 40 :
						moveDown();
						break;
				
				}
			}
		}
		private function toLeft(e:MouseEvent):void{
			moveLeft();
		}
		private function toRotate(e:MouseEvent):void{
			moveRotate();
		}
		private function toRight(e:MouseEvent):void{
			moveRight();
		}
		private function toDown(e:MouseEvent):void{
			moveDown();
		}
		
		private function moveLeft():void{
			if (canFit(tRow,tCol-1, currentRotation)) {
				tCol--;
				placeTetromino();
			}
		}
		private function moveRotate():void{
			// переменная примет значение ротации кандидата
			var rot:uint = (currentRotation+1)%tetrominoes[currentTetromino].length;
			if (canFit(tRow,tCol,rot)) {
				currentRotation = rot;
				removeChild(tetromino);
				drawTetromino();
				placeTetromino();
			}
		}
		private function moveRight():void{
			if (canFit(tRow,tCol+1, currentRotation)) {
				tCol++;
				placeTetromino();
			}
		}
		private function moveDown():void{
			if (canFit(tRow+1,tCol, currentRotation)) {
				tRow++;
				placeTetromino();
			} else {
				landTetromino();
				generateRandomTetromino();
			}
		}
		
		// Функция возвращает, true если текущее Tetromino соответствует этим координатам или false если не подходит
		private function canFit(row:int,col:int, side:uint):Boolean {
			var ct:uint=currentTetromino;
			for (var i:int=0; i<tetrominoes[ct][side].length; i++) {
				for (var j:int=0; j<tetrominoes[ct][side][i].length; j++) {
					if (tetrominoes[ct][side][i][j]==1) {
						// выход за границу поля влево
						if (col+j<0) {
							return false;
						}
						// выход за границу поля вправо
						if (col+j>9) {
							return false;
						}
						// приземление
						if (row+i>19) {
							return false;
						}
						// проверка столкновение Tetromino
						if (fieldArray[row+i][col+j]==1) {
							return false;
						}
					}
				}
			}
			return true;
		}
		
		// функция для управления посадкой Tetromino
		private function landTetromino():void {
			var ct:uint=currentTetromino;
			var landed:Sprite;
			for (var i:int=0; i<tetrominoes[ct][currentRotation].length; i++) {
				for (var j:int=0; j<tetrominoes[ct][currentRotation][i].length; j++) {
					if (tetrominoes[ct][currentRotation][i][j]==1) {
						landed=new Sprite;
						addChild(landed);
						landed.graphics.lineStyle(0,0x000000);
						landed.graphics.beginFill(colors[currentTetromino]);
						landed.graphics.drawRect(TILE_SIZE*(tCol+j), TILE_SIZE*(tRow+i), TILE_SIZE, TILE_SIZE);
						landed.graphics.endFill();
						landed.name = "r" + (tRow+i) + "c" + (tCol+j);
						fieldArray[tRow+i][tCol+j]=1;
					}
				}	
			}
			removeChild(tetromino);
			timeCount.removeEventListener(TimerEvent.TIMER,onTime);
			timeCount.stop();
			checkForLines();
		}
		
		// функцию, которая проверит завершенные строки.
		private function checkForLines():void {
			for (var i:int=0; i < ROWS_FIELD; i++) {
				if (fieldArray[i].indexOf(0)==-1) {
					for (var j:int=0; j < COLUMN_FIELD; j++) {
						fieldArray[i][j]=0;
						removeChild(getChildByName("r"+i+"c"+j));
					}
					for (j=i; j>=0; j--) {
						for (var k:int=0; k<10; k++) {
							if (fieldArray[j][k]==1) {
								fieldArray[j][k]=0;
								fieldArray[j+1][k]=1;
								getChildByName("r"+j+"c"+k).y+=TILE_SIZE;
								getChildByName("r"+j+"c"+k).name="r"+(j+1)+"c"+k;
							}
						}
					}
					score += 10;
					textScore.text = "Score: " + String(score);
					formatScore.size = 20;
					textScore.setTextFormat(formatScore);
				}
			}
		}
		
		
		//
		private function onTime(e:TimerEvent):void {
			if (canFit(tRow+1,tCol,currentRotation)) {
				tRow++;
				placeTetromino();
			} else {
				landTetromino();
				generateRandomTetromino();
			}
		}
	
		// функция рисует следующую фигуру
		private function drawNext():void {
			if (getChildByName("next")!=null) {
				removeChild(getChildByName("next"));
			}
			var next_t:Sprite=new Sprite  ;
			next_t.x=300;
			next_t.name="next";
			addChild(next_t);
			next_t.graphics.lineStyle(0,0x000000);
			for (var i:int=0; i<tetrominoes[nextTetromino][0].length; i++) {
				for (var j:int=0; j<tetrominoes[nextTetromino][0][i].length; j++) {
					if (tetrominoes[nextTetromino][0][i][j]==1) {
						next_t.graphics.beginFill(colors[nextTetromino]);
						next_t.graphics.drawRect(TILE_SIZE*j, TILE_SIZE*i, TILE_SIZE, TILE_SIZE);
						next_t.graphics.endFill();
					}
				}
			}
		}
		
		// game over
		private function endGame():void{
			gameOver = true;
			addChild(textGameOver);
			textGameOver.text = "Game Over";
			textGameOver.x = 300;
			textGameOver.y = 200;
			textGameOver.width = 200;
			formatGameOver.color = 0xff0000;
			formatGameOver.size = 24;
			textGameOver.setTextFormat(formatGameOver);
		}
		
	}
}
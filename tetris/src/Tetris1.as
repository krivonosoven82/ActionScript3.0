package{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import game.GameButton;
	[SWF(width="480", height="480", frameRate="65")]
	
	public class Tetris1 extends Sprite{
		[Embed(source="img/background.jpg")] private const BackgroundGame: Class;
		[Embed(source="img/start.png")] private const StartImg: Class;
		[Embed(source="img/pauseToPlay.png")] private const PauseImg: Class;
		[Embed(source="img/left.png")] private const LeftImg: Class;
		[Embed(source="img/up.png")] private const UpImg: Class;
		[Embed(source="img/right.png")] private const RightImg: Class;
		[Embed(source="img/down.png")] private const DownImg: Class;
		
		public var baseWidth:Number = 480;
		public var baseHeight:Number = 480;
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
		private var startBtn:GameButton = new GameButton();
		private var startBM:Bitmap;
		//button pause
		private var pauseBtn:GameButton = new GameButton();
		private var pauseBM:Bitmap;
		private var statusPause:Boolean = true;
		//text game over
		private var textGame:TextField = new TextField(); 
		private var formatGame:TextFormat = new TextFormat();
		
		private var btnLeft:GameButton = new GameButton();
		private var btnUp:GameButton = new GameButton();
		private var btnRight:GameButton = new GameButton();
		private var btnDown:GameButton = new GameButton();
		private var LeftBM:Bitmap; 
		private var UpBM:Bitmap; 
		private var RightBM:Bitmap; 
		private var DownBM:Bitmap;
		//score
		private var score:int;
		private var textScore:TextField = new TextField(); 
		private var formatScore:TextFormat = new TextFormat();
		//background
		private var back: Bitmap;
		
		public function Tetris1(){
			stage.scaleMode = StageScaleMode.NO_SCALE;   //нет 
			stage.align = StageAlign.TOP_LEFT;   		//расположение в верхнем левом улгу
			this.stage.addEventListener(Event.RESIZE, onResize);
			//addChild(back);
			generateBackground()
			//add game field
			generateField();
			//add score
			addChild(textScore);
			textScore.x = 310;
			textScore.y = 100;
			showScore(0);
		
			showStatusGame("Start game", 0x00ff00);
     		//кнопка старт
			addChild(startBtn);
			addCircleButton(startBtn, 0x00ff00, 38, 350, 320, startBM, -40, -38, StartImg)
			//управление
			addChild(btnLeft);
			addCircleButton(btnLeft, 0x0000ff, 18, 275, 325, LeftBM, -20, -20, LeftImg);
			addChild(btnUp);
			addCircleButton(btnUp, 0x0000ff, 18, 350, 250, UpBM, -20, -20, UpImg);
			addChild(btnRight);
			addCircleButton(btnRight, 0x0000ff, 18, 425, 325, RightBM, -20, -20, RightImg);
			addChild(btnDown);
			addCircleButton(btnDown, 0x0000ff, 18, 350, 395, DownBM, -20, -20, DownImg);
			
			btnLeft.addEventListener(MouseEvent.MOUSE_DOWN, toLeft);
			btnUp.addEventListener(MouseEvent.MOUSE_DOWN, toRotate);
			btnRight.addEventListener(MouseEvent.MOUSE_DOWN, toRight);
			btnDown.addEventListener(MouseEvent.MOUSE_DOWN, toDown);
			
			// запуск игры
			onPlayGame();	
		}
		
		private function onPlayGame():void{
			if(statusPause){
				startBtn.addEventListener(MouseEvent.CLICK, gameStart);
			}
		}

		private function gameStart(e:MouseEvent):void{
			statusPause = !statusPause;
			if(gameOver) gameOver = false;
			showStatusGame("Game runs", 0x0000ff);
			// отображение счета
			showScore(0);
			//удаление кнопки старт
			removeChild(startBtn);
			//кнопка пауза
			addChild(pauseBtn);
			addCircleButton(pauseBtn, 0x00ff00, 38, 350, 320, pauseBM, -40, -38, PauseImg);
			pauseBtn.addEventListener(MouseEvent.CLICK, onPause);
			
			createTetrominoes();
			nextTetromino=Math.floor(Math.random()*7);
			generateRandomTetromino();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKDown);	
		}
		
		private function onPause(e:MouseEvent):void{
			statusPause = !statusPause;
			if(statusPause){
				timeCount.stop();
				showStatusGame("Pause game", 0xffff00);
			}else{
				timeCount.start();
				showStatusGame("Game Runs", 0xffff00);
			}
		}
		//функция центрирования
		public function onResize(event:Event):void{
			var realWidth:Number = stage.stageWidth;
			var realHeight:Number = stage.stageHeight;
			var sx:Number = realWidth / baseWidth;
			var sy:Number = realHeight / baseHeight;
			       //горизонтальная ориентация
			if(baseWidth / baseHeight >= realWidth / realHeight){
			    this.scaleX = this.scaleY = sx;
				back.width = realWidth;
				back.height = realHeight;
				this.x = Math.floor((realWidth - baseWidth * sx) / 2);
				this.y = Math.floor((realHeight - baseHeight * sx) / 2);
			}else{ //вертикальная ориентация
				this.scaleX = this.scaleY = sy;
				back.width = realWidth;
				back.height = realHeight;
				this.x = Math.floor((realWidth - baseWidth * sy) / 2);
				this.y = Math.floor((realHeight - baseHeight * sy) / 2);
			}
		}
		
		public function generateBackground():void{
			back = new BackgroundGame() as Bitmap;
			back.width = stage.stageWidth;
			back.height = stage.stageHeight;
			stage.addChildAt(back,0);
		}
		
		
		private function generateField():void{
			fieldArray=new Array();
			fieldSprite=new Sprite();
			addChild(fieldSprite);
			fieldSprite.graphics.lineStyle(0x000000);
			for(var i:uint=0; i < ROWS_FIELD; i++){
				fieldArray[i]=new Array();
				for(var j:uint=0; j < COLUMN_FIELD; j++){
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
		private function generateRandomTetromino():void{
			if(!gameOver){
				currentTetromino = nextTetromino;
				nextTetromino=Math.floor(Math.random()*7);
				drawNext();
				currentRotation=0;
				tRow=0;
				if(tetrominoes[currentTetromino][0][0].indexOf(1)==-1){
					tRow=-1;
				}
				tCol=3;
				drawTetromino();
				if(canFit(tRow,tCol,currentRotation)){
					timeCount.addEventListener(TimerEvent.TIMER,onTime);
					timeCount.start();
				}else{
					endGame();
				}
			}
		}
		
		// функция отображает Tetromino на экране
		private function drawTetromino():void{
			tetromino=new Sprite();
			addChild(tetromino);
			tetromino.graphics.lineStyle(0,0x000000);
			for(var i:int=0; i<tetrominoes[currentTetromino][currentRotation].length; i++){
				for(var j:int=0; j<tetrominoes[currentTetromino][currentRotation][i].length; j++){
					if(tetrominoes[currentTetromino][currentRotation][i][j]==1){
						tetromino.graphics.beginFill(colors[currentTetromino]);
						tetromino.graphics.drawRect(TILE_SIZE*j, TILE_SIZE*i, TILE_SIZE, TILE_SIZE);
						tetromino.graphics.endFill();
					}
				}
			}
			placeTetromino();
		}
		
		// функция помещает Tetromino в правильном месте в соответствии с tCol и tRowзначения
		private function placeTetromino():void{
			tetromino.x=tCol*TILE_SIZE;
			tetromino.y=tRow*TILE_SIZE;
		}
		
		// Функция будет обрабатывать нажатые клавиш
		private function onKDown(e:KeyboardEvent):void{
			if(!gameOver){
				switch(e.keyCode){
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
		//управление кнопками (мышью)
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
			if(canFit(tRow,tCol-1, currentRotation)){
				tCol--;
				placeTetromino();
			}
		}
		private function moveRotate():void{
			// переменная примет значение ротации кандидата
			var rot:uint = (currentRotation+1)%tetrominoes[currentTetromino].length;
			if(canFit(tRow,tCol,rot)) {
				currentRotation = rot;
				removeChild(tetromino);
				drawTetromino();
				placeTetromino();
			}
		}
		private function moveRight():void{
			if(canFit(tRow,tCol+1, currentRotation)){
				tCol++;
				placeTetromino();
			}
		}
		private function moveDown():void{
			if(canFit(tRow+1,tCol, currentRotation)){
				tRow++;
				placeTetromino();
			}else{
				landTetromino();
				generateRandomTetromino();
			}
		}
		
		// Функция возвращает, true если текущее Tetromino соответствует этим координатам или false если не подходит
		private function canFit(row:int,col:int, side:uint):Boolean{
			var ct:uint=currentTetromino;
			for(var i:int=0; i<tetrominoes[ct][side].length; i++){
				for(var j:int=0; j<tetrominoes[ct][side][i].length; j++){
					if(tetrominoes[ct][side][i][j]==1){
						// выход за границу поля влево
						if(col+j<0){
							return false;
						}
						// выход за границу поля вправо
						if(col+j>9){
							return false;
						}
						// приземление
						if(row+i>19){
							return false;
						}
						// сверху
						if(row+i<0){
							return false;
						}
						// проверка столкновение Tetromino
						if(fieldArray[row+i][col+j]==1){
							return false;
						}
					}
				}
			}
			return true;
		}
		
		// функция для управления посадкой Tetromino
		private function landTetromino():void{
			var ct:uint=currentTetromino;
			var landed:Sprite;
			for(var i:int=0; i<tetrominoes[ct][currentRotation].length; i++){
				for(var j:int=0; j<tetrominoes[ct][currentRotation][i].length; j++){
					if(tetrominoes[ct][currentRotation][i][j]==1){
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
		private function checkForLines():void{
			for(var i:int=0; i < ROWS_FIELD; i++){
				if(fieldArray[i].indexOf(0)==-1){
					for(var j:int=0; j < COLUMN_FIELD; j++){
						fieldArray[i][j]=0;
						removeChild(getChildByName("r"+i+"c"+j));
					}
					for(j=i; j>=0; j--){
						for(var k:int=0; k<10; k++){
							if(fieldArray[j][k]==1){
								fieldArray[j][k]=0;
								fieldArray[j+1][k]=1;
								getChildByName("r"+j+"c"+k).y+=TILE_SIZE;
								getChildByName("r"+j+"c"+k).name="r"+(j+1)+"c"+k;
							}
						}
					}
					// отображение счета
					showScore(10);
				}
			}
		}
		
		private function onTime(e:TimerEvent):void{
			if(canFit(tRow+1,tCol,currentRotation)){
				tRow++;
				placeTetromino();
			}else{
				landTetromino();
				generateRandomTetromino();
			}
		}
		
		// функция рисует следующую фигуру
		private function drawNext():void{
			if(getChildByName("next")!=null){
				removeChild(getChildByName("next"));
			}
			var next_t:Sprite=new Sprite  ;
			next_t.x=305;
			next_t.name="next";
			addChild(next_t);
			next_t.graphics.lineStyle(0,0x000000);
			for(var i:int=0; i<tetrominoes[nextTetromino][0].length; i++){
				for(var j:int=0; j<tetrominoes[nextTetromino][0][i].length; j++){
					if(tetrominoes[nextTetromino][0][i][j]==1){
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
			//отображаем статус игры
			showStatusGame("Game over", 0xff0000);
			if(gameOver){
				trace("gameOver: " + gameOver);
				generateField();
				removeChild(pauseBtn);
				addChild(startBtn);		
			}
		}
		
		private function showStatusGame(text:String, color:uint):void{
			addChild(textGame);
			textGame.text = text;
			textGame.x = 300;
			textGame.y = 150;
			textGame.width = 200;
			formatGame.color = color;
			formatGame.size = 24;
			textGame.setTextFormat(formatGame);
		}
		
		private function showScore(valueScore:int):void{
			score = valueScore;
			textScore.text = "Score: " + String(score);
			formatScore.size = 20;
			textScore.setTextFormat(formatScore);
		}
		
		private function addCircleButton(btnObj:Object, color:uint, radius:Number, btnPosX:Number, btnPosY:Number, bitObj:Object, bitPosX:Number, bitPosY:Number, imgObj:Object):void{
			btnObj.drawButton(color, radius);
			btnObj.x = btnPosX;
			btnObj.y = btnPosY;
			bitObj = new imgObj() as Bitmap;
			bitObj.x = bitPosX;
			bitObj.y = bitPosY;
			btnObj.addChild(bitObj);	
		}
			
		
	}
}
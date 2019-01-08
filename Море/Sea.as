package{
	//картинки нужно поместить в папку bin-debug
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	[SWF(width="800", height="450")]

	public class Sea extends Sprite{
		private const BLUE_WIDTH:uint = 67;
		private const RED_WIDTH:uint = 70;
		private const PINK_WIDTH:uint = 70;
		private const SILVER_WIDTH:uint = 80;
		private const YELLOW_WIDTH:uint = 77;
		//sea
		private var urlSea:URLRequest = new URLRequest("sea.png");
		private var loaderSea:Loader = new Loader();
		//blue
		private var urlBlueLeft:URLRequest = new URLRequest("blue_left.png");
		private var loaderBlueLeft:Loader = new Loader();
		private var urlBlueRight:URLRequest = new URLRequest("blue_right.png");
		private var loaderBlueRight:Loader = new Loader();
		//pink
		private var urlPinkLeft:URLRequest = new URLRequest("pink_left.png");
		private var loaderPinkLeft:Loader = new Loader();
		private var urlPinkRight:URLRequest = new URLRequest("pink_right.png");
		private var loaderPinkRight:Loader = new Loader();
		//red
		private var urlRedLeft:URLRequest = new URLRequest("red_left.png");
		private var loaderRedLeft:Loader = new Loader();
		private var urlRedRight:URLRequest = new URLRequest("red_right.png");
		private var loaderRedRight:Loader = new Loader();
		//silver
		private var urlSilverLeft:URLRequest = new URLRequest("silver_left.png");
		private var loaderSilverLeft:Loader = new Loader();
		private var urlSilverRight:URLRequest = new URLRequest("silver_right.png");
		private var loaderSilverRight:Loader = new Loader();
		//yellow
		private var urlYellowLeft:URLRequest = new URLRequest("yellow_left.png");
		private var loaderYellowLeft:Loader = new Loader();
		private var urlYellowRight:URLRequest = new URLRequest("yellow_right.png");
		private var loaderYellowRight:Loader = new Loader();
		
		public function Sea(){
			loaderSea.load(urlSea);
			addChild(loaderSea);
			//add blue left
			loaderBlueLeft.load(urlBlueLeft);
			addChild(loaderBlueLeft);
			loaderBlueLeft.x = stage.stageWidth + BLUE_WIDTH;
			loaderBlueLeft.y = 200;
			//add pink right
			loaderPinkRight.load(urlPinkRight);
			addChild(loaderPinkRight);
			loaderPinkRight.x = 0;
			loaderPinkRight.y = 100;
			//add red left
			loaderRedLeft.load(urlRedLeft);
			addChild(loaderRedLeft);
			loaderRedLeft.x = stage.stageWidth - RED_WIDTH;
			loaderRedLeft.y = 350;
			//add silver right
			loaderSilverRight.load(urlSilverRight);
			addChild(loaderSilverRight);
			loaderSilverRight.x = -SILVER_WIDTH;
			loaderSilverRight.y = 275;
			//add yellow left
			loaderYellowLeft.load(urlYellowLeft);
			addChild(loaderYellowLeft);
			loaderYellowLeft.x = stage.stageWidth - SILVER_WIDTH;
			loaderYellowLeft.y = 50;
			
			init();
		}
		
		private function init():void{
			stage.addEventListener(Event.ENTER_FRAME, moveFish);
		}
		private function moveFish(e:Event):void{
			moveBlueLeft();
			movePinkRight();
			moveRedLeft();
			moveSilverRight();
			moveYellowLeft();
		}
		private function moveBlueLeft():void{
			if(loaderBlueLeft.x <= -BLUE_WIDTH){
				loaderBlueLeft.x = stage.stageWidth + BLUE_WIDTH;
			}
			loaderBlueLeft.x -= .5;
			
		}
		private function movePinkRight():void{
			if(loaderPinkRight.x >= stage.stageWidth + PINK_WIDTH){
				loaderPinkRight.x = -PINK_WIDTH;
			}
			loaderPinkRight.x++;
			
		}
		private function moveRedLeft():void{
			if(loaderRedLeft.x <= -RED_WIDTH){
				loaderRedLeft.x = stage.stageWidth + RED_WIDTH;
			}
			loaderRedLeft.x -= .75;
			
		}
		private function moveSilverRight():void{
			if(loaderSilverRight.x >= stage.stageWidth + SILVER_WIDTH){
				loaderSilverRight.x = -SILVER_WIDTH;
			}
			loaderSilverRight.x += 2;
			
		}
		private function moveYellowLeft():void{
			if(loaderYellowLeft.x <= -YELLOW_WIDTH){
				loaderYellowLeft.x = stage.stageWidth + YELLOW_WIDTH;
			}
			loaderYellowLeft.x--;
			
		}
	}
}
package{
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.geom.ColorTransform;
	
	// для тестинга примера нужно нажать(зажать) клавишу tab
	
	
	public class ExampleFocus extends Sprite{	
		private var rows:uint = 10;
		private var cols:uint = 10;
		private var rowSpacing:uint = 25;
		private var colSpacing:uint = 25;
		private var i:uint;
		private var j:uint;
		
		public function ExampleFocus(){
			for(i = 0; i < rows; i++){
				for(j = 0; j < cols; j++){
					createSquare(j * colSpacing, i*rowSpacing, (i*cols) + j);
				}
			}
		}
		
		private function createSquare(startX:Number, startY:Number, tabNumber:uint):void{
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0x000000); 
			square.graphics.drawRect(0, 0, colSpacing, rowSpacing); 
			square.graphics.endFill(); 
			square.x = startX;
			square.y = startY;
			square.tabEnabled = true;
			square.tabIndex = tabNumber;
			square.addEventListener(FocusEvent.FOCUS_IN, changeColor);
			addChild(square);
		}
		
		private function changeColor(event:FocusEvent):void{
			event.target.transform.colorTransform = getRandomColor();
		}
		
		private function getRandomColor():ColorTransform{
			var red:Number = (Math.random()*512)-255;
			var green:Number = (Math.random()*512)-255;
			var blue:Number = (Math.random()*512)-255;
			
			return new ColorTransform(1, 1, 1, 1, red, green, blue, 0);
		}
	}
}
package{
	import circle.Circle;
	
	import flash.display.Sprite;
	import flash.geom.ColorTransform;

	public class RandomColor extends Sprite{
		private var totalCircles:uint = 10;
		private var i:uint;
		
		public function RandomColor(){ 
			for(i = 0; i < totalCircles; i++){
				var circ:Circle = new Circle(20, 20, 20);
				circ.x = (stage.stageWidth / totalCircles) * i;
				circ.y = stage.stageHeight / 2;
				circ.transform.colorTransform = getRandomColor();
				addChild(circ);
			}
			
		}
		private function getRandomColor():ColorTransform{
			var red:Number = (Math.random()*512) - 255;
			var green:Number = (Math.random()*512) - 255;
			var blue:Number = (Math.random()*512) - 255;
			
			return new ColorTransform(1, 1, 1, 1, red, green, blue, 0);
		}
		
	}
}
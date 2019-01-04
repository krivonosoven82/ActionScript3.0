package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;


	public class ExampleHitTest extends Sprite{   
		                                                   //width, height, transparent, fillColor	
		private var bmd1:BitmapData = new BitmapData(100, 100, false, 0x000000ff); 
		private var bmd2:BitmapData = new BitmapData(20, 20, false, 0x00ff3300);
		private var blueSquare:Bitmap;
		private var redSquare1:Bitmap;
		private var redSquare2:Bitmap;
		private var pointBlueSquare:Point;
		private var pointRedSquare1:Point;
		private var pointRedSquare2:Point;
		
		public function ExampleHitTest(){
			//add a blue square
			blueSquare = new Bitmap(bmd1);
			blueSquare.x = 0;
			blueSquare.y = 0;
			this.addChild(blueSquare);
			
			//add a red square
			redSquare1 = new Bitmap(bmd2);
			this.addChild(redSquare1);
			redSquare1.x = 0;
			redSquare1.y = 0;
			
			//add a second red square
			redSquare2 = new Bitmap(bmd2);
			this.addChild(redSquare2);
			redSquare2.x = 101;
			redSquare2.y = 0;
			
			//define the point at the top-left corner of the bitmap
			pointBlueSquare = new Point(blueSquare.x, blueSquare.y);
			//define the point at the center of redSquare1
			pointRedSquare1 = new Point(redSquare1.x, redSquare1.y);
			//define the point at the center of redSquare2
			pointRedSquare2 = new Point(redSquare2.x, redSquare2.y);
			
			//обнаружение пересечения элементов
			
			trace(bmd1.hitTest(pointBlueSquare, 0xff, pointRedSquare1)); //true
			trace(bmd1.hitTest(pointBlueSquare, 0xff, pointRedSquare2)); //false
			
		}	
	}
}
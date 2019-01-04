package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;

	//clone(), cpryPixels(), copyChannel(), draw()
	
	public class ExampleClone extends Sprite{   
		                                                   //width, height, transparent, fillColor	
		private var myParentSquare:BitmapData = new BitmapData(100, 100, false, 0x00ff3300); 
		private var myCloneChild:BitmapData = myParentSquare.clone();
		
		private var myParentSquareContainer:Bitmap;
		private var myCloneChildContainer:Bitmap;

		public function ExampleClone(){
			myParentSquareContainer = new Bitmap(myParentSquare);
			this.addChild(myParentSquareContainer);
			
			myCloneChildContainer = new Bitmap(myCloneChild);
			this.addChild(myCloneChildContainer);
			myCloneChildContainer.x = 110;
			
		}	
	}
}
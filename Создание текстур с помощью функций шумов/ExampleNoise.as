package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	
	public class ExampleNoise extends Sprite{   
		private var myBitmap:BitmapData = new BitmapData(250, 250, false, 0xff000000);
		private var imageContainer:Bitmap;
		
		private var myBitmapDataObject:BitmapData = new BitmapData(150, 150, false, 0x00ff0000);
		private var seed:Number;
		private var channels:uint;
		private var myBitmapContainer:Bitmap;
		
		public function ExampleNoise(){
			//noise
			myBitmap.noise(500, 0, 255, BitmapDataChannel.BLUE, false);
			imageContainer = new Bitmap(myBitmap);
			addChild(imageContainer);
			
			//perlinNoise
			seed = Math.floor(Math.random() * 100);
			channels = BitmapDataChannel.GREEN | BitmapDataChannel.BLUE;
			myBitmapDataObject.perlinNoise(100, 80, 6, seed, false, true, channels, false, null);
			myBitmapContainer = new Bitmap(myBitmapDataObject);
			addChild(myBitmapContainer);
			myBitmapContainer.x = 300;
			myBitmapContainer.y = 0;
		}	
	}
}
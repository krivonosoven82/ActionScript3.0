package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ExampleScrollBitmap extends Sprite{   
		
		private var myBitmapDataObject:BitmapData = new BitmapData(1000, 1000, false, 0x00ff0000);
		private var seed:Number;
		private var channels:uint;
		private var myBitmapContainer:Bitmap;
		
		public function ExampleScrollBitmap(){
			seed = Math.floor(Math.random() * 100);
			channels = BitmapDataChannel.GREEN | BitmapDataChannel.BLUE;
			myBitmapDataObject.perlinNoise(100, 80, 6, seed, false, true, channels, false, null);
			myBitmapContainer = new Bitmap(myBitmapDataObject);
			myBitmapContainer.x = -750;
			myBitmapContainer.y = -750;
			addChild(myBitmapContainer);
			
			addEventListener(Event.ENTER_FRAME, scrollBitmap);
		}	
		private function scrollBitmap(e:Event):void{
			myBitmapDataObject.scroll(1, 1);
		}
	}
}
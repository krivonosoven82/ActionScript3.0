package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	public class GroupPixelManagement extends Sprite{   
		                                                   //width, height, transparent, fillColor	
		private var bitmapDataObject1:BitmapData = new BitmapData(100, 100, false, 0x006666ff); 
		private var bitmapDataObject2:BitmapData = new BitmapData(100, 100, false, 0x00ff0000);
		private var bitmapImage1:Bitmap;
		private var bitmapImage2:Bitmap;
		
		private var rect:Rectangle = new Rectangle(0, 0, 100, 100);
		private var bytes:ByteArray;
		
		public function GroupPixelManagement(){ 
			bytes = bitmapDataObject1.getPixels(rect);
			
			bytes.position = 0;
			//ключевая строчка кода с присвоением свойств от bitmapDataObject1
			bitmapDataObject2.setPixels(rect, bytes);
			
			bitmapImage1 = new Bitmap(bitmapDataObject1);
			addChild(bitmapImage1);
			bitmapImage2 = new Bitmap(bitmapDataObject2);
			addChild(bitmapImage2);
			bitmapImage2.x = 110;
		}	
	}
}
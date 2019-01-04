package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;

	public class IndividualPixelManagement extends Sprite{   
		                                                   //width, height, transparent, fillColor	
		//private var myBitmapData:BitmapData = new BitmapData(150, 150, true, 0x80FF3300); 
		private var myBitmapData:BitmapData = new BitmapData(100, 100, false, 0x009900);
		private var myBitmapImage:Bitmap = new Bitmap(myBitmapData);
		private var pixelValue:uint;
		
		public function IndividualPixelManagement(){ 
			for(var i:uint = 0; i < 100; i++){
				var red:uint = 0xff0000;
				myBitmapData.setPixel(50, i, red);
				myBitmapData.setPixel(i, 50, red);
			}
			addChild(myBitmapImage);
			pixelValue = myBitmapData.getPixel(50, 50);
			trace(pixelValue.toString(16));
		}	
	}
}
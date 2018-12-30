package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.filters.BevelFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.net.URLRequest;

	public class ExampleBevelFilter extends Sprite{
		//Load an image onto the Stage
		private var imageLoader:Loader = new Loader();
		private var url:String = "http://www.helpexamples.com/flash/images/image3.jpg";
		private var urlReq:URLRequest = new URLRequest(url);
		//Create the bevel filter and set filter properties
		private var bevel:BevelFilter = new BevelFilter();
		
		public function ExampleBevelFilter(){  
			imageLoader.load(urlReq);
			addChild(imageLoader);
		
			bevel.distance = 5;
			bevel.angle = 45;
			bevel.highlightColor = 0xffff00;
			bevel.highlightAlpha = 0.8;
			bevel.shadowColor = 0x666666;
			bevel.shadowAlpha = 0.8;
			bevel.blurX = 5;
			bevel.blurY = 5;
			bevel.strength = 5;
			bevel.quality = BitmapFilterQuality.HIGH;
			bevel.type = BitmapFilterType.INNER;
			bevel.knockout = false;
			
			//Apply filter to the image
			//imageLoader.filters = [bevel];
		}
		
	}
}
package{
	
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;
	import flash.net.URLRequest;
	
	
	public class ExampleDisplacementMapFilters1 extends Sprite{
		private var loader:Loader = new Loader(); 
		private var url:URLRequest = new URLRequest("http://www.helpexamples.com/flash/images/image3.jpg"); 
		
		private var mapImage:BitmapData;
		private var displacementMap:DisplacementMapFilter;
		
		public function ExampleDisplacementMapFilters1(){ 
			loader.load(url);
			this.addChild(loader);
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, setupStage);
		}
		
		//this function is called when the image finishes loading
		private function setupStage(e:Event):void{
			//Center the loaded image on the Stage
			loader.x = (stage.stageWidth - loader.width) / 2;
			loader.y = (stage.stageHeight - loader.height) / 2;
			
			//Create the displecement map image
			mapImage = new BitmapData(loader.width, loader.height, false, 0xff0000);
			
			//Create the displacement filter
			displacementMap = new DisplacementMapFilter();
			displacementMap.mapBitmap = mapImage;
			displacementMap.mapPoint = new Point(0, 0);
			displacementMap.componentX = BitmapDataChannel.RED;
			displacementMap.scaleX = 250;
			loader.filters = [displacementMap];
		}
		
	}
}
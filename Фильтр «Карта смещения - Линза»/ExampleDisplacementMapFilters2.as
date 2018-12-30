package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.GradientType;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DisplacementMapFilter;
	import flash.filters.DisplacementMapFilterMode;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.net.URLRequest;

	public class ExampleDisplacementMapFilters2 extends Sprite{
		//create the gradient circle that will together from the displacement map image
		private var radius:uint = 50;
		
		private var type:String = GradientType.LINEAR;
		private var redColors:Array = [0xff0000, 0x000000];
		private var blueColors:Array = [0x0000ff, 0x000000];
		private var alphas:Array = [1, 1];
		private var ratios:Array = [0, 255];
		private var xMatrix:Matrix = new Matrix();
		private var yMatrix:Matrix = new Matrix();
		
		private var xCircle:Shape = new Shape();
		private var yCircle:Shape = new Shape();
		
		private var loader:Loader = new Loader();
		private var url:URLRequest = new URLRequest("http://www.helpexamples.com/flash/images/image1.jpg");
		
		private var map:BitmapData;
		private var yMap:BitmapData;
		private var mapBitmap:Bitmap;
		
		public function ExampleDisplacementMapFilters2(){ 
			xMatrix.createGradientBox(radius*2, radius*2);
			yMatrix.createGradientBox(radius*2, radius*2, Math.PI/2);
			
			xCircle.graphics.lineStyle(0, 0, 0);
			xCircle.graphics.beginGradientFill(type, redColors, alphas, ratios, xMatrix);
			xCircle.graphics.drawCircle(radius, radius, radius);
			yCircle.graphics.lineStyle(0, 0, 0);
			yCircle.graphics.beginGradientFill(type, blueColors, alphas, ratios, yMatrix);
			yCircle.graphics.drawCircle(radius, radius, radius);
			
			//position the circles at the bottom of screen? for reference
			this.addChild(xCircle);
			xCircle.y = stage.stageHeight - xCircle.height;
			this.addChild(yCircle);
			yCircle.y = stage.stageHeight - yCircle.height;
			yCircle.x = 200;
			
			//load an image onto the Stage
			loader.load(url);
			this.addChild(loader);
			
			//create the map image by combining the two gradient circles
			map = new BitmapData(xCircle.width, xCircle.height, false, 0x7f7f7f);
			map.draw(xCircle);
			yMap = new BitmapData(yCircle.width, yCircle.height, false, 0x7f7f7f);
			yMap.draw(yCircle);
			map.copyChannel(yMap, yMap.rect, new Point(0, 0), BitmapDataChannel.BLUE, BitmapDataChannel.BLUE);
			yMap.dispose();
			
			//display the map image on the stage, for reference
			mapBitmap = new Bitmap(map);
			this.addChild(mapBitmap);
			mapBitmap.x = 400;
			mapBitmap.y = stage.stageHeight - mapBitmap.height;
			
			loader.addEventListener(MouseEvent.MOUSE_MOVE, moveMagnifier);
		}
		
		//this function create the displacement map filter at the mouse location
		private function magnify():void{
			//position the filter
			var filterX:Number = (loader.mouseX) - (map.width / 2);
			var filterY:Number = (loader.mouseY) - (map.height / 2);
			var pt:Point = new Point(filterX, filterY);
			var xyFilter:DisplacementMapFilter = new DisplacementMapFilter();
			xyFilter.mapBitmap = map;
			xyFilter.mapPoint = pt;
			//the red in the map image will control x displacement
			xyFilter.componentX = BitmapDataChannel.RED;
			//the blue in the map image will control y displacement
			xyFilter.componentY = BitmapDataChannel.BLUE;
			xyFilter.scaleX = 35;
			xyFilter.scaleY = 35;
			xyFilter.mode = DisplacementMapFilterMode.IGNORE;
			
			loader.filters = [xyFilter];
		}
		
		// This function is called when the mouse moves. If the mouse is 
		// over the loaded image, it applies the filter. 
		private function moveMagnifier(e:MouseEvent):void{
			if(loader.hitTestPoint(loader.mouseX, loader.mouseY)){
				magnify();
			}
		}
	}
}
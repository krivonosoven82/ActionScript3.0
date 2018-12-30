package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GradientBevelFilter;
	
	public class ExampleGradientBevelFilter extends Sprite{
		
		private var box:Shape = new Shape(); 
		private var gradientBevel:GradientBevelFilter = new GradientBevelFilter();
		
		public function ExampleGradientBevelFilter(){ 
			//Draw a box
			box.graphics.lineStyle();
			box.graphics.beginFill(0xfefe78);
			box.graphics.drawRect(100, 50, 90, 200);
			box.graphics.endFill();
			
			addChild(box);
			
			//Apply a gradientBevel to the box
			gradientBevel.distance = 8;
			gradientBevel.angle = 225; // opposite of 45 degrees
			gradientBevel.colors = [0xffffcc, 0xfefe78, 0x8f8e01];
			gradientBevel.alphas = [1, 0, 1];
			gradientBevel.ratios = [0, 128, 225];
			gradientBevel.blurX = 8;
			gradientBevel.blurY = 8;
			gradientBevel.quality = BitmapFilterQuality.HIGH;
			
			
			// Other properties let you set the filter strength and set options 
			// for inner bevel and knockout effects. 
			
			box.filters = [gradientBevel];
		}
		
	}
}
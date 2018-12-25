package
{

	import flash.display.GradientType;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	
	
	public class MaskAlphaChannel extends Sprite{
		private var loader:Loader = new Loader();
		private var url:URLRequest = new URLRequest("http://www.helpexamples.com/flash/images/image1.jpg");
		//create a Sprite
		private var oval:Sprite = new Sprite();
		//draw a ggradient oval
		private var color:Array = [0x000000, 0x000000];
		private var alphas:Array = [1, 0];
		private var ratios:Array = [0, 225];
		private var matrix:Matrix = new Matrix();
		
		public function MaskAlphaChannel(){  
			loader.load(url);
			this.addChild(loader);
			
			matrix.createGradientBox(200, 100, -100, -50);
			oval.graphics.beginGradientFill(GradientType.RADIAL,
											color,
											alphas,
											ratios,
											matrix);
			oval.graphics.drawEllipse(-100, -50, 200, 100);
			oval.graphics.endFill();
			this.addChild(oval);
			
			loader.cacheAsBitmap = true;
			oval.cacheAsBitmap = true;
			loader.mask = oval;
			oval.startDrag(true);
		}
		
		
	}
}
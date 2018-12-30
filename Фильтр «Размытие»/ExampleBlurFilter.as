package
{

	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	
	public class ExampleBlurFilter extends Sprite{
		private var redDotCutout:Sprite = new Sprite();
		private var blur:BlurFilter = new BlurFilter();
		public function ExampleBlurFilter(){ 
			//Draw a circle
			redDotCutout.graphics.lineStyle();
			redDotCutout.graphics.beginFill(0xff0000);
			redDotCutout.graphics.drawCircle(145, 90, 25);
			redDotCutout.graphics.endFill();
			//Add the circle to the display list
			addChild(redDotCutout);
			
			//Applay the blur filter to the circle
			blur.blurX = 10;
			blur.blurY = 10;
			blur.quality = BitmapFilterQuality.MEDIUM;
			redDotCutout.filters = [blur];
		}
		
	}
}
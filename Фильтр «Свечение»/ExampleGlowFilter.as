package
{

	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	
	public class ExampleGlowFilter extends Sprite{
		
		private var crossGraphic:Sprite = new Sprite();
		private var glow:GlowFilter = new GlowFilter();
		
		public function ExampleGlowFilter(){ 
			//Draw a crossGraphic
			crossGraphic.graphics.lineStyle();
			crossGraphic.graphics.beginFill(0xcccc00);
			crossGraphic.graphics.drawRect(60, 90, 100, 20);
			crossGraphic.graphics.drawRect(100, 50, 20, 100);
			crossGraphic.graphics.endFill();
			//Add the box to the display list
			addChild(crossGraphic);
			
			//Applay the glow filter to the crossGraphic
			glow.color = 0x009922;
			glow.alpha = 1;
			glow.blurX = 25;
			glow.blurY = 25;
			glow.quality = BitmapFilterQuality.MEDIUM;
			
			crossGraphic.filters = [glow];
		}
		
	}
}
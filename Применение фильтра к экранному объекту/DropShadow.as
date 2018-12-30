package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;

	public class DropShadow extends Sprite{
		private var myBitmapData:BitmapData = new BitmapData(100, 100, false, 0xff3300);
		private var myDisplayObject:Bitmap = new Bitmap(myBitmapData);
		
		private var dropShadow:DropShadowFilter = new DropShadowFilter();
		private var bevel:BevelFilter = new BevelFilter();
		private var glow:GlowFilter = new GlowFilter();
		private var filtersArray:Array = [dropShadow, bevel, glow];
		
		public function DropShadow(){  
			addChild(myDisplayObject);
			myDisplayObject.filters = filtersArray;
			
			
			
		}
	}
}
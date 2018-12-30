package
{

	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	
	public class ExampleDropShadowFilter extends Sprite{
		private var boxShadow:Sprite = new Sprite();
		private var shadow:DropShadowFilter = new DropShadowFilter();
		public function ExampleDropShadowFilter(){ 
			//Draw a boxShadow
			boxShadow.graphics.beginFill(0xff3300);
			boxShadow.graphics.drawRect(0, 0, 100, 100);
			boxShadow.graphics.endFill();
			//Add the box to the display list
			addChild(boxShadow);
			
			//Applay the drap filter to the boxShadow
			shadow.distance = 10;
			shadow.angle = 25;
			
			// You can also set other properties, such as the shadow color, 
			// alpha, amount of blur, strength, quality, and options for  
			// inner shadows and knockout effects. 
			
			
			
			boxShadow.filters = [shadow];
		}
		
	}
}
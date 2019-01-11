package gameClasses
{
	import flash.display.Sprite;
	
	public class Button extends Sprite
	{
		private var btn:Sprite = new Sprite();
		public function Button()
		{
			super();
		}
		public function drawButton(colorFill:uint, radius:Number):void{
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.beginFill(colorFill);
			this.graphics.drawCircle(0, 0, radius);
			this.graphics.endFill();
		}
	}
}
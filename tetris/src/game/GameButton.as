package game{
	import flash.display.Sprite;
	
	public class GameButton extends Sprite{
		public function GameButton(){
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
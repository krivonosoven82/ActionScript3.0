package circle
{
	import flash.display.Sprite;
	
	public class Circle extends Sprite
	{
		private var circlePositionX:Number;
		private var circlePositionY:Number;
		private var circleRadius:Number;
		public function Circle(circlePositionX:Number, circlePositionY:Number, circleRadius:Number)
		{
			super();
			this.circlePositionX = circlePositionX;
			this.circlePositionY = circlePositionY;
			this.circleRadius = circleRadius;
			
			graphics.lineStyle();
			graphics.beginFill(0x000000);
			graphics.drawCircle(circlePositionX, circlePositionY, circleRadius);
			graphics.endFill();
		}
	}
}
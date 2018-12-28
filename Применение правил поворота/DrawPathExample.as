package
{

	import flash.display.*;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	public class DrawPathExample extends Sprite{

		public function DrawPathExample(){  
			graphics.beginFill(0x60a0ff);
			graphics.drawPath(Vector.<int>([1,2,2,2,2]), Vector.<Number>([
				66,10, 23,127, 122,50, 10,49, 109,127]), GraphicsPathWinding.NON_ZERO);
			
		}
	}
}
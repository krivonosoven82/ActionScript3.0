package
{
	import flash.display.*;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class ObjectIntersection extends Sprite{
		private var rec1:Shape = new Shape();
		private var rec1Color:uint = 0xff0000;
		private var rec2:Shape = new Shape();
		private var rec2Color:uint = 0x0000ff;
		private var rec1Bounds:Rectangle;
		private var rec2Bounds:Rectangle;
		
		public function ObjectIntersection(){  
			rec1.graphics.beginFill(rec1Color);
			rec1.graphics.drawRect(0, 0, 100, 100);
			rec1.graphics.endFill();
			this.addChild(rec1);
			rec1Bounds = rec1.getBounds(stage);
			trace("rec1Bounds: " + rec1Bounds);
			
			
			rec2.graphics.beginFill(rec2Color);
			rec2.graphics.drawRect(0, 0, 100, 100);
			rec2.x = 90;
			rec2.graphics.endFill();
			this.addChild(rec2);
			rec2Bounds = rec2.getBounds(stage);
			trace("rec2Bounds: " + rec2Bounds);
			
			trace(rec1Bounds.intersects(rec2Bounds));
			
			if(rec1Bounds.intersects(rec2Bounds)){
				rec2.alpha = 0.2;
				rec2.y = 50;
				
			}
		}
	}
}
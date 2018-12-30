package
{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.*;
	import flash.geom.Matrix;

	public class MatrixObject extends Sprite{
		private var rec:Sprite = new Sprite();
	
		
		public function MatrixObject(){  
			
			this.addChild(rec);
			rec.graphics.beginFill(0x0000ff, 1);
			rec.graphics.drawRect(0, 0, 100, 100);
			rec.x = ((stage.stageWidth/2) - (rec.width/2));
			rec.y = ((stage.stageHeight/2) - (rec.height/2));
			
			addMatrix1(rec);
			
		}
		
		private function addMatrix1(elem:Object):void{
			var matrix:Matrix = elem.transform.matrix;
			var scaleX:Number = 2.0;
			var scaleY:Number = 3.0;
			var rotation:Number = 2*Math.PI*(60/360);
			var tx:Number = ((stage.stageWidth/2) - (elem.width/2));;
			var ty:Number = ((stage.stageHeight/2) - (elem.height/2));
			matrix.createBox(scaleX, scaleY, rotation, tx, ty);
			elem.transform.matrix = matrix;
		}
		private function addMatrix2(elem:Object):void{
			var matrix:Matrix = new Matrix();
			var rotation:Number = 2 * Math.PI * (30 / 360); // 30° 
			var scaleFactor:Number = 2; 
			matrix.scale(scaleFactor, scaleFactor); 
			matrix.rotate(rotation); 
			matrix.scale(scaleX, scaleY); 
			matrix.rotate(rotation); 
			elem.transform.matrix = matrix;
		}
		
		
	}
}
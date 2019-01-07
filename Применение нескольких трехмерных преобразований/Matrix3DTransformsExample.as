package{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.*;
	
	public class Matrix3DTransformsExample extends Sprite{ 
		private var rect1:Shape = new Shape();
		private var rect2:Shape = new Shape();
		
		public function Matrix3DTransformsExample(){
			var pp:PerspectiveProjection = this.transform.perspectiveProjection;
			pp.projectionCenter = new Point(275, 200);
			this.transform.perspectiveProjection = pp;
			
			rect1.graphics.beginFill(0xff8800);
			rect1.graphics.drawRect(0, 0, 50, 80);
			rect1.graphics.endFill();
			rect1.x = -70;
			rect1.y = -40;
			rect1.z = 0;
			addChild(rect1);
			
			rect2.graphics.beginFill(0xff0088);
			rect2.graphics.drawRect(0, 0, 50, 80);
			rect2.graphics.endFill();
			rect2.x = 20;
			rect2.y = -40;
			rect2.z = 0;
			addChild(rect2);
			
			doTransforms();
		}
		private function doTransforms():void{
			// 1 способ трехмерного преобразования
			rect1.rotationX = 15;
			rect1.scaleX = 1.2;
			rect1.x += 100;
			rect1.y += 50;
			rect1.rotationZ = 10;
			
			// 2 способ трехмерного преобразования
			var matrix:Matrix3D = rect2.transform.matrix3D;
			matrix.appendRotation(15, Vector3D.X_AXIS);
			matrix.appendScale(1.2, 1, 1);
			matrix.appendTranslation(100, 50, 0);
			matrix.appendRotation(10, Vector3D.Z_AXIS);
			rect2.transform.matrix3D = matrix;
		}
	}
}
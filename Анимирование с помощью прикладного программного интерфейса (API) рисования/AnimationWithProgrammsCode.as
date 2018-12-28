package
{

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;

	public class AnimationWithProgrammsCode extends Sprite{
		private var currentDegrees:Number = 0;
		private var radius:Number = 60;
		private var satelliteRadius:Number = 10;
		private var container:Sprite = new Sprite();
		private var satellite:Shape = new Shape();
		
		public function AnimationWithProgrammsCode(){  
			stage.frameRate = 31;
			container.x = stage.stageWidth / 2;
			container.y = stage.stageHeight / 2;
			addChild(container);
			container.addChild(satellite);
			
			addEventListener(Event.ENTER_FRAME, doEveryFrame);
			
		}
		private function doEveryFrame(e:Event):void{
			currentDegrees += 2;
			var radians:Number = getRadians(currentDegrees);
			var posX:Number = Math.sin(radians) * radius;
			var posY:Number = Math.cos(radians) * radius;
			satellite.graphics.clear();
			satellite.graphics.beginFill(0);
			satellite.graphics.drawCircle(posX, posY, satelliteRadius);
		}
		
		private function getRadians(degrees:Number):Number{
			return degrees * Math.PI / 180;
		}

	}
}
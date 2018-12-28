package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class AnimationAlpha extends Sprite{
		private var circle:Sprite = new Sprite();
		
		public function AnimationAlpha(){  
			circle.graphics.beginFill(0x990000);
			circle.graphics.drawCircle(50, 50, 50);
			circle.graphics.endFill();
			this.addChild(circle);
			
			circle.addEventListener(MouseEvent.CLICK, startAnimation);
		}
		private function fadeCircle(e:Event):void{
			circle.alpha -= .05;
			trace("animation start");
			if(circle.alpha <= 0){
				circle.removeEventListener(Event.ENTER_FRAME, fadeCircle);
				trace("animation stop");
			}
		}
		private function startAnimation(e:MouseEvent):void{
			circle.addEventListener(Event.ENTER_FRAME, fadeCircle);
		}
	}
}
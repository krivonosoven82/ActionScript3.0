package
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ShortTimer extends Sprite{
		private var minuteTimer:Timer  = new Timer(1000, 5);
		
		public function ShortTimer(){  
			minuteTimer.addEventListener(TimerEvent.TIMER, onTick);
			minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			minuteTimer.start();
		}
		private function onTick(e:TimerEvent):void{
			trace("tick " + e.target.currentCount);
		}
		private function onTimerComplete(e:TimerEvent):void{
			trace("Time's Up!");
		}
		
		
	}
}
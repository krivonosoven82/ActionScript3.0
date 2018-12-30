package{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.GradientBevelFilter;
	import flash.utils.Timer;
	
	public class ExampleMixBaseFilters extends Sprite{
		private var count:Number = 1;
		private var distance:Number = 8;
		private var angleInDegrees:Number = 225; // opposite of 45 degrees
		private var colors:Array = [0xffffcc, 0xfefe78, 0x8f8e01];
		private var alphas:Array = [1, 0, 1];
		private var ratios:Array = [0, 128, 255];
		private var blurX:Number = 8;
		private var blurY:Number = 8;
		private var strength:Number = 1;
		private var quality:Number = BitmapFilterQuality.HIGH;
		private var type:String = BitmapFilterType.INNER;
		private var knockout:Boolean = false;
		
		private var box:Shape = new Shape();
		private var stopLight:Shape = new Shape();
		private var cautionLight:Shape = new Shape();
		private var goLight:Shape = new Shape();
		
		private var gradientBevel:GradientBevelFilter = new GradientBevelFilter(distance, 
			angleInDegrees, colors, alphas,ratios, blurX, blurY, strength, quality, 
			type, knockout);
		
		private var innerShadow:DropShadowFilter = new DropShadowFilter(5, 45, 0, 0.5, 3, 3, 1, 1, true, false);
		private var redGlow:GlowFilter = new GlowFilter(0xff0000, 1, 30, 30, 1, 1, false, false);
		private var yellowGlow:GlowFilter = new GlowFilter(0xff9900, 1, 30, 30, 1, 1, false, false);
		private var greenGlow:GlowFilter = new GlowFilter(0x00cc00, 1, 30, 30, 1, 1, false, false);
		
		private var timer:Timer = new Timer(3000, 9);
		
		public function ExampleMixBaseFilters(){ 
			//Draw the rectangle background for the traffic light
			box.graphics.lineStyle();
			box.graphics.beginFill(0xfefe78);
			box.graphics.drawRect(100, 50, 90, 200);
			box.graphics.endFill();
			//Draw the 3 circles for the three lights
			stopLight.graphics.lineStyle();
			stopLight.graphics.beginFill(0xff0000);
			stopLight.graphics.drawCircle(145, 90, 25);
			stopLight.graphics.endFill();
			
			cautionLight.graphics.lineStyle();
			cautionLight.graphics.beginFill(0xff9900);
			cautionLight.graphics.drawCircle(145, 150, 25);
			cautionLight.graphics.endFill();
			
			goLight.graphics.lineStyle();
			goLight.graphics.beginFill(0x00cc00);
			goLight.graphics.drawCircle(145, 210, 25);
			goLight.graphics.endFill();
			//Add the graphics to the display list
			addChild(box);
			addChild(stopLight);
			addChild(cautionLight);
			addChild(goLight);
			
			//Apply a gradientBevel to the traffic light rectangle
			box.filters = [gradientBevel];
			
			//Create the inner shadow(for lights when off) and glow (for lights when on)
			stopLight.filters = [redGlow];
			cautionLight.filters = [innerShadow];
			goLight.filters = [innerShadow];
			
			//Create a timer to swap the filters at a 3 seconds interval
			timer.addEventListener(TimerEvent.TIMER, trafficControl);
			timer.start();
			
		}
		private function trafficControl(e:TimerEvent):void{
			//Swap the filters based on the count value
			if(count == 4){
				count = 1;
			}
			switch(count){
				case 1:
					toLightYellow();
					break;
				case 2:
					toLightGreen();
					break;
				case 3:
					toLightRed();
					break;
			}
			count++;
		}
		
		private function toLightRed():void{
			stopLight.filters = [redGlow];
			cautionLight.filters = [innerShadow];
			goLight.filters = [innerShadow];
		}
		private function toLightYellow():void{
			stopLight.filters = [innerShadow];
			cautionLight.filters = [yellowGlow];
			goLight.filters = [innerShadow];
		}
		private function toLightGreen():void{
			stopLight.filters = [innerShadow];
			cautionLight.filters = [innerShadow];
			goLight.filters = [greenGlow];
		}
		
	}
}
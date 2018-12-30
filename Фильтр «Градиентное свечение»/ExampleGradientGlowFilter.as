package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.GradientGlowFilter;
	import flash.ui.Mouse;
	
	public class ExampleGradientGlowFilter extends Sprite{
		
		private var shape:Shape = new Shape();
		private var gradientGlow:GradientGlowFilter = new GradientGlowFilter();
		
		public function ExampleGradientGlowFilter(){ 
			//Draw the shape
			shape.graphics.beginFill(0xff0000, 1);
			shape.graphics.moveTo(0, 0);
			shape.graphics.lineTo(100, 0);
			shape.graphics.lineTo(100, 100);
			shape.graphics.lineTo(0, 100);
			shape.graphics.lineTo(0, 0);
			shape.graphics.endFill();
			addChild(shape);
			shape.x = 100;
			shape.y = 100;
			
			//Define a gradient glow
			gradientGlow.distance = 0;
			gradientGlow.angle = 45;
			gradientGlow.colors = [0x000000, 0xff0000];
			gradientGlow.alphas = [0, 1];
			gradientGlow.ratios = [0, 225];
			gradientGlow.blurX = 10;
			gradientGlow.blurY = 10;
			gradientGlow.strength = 2;
			gradientGlow.quality = BitmapFilterQuality.HIGH;
			gradientGlow.type = BitmapFilterType.OUTER;
			//add define filter gradientGlow
			//shape.filters = [gradientGlow];
			
			stage.addEventListener(MouseEvent.CLICK, onClick);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			
		}
		private function onClick(e:MouseEvent):void{
			gradientGlow.strength++;
			shape.filters = [gradientGlow];
		}
		private function onMouseMove(e:MouseEvent):void{
			gradientGlow.blurX = (stage.mouseX / stage.stageWidth) * 255;
			gradientGlow.blurY = (stage.mouseY / stage.stageHeight) * 255;
			shape.filters = [gradientGlow];
		}
		
	}
}
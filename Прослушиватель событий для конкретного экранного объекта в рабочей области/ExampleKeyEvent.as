package{

	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;

	public class ExampleKeyEvent extends Sprite{
	
		private var tf:TextField = new TextField();
		
		public function ExampleKeyEvent(){
			addChild(tf);
			tf.border = true;
			tf.type = "input";
			
			tf.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
			tf.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
		}
		
		private function reportKeyDown(e:KeyboardEvent):void{
			trace("Key Pressed: " + String.fromCharCode(e.charCode) + 
				" (character code: " + e.charCode + ") " );
			if(e.keyCode == Keyboard.SHIFT){
				tf.borderColor = 0xff0000;
			}
		}
		private function reportKeyUp(e:KeyboardEvent):void{
			trace("Key Pressed: " + String.fromCharCode(e.charCode) + 
				" (character code: " + e.charCode + ") ");
			if(e.keyCode == Keyboard.SHIFT){
				tf.borderColor = 0x000000;
			}
		}
	}
}
package{

	import flash.display.Sprite;
	import flash.events.KeyboardEvent;

	public class KeyValue extends Sprite{
	
		public function KeyValue(){
			stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
		}
		private function reportKeyDown(e:KeyboardEvent):void{
			trace("Key Pressed: " + String.fromCharCode(e.charCode) + 
				" (character code: " + e.charCode + ") " + "keyCode: "+e.keyCode);
		}
	}
}
package{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.ui.Mouse;
	
	// page 464 TextField.htmlText
	
	
	public class WokringWithText extends Sprite{	
		private var myTextField:TextField = new TextField();  
		
		public function WokringWithText(){
			myTextField.text = "No matter where you click on this text field the TEXT IN ALL CAPS is selected."; 
			myTextField.autoSize = TextFieldAutoSize.LEFT;
			addChild(myTextField);
			addEventListener(MouseEvent.CLICK, selectText);
			
		}
		
		private function selectText(e:MouseEvent):void{
			myTextField.setSelection(49, 65);
		}
		
	}
}
package{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.ui.Mouse;
	
	// page 464 TextField.htmlText
	
	
	public class WokringWithText extends Sprite{	
		private var myText:TextField = new TextField();  
		
		public function WokringWithText(){
			myText.text = "Hello World";
			
			var format1:TextFormat = new TextFormat();
			format1.color = 0xff0000;
			
			var format2:TextFormat = new TextFormat();
			format2.font = "Courier";
			
			myText.setTextFormat(format1);
			var startRange:uint = 6;
			myText.setTextFormat(format2, startRange);
			addChild(myText);	
		}
	}
}
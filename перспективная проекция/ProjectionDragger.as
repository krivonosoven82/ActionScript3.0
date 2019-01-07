package{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Point;
	
	public class ProjectionDragger extends Sprite{ 
		private var center:Sprite = new Sprite();
		private var boxPanel:Shape;
		private var inDrag:Boolean = false;
		
		public function ProjectionDragger(){
			createBoxes();
			createCenter();
		}
		
		private function createCenter():void{
			var centerRadius:int = 20;
			//circle
			center.graphics.lineStyle(1, 0x000099);
			center.graphics.beginFill(0xcccccc, 0.5);
			center.graphics.drawCircle(0, 0, centerRadius);
			center.graphics.endFill();
			
			//cross hairs
			center.graphics.moveTo(0, centerRadius);
			center.graphics.lineTo(0, -centerRadius);
			center.graphics.moveTo(centerRadius, 0);
			center.graphics.lineTo(-centerRadius, 0);
			center.x = 175;
			center.y = 175;
			center.z = 0
			this.addChild(center);
			
			center.addEventListener(MouseEvent.MOUSE_DOWN, startDragProjectionCenter);
			center.addEventListener(MouseEvent.MOUSE_UP, stopDragProjectionCenter);
			center.addEventListener(MouseEvent.MOUSE_MOVE, doDragProjectionCenter);
			root.transform.perspectiveProjection.projectionCenter = new Point(center.x, center.y);
		}
		
		private function createBoxes():void{
			//createBoxPanel();
			var boxWidth:int = 50;
			var boxHeight:int = 50;
			var numLayers:int = 12;
			var depthPerLayer:int = 50;
			
			//var boxVec:Vector.<Shape> = new Vector.<Shape>(numLayers);
			for(var i:int = 0; i < numLayers; i++){
				this.addChild(createBox(150, 50, (numLayers - i) * depthPerLayer, boxWidth, boxHeight, 0xccccff));
				this.addChild(createBox(150, 50, (numLayers - i) * depthPerLayer, boxWidth, boxHeight, 0xffcccc));
				this.addChild(createBox(150, 50, (numLayers - i) * depthPerLayer, boxWidth, boxHeight, 0xccffcc));
				this.addChild(createBox(150, 50, (numLayers - i) * depthPerLayer, boxWidth, boxHeight, 0xdddddd));
			}
		}
		
		private function createBox(xPos:int = 0, yPos:int = 0, zPos:int = 0, w:int = 50, h:int = 50, color:int = 0xdddddd):Shape{
			var box:Shape = new Shape();
			box.graphics.lineStyle(2, 0x666666);
			box.graphics.beginFill(color, 1.0);
			box.graphics.drawRect(0, 0, w, h);
			box.graphics.endFill();
			box.x = xPos;
			box.y = yPos;
			box.z = zPos;
			return box;
		}
		
		private function startDragProjectionCenter(e:Event):void{
			center.startDrag();
			inDrag = true;
		}
		
		private function doDragProjectionCenter(e:Event):void{
			if(inDrag){
				root.transform.perspectiveProjection.projectionCenter = new Point(center.x, center.y);
			}
		}
		
		private function stopDragProjectionCenter(e:Event):void{
			center.stopDrag();
			root.transform.perspectiveProjection.projectionCenter = new Point(center.x, center.y);
			inDrag = false;
		}
		
		
	}
}
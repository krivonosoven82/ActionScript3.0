package
{

	import flash.display.*;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;

	public class GraphicsData extends Sprite{
		// stroke object
		private var stroke:GraphicsStroke = new GraphicsStroke(3);
		// fill object
		private var fill:GraphicsGradientFill = new GraphicsGradientFill();
		// path object
		private var path:GraphicsPath = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
		// combine objects for complete drawing
		private var drawing:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
		public function GraphicsData(){  
			stroke.joints = JointStyle.MITER;
			stroke.fill = new GraphicsSolidFill(0x102020); // solid stroke
			
			fill.colors = [0x0000ff, 0xeeffee];
			fill.matrix = new Matrix();
			fill.matrix.createGradientBox(70, 70, Math.PI / 2);
			
			path.commands.push(1,2,2);
			path.data.push(125,10, 50,110, 175,10);
			
			drawing.push(stroke, fill, path);
			graphics.drawGraphicsData(drawing);
			
			// draw the drawing multiple times 
			// change one value to modify each variation 
			path.data[2] += 200;
			graphics.drawGraphicsData(drawing);
			path.data[2] -= 150;
			graphics.drawGraphicsData(drawing);
			path.data[2] += 100;
			graphics.drawGraphicsData(drawing);
			path.data[2] -= 50;
			graphics.drawGraphicsData(drawing);
		}
	}
}
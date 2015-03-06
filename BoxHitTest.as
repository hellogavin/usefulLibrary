package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	public class BoxHitTest extends Sprite
	{
		private var box1:Box;
		private var box2:Box;
		
		public function BoxHitTest()
		{
			box1=new Box();
			box2=new Box();
			box1.x=10;
			box1.y=0;
			box2.scaleX=-1;
			box2.x=100;
			box2.y=100;
			
			var bmpd1:BitmapData=new BitmapData(box1.width+box1.x,box1.y+box1.height,true,0x00000000);
			var matrix:Matrix=new Matrix(1,0,0,1,box1.x,box1.y);
			bmpd1.draw(box1,matrix);
			var bmp1:Bitmap=new Bitmap(bmpd1);
			this.addChild(bmp1);
			var bmpd2:BitmapData=new BitmapData(box2.width+box2.x,box2.y+box2.height,true,0x000000);
			matrix=new Matrix(-1,0,0,1,box2.x,box2.y);
			bmpd2.draw(box2,matrix);
			var bmp2:Bitmap=new Bitmap(bmpd2);
			this.addChild(bmp2);
			trace("hittest:"+bmpd1.hitTest(new Point(bmp1.x,bmp1.y),0xFF000000,bmp2,new Point(bmp2.x,bmp2.y),0xFFFF0000));
		}
	}
}

import flash.display.Sprite;

class Box extends Sprite
{
	public function Box()
	{
		this.graphics.beginFill(0);
		this.graphics.moveTo(0,0);
		this.graphics.lineTo(100,0);
		this.graphics.lineTo(100,10);
		this.graphics.lineTo(10,10);
		this.graphics.lineTo(10,100);
		this.graphics.lineTo(100,100);
		this.graphics.lineTo(100,110);
		this.graphics.lineTo(0,110);
		this.graphics.lineTo(0,0);
		this.graphics.endFill();
	}
}
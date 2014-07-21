/**
 * <ui>
 *<li>desc:</li>
 * <li>E-mail: hellogavin1988#gmail.com</li>
 * <li>version 1.0.0</li>
 *<li> 创建时间：2014/7/21 14:50</li>
 *</ui>
 *@author zhengxuesong
 * */
package
{
    import flash.display.MovieClip;

    public class DrawSector
    {
        private function doDrawSector(mc:MovieClip, angle:Number, r:Number = 100, x:Number = 33, y:Number = 39, startFrom:Number = 270, color:Number = 0xff0000):void
        {
            mc.graphics.clear();
            mc.graphics.beginFill(color, 50);
            mc.graphics.lineStyle(0, 0xff0000);
            mc.graphics.moveTo(x, y);
            angle = (Math.abs(angle) > 360) ? 360 : angle;
            var n:Number = Math.ceil(Math.abs(angle) / 45);
            var angleA:Number = angle / n;
            angleA = angleA * Math.PI / 180;
            startFrom = startFrom * Math.PI / 180;
            mc.graphics.lineTo(x + r * Math.cos(startFrom), y + r * Math.sin(startFrom));
            for (var i = 1; i <= n; i++)
            {
                startFrom += angleA;
                var angleMid = startFrom - angleA / 2;
                var bx:int = x + r / Math.cos(angleA / 2) * Math.cos(angleMid);
                var by:int = y + r / Math.cos(angleA / 2) * Math.sin(angleMid);
                var cx:int = x + r * Math.cos(startFrom);
                var cy:int = y + r * Math.sin(startFrom);
                mc.graphics.curveTo(bx, by, cx, cy);
            }
            if (angle != 360)
            {
                mc.graphics.lineTo(x, y);
            }
            mc.graphics.endFill();// if you want a sector without filling color , please remove this line.
        }
    }
}

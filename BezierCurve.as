/**
 * <ui>
 *<li>desc:</li>
 * <li>E-mail: hellogavin1988#gmail.com</li>
 * <li>version 1.0.0</li>
 *<li> 创建时间：2014/7/15 14:51</li>
 *</ui>
 *@author zhengxuesong
 * */
package
{
    import flash.display.MovieClip;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.utils.Timer;

    public class BezierCurve extends MovieClip
    {
        private var nIndex:uint = 0;
        private var P0:Point = new Point(50, 50);
        private var P1:Point = new Point(300, 600);
        private var P2:Point = new Point(600, 600);
        private var P3:Point = new Point(800, 200);
        private var total_length:Number = 0.0;
        private var STEP:int = 30;
        private var pixels:Array = [];
        private var timer:Timer;

        public function BezierCurve()
        {
            for (var i:int = 0; i < STEP; i++)
            {
                pixels.psuh(new Point(0, 0));
            }
            total_length = bezierLength(1.0);
            this.graphics.lineStyle(2, 0xff0000);
            timer = new Timer(30);
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            this.graphics.moveTo(P0.x, P0.y);
            timer.start();
        }

        private function timerHandler(event:TimerEvent):void
        {
            if (nIndex < STEP)
            {
                var t:Number = 1.0 * nIndex / STEP;
                //求得匀速运动对应的t值
                t = bezierEven(t);

                //get x,y position base on bezier function
                var xx:Number = bezierX(t);
                var yy:Number = bezierY(t);
                //取整
                pixels[nIndex] = new Point(int(xx + 0.5), int(yy + 0.5));
                for (var i:int = 0; i < STEP; i++)
                {
                    var pt:Point = pixels[nIndex];
                    if (pt.x == 0 && pt.y == 0)
                    {
                        break;
                    }
                    this.graphics.lineTo(pt.x, pt.y);
                }
                nIndex++;
            }
            else
            {
                timer.removeEventListener(TimerEvent.TIMER, timerHandler);
            }
        }

        /**
         * x坐标方程
         * @param t
         * @return
         */
        private function bezierX(t:Number):Number
        {
            var it:Number = 1 - t;
            return it * it * it * P0.x + 3 * it * it * t * P1.x + 3 * it * t * t * P2.x + t * t * t * P3.x;
        }

        /**
         * y坐标方程
         * @param t
         * @return
         */
        private function bezierY(t:Number):Number
        {
            var it:Number = 1 - t;
            return it * it * it * P0.y + 3 * it * it * t * P1.y + 3 * it * t * t * P2.y + t * t * t * P3.y;
        }

        /**
         * x坐标速度方程
         * @param t
         * @return
         */
        private function bezierSpeedX(t:Number):Number
        {
            var it:Number = 1 - t;
            return -3 * P0.x * it * it + 3 * P1.x * it * it - 6 * P1.x * it * t + 6 * P2.x * it * t - 3 * P2.x * t * t + 3 * P3.x * t * t;
        }

        /**
         * y坐标速度方程
         * @param t
         * @return
         */
        private function bezierSpeedY(t:Number):Number
        {
            var it:Number = 1 - t;
            return -3 * P0.y * it * it + 3 * P1.y * it * it - 6 * P1.y * it * t + 6 * P2.y * it * t - 3 * P2.y * t * t + 3 * P3.y * t * t;
        }

        /**
         * 速度方程
         * @param t
         * @return
         */
        private function bezierSpeed(t:Number):Number
        {
            var sx:Number = bezierSpeedX(t);
            var sy:Number = bezierSpeedY(t);
            return Math.sqrt(sx * sx + sy * sy);
        }

        /**
         * 长度方程,使用Simpson积分算法
         * @param t
         * @return
         */
        private function bezierLength(t:Number):Number
        {
            var TOTAL_SIMPSON_STEP:Number = 10000;//在总长度范围内，使用simpson算法的分割数
            //分割份数
            var stepCounts:int = int(TOTAL_SIMPSON_STEP * t);
            if (stepCounts % 2) stepCounts++;//使stepCounts成为偶数
            if (stepCounts == 0) return 0.0;

            var halfCounts:int = stepCounts / 2;
            var sum1:Number = 0.0;
            var sum2:Number = 0.0;
            var dStep:Number = t / stepCounts;
            for (var i:int = 0; i < halfCounts; i++)
            {
                sum1 += bezierSpeed((2 * i + 1) * dStep);
                if (i) sum2 += bezierSpeed((2 * i) * dStep);
            }
            return (bezierSpeed(0.0) + bezierSpeed(1.0) + 2 * sum2 + 4 * sum1) * dStep / 3.0;
        }

        private function bezierEven(t:Number):Number
        {//根据t推导出匀速运动自变量t'的方程(使用牛顿切线法)
            var len:Number = t * total_length;//如果按照匀速增长,此时对应的曲线长度
            var t1:Number = t;
            var t2:Number;
            do {
                t2 = t1 - (bezierLength(t1) - len) / bezierSpeed(t1);
                if (Math.abs(t1 - t2) < 0.000001) break;
                t1 = t2;
            } while (true);
            return t2;
        }
    }
}

/**
 * <ui>
 *<li>desc:It is a beautify circle,share it</li>
 * <li>E-mail: hellogavin1988#gmail.com</li>
 * <li>version 1.0.0</li>
 *<li> 创建时间：2014/8/14 17:07</li>
 *</ui>
 *@author zhengxuesong
 * */
package
{
    import flash.display.BlendMode;
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class BeautifyCircle extends Sprite
    {
        private var m_Container:Sprite;
        private var m_CircleRadius:int;
        private var m_LineNum:int;
        private var m_RectContainer:Sprite;

        public function BeautifyCircle()
        {
            super();
            initCircle();
            initRectContainer();
            addEvent();
        }

        private function addEvent():void
        {
            m_Container.addEventListener(MouseEvent.CLICK, refresh);
        }

        /**
         * while you click the circle more line will be added to stage and rearrange
         * @param event
         */
        private function refresh(event:MouseEvent):void
        {
            while (m_RectContainer.numChildren > 0)
                m_RectContainer.removeChildAt(0);
            m_LineNum++;
            draw();
        }

        private function initRectContainer():void
        {
            m_RectContainer = new Sprite();
            m_Container.addChild(m_RectContainer);
        }

        private function initCircle():void
        {
            var sprite1:Sprite = drawCircle(0xFF0000, 0, 0, m_CircleRadius);
            m_Container.addChild(sprite1);
            var sprite2:Sprite = drawCircle(0xFF0000, 0, 0, 5);
            m_Container.addChild(sprite2);

            blendMode = BlendMode.LAYER;
            sprite1.blendMode = BlendMode.ERASE;
        }

        private function drawRect($width:int, $height:int):Sprite
        {
            var rect:Sprite = new Sprite();
            rect.graphics.beginFill(Math.random() * 900000);
            rect.graphics.drawRect(-0.5 * $width, -0.5 * $height, $width, $height);

            return rect;
        }

        private function drawCircle(color:int, $x:int, $y:int, radius:int):Sprite
        {
            var circle:Sprite = new Sprite();
            circle.graphics.beginFill(color);
            circle.graphics.drawCircle($x, $y, radius);
            circle.graphics.endFill();
            return circle;
        }

        private function draw():void
        {
            var degree:Number = 360 / m_LineNum;
            var rectW:int = 10;
            var rectH:int = 20;

            for (var i:int = 1; i <= m_LineNum; i++)
            {
                var currDegree:Number = degree * i * Math.PI / 180;
                var rotationMc:Sprite = drawRect(rectW, rectH);

                rotationMc.rotation = currDegree * 180 / Math.PI;

                rotationMc.x = Math.sin(currDegree) * (m_CircleRadius - 0);
                rotationMc.y = Math.cos(currDegree) * (m_CircleRadius - 0) * -1;

                m_RectContainer.addChild(rotationMc);
            }
        }

    }
}

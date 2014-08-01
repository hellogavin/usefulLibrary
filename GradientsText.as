/**
 * <ui>
 *<li>desc:</li>
 * <li>E-mail: hellogavin1988#gmail.com</li>
 * <li>version 1.0.0</li>
 *<li> 创建时间：2014/7/31 17:51</li>
 *</ui>
 *@author zhengxuesong
 * */
package
{
    import flash.display.GradientType;
    import flash.display.Graphics;
    import flash.display.SpreadMethod;
    import flash.display.Sprite;
    import flash.filters.GlowFilter;
    import flash.geom.Matrix;
    import flash.text.AntiAliasType;
    import flash.text.TextField;
    import flash.text.TextFormat;

    public class GradientsText extends Sprite
    {
        public function GradientsText(colors:Array = null, alphas:Array = null, ratios:Array = null, matr:Matrix = null)
        {
            if (!colors)
            {
                colors = [0xFFFF00, 0xFF0000];
            }
            if (!alphas)
            {
                alphas = [1, 1];
            }
            if (!ratios)
            {
                ratios = [0, 255];
            }
            if (!matr)
            {
                matr = new Matrix();
                matr.createGradientBox(50, 15, Math.PI / 2, 0, 0);
            }

            var sp:Sprite = new Sprite();
            sp.cacheAsBitmap = true;
            addChild(sp);

            _textField = new TextField();
            _textField.antiAliasType = AntiAliasType.ADVANCED;
            _textField.cacheAsBitmap = true;
            _textField.selectable = false;
            addChild(_textField);

            sp.mask = _textField;

            filters = [new GlowFilter(0, 1, 2, 2, 4)];

            _colors = colors;
            _alphas = alphas;
            _ratios = ratios;
            _matrix = matr;
        }

        private var _colors:Array;
        private var _alphas:Array;
        private var _ratios:Array;
        private var _matrix:Matrix;
        private var _width:Number = 0;
        private var _height:Number = 0;
        public var _textField:TextField;

        override public function set width(value:Number):void
        {
            _width = value;
            _textField.width = value;
            Render();
        }

        override public function set height(value:Number):void
        {
            _height = value;
            _textField.height = value;
            Render();
        }

        private function Render():void
        {
            var g:Graphics = Sprite(this.getChildAt(0)).graphics;
            g.clear();
            if (_height == 0 || _width == 0) return;
            g.beginGradientFill(GradientType.LINEAR, _colors, _alphas, _ratios, _matrix, SpreadMethod.PAD);
            g.drawRect(0, 0, _width, _height);
            g.endFill();
        }

        public function set text(val:String):void
        {
            _textField.text = val;
            if (_width < _textField.textWidth + 10)
            {
                width = _textField.textWidth + 10;
            }
            if (_height < _textField.textHeight + 6)
            {
                height = _textField.textHeight + 6;
            }
        }

        public function get text():String
        {
            return _textField.text;
        }

        public function ResetText(txt:String):void
        {
            this.text = txt;
            Render();
        }

        public function set Colors(clrs:Array):void
        {
            if (!clrs) return;
            _colors = clrs;
            Render();
        }

        public function set htmlText(val:String):void
        {
            _textField.htmlText = val;
        }

        public function set defaultTextFormat(val:TextFormat):void
        {
            _textField.defaultTextFormat = val;
            _textField.setTextFormat(val);
            Render();
        }

        public function set textColor(val:uint):void
        {
            _textField.textColor = val;
        }

        public function set wordWrap(val:Boolean):void
        {
            _textField.wordWrap = val;
        }

        public function set multiline(val:Boolean):void
        {
            _textField.multiline = val;
        }

        public function set autoSize(val:String):void
        {
            _textField.autoSize = val;
        }

        public function get TextWidth():Number
        {
            return _textField.textWidth;
        }

        public function get TextHeight():Number
        {
            return _textField.textHeight;
        }
    }
}

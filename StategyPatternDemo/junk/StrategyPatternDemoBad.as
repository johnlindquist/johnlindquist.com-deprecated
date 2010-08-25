package
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Quad;

    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    [SWF(backgroundColor="0xededed", frameRate="60")]
    public class StrategyPatternDemo extends Sprite
    {
        private var viking:Sprite;
        private var isFlying:Boolean;

        public function StrategyPatternDemo()
        {
            viking = new Sprite();
            viking.graphics.beginFill(0xcc0000);
            viking.graphics.drawRect(0, 0, 50, 15);
            viking.graphics.endFill();

            isFlying = true;

            viking.x = 100;
            viking.y = 100;

            addChild(viking);

            stage.addEventListener(MouseEvent.CLICK, onMouseClick);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp)
        }

        private function onKeyUp(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case 49://keyboard 1
                    isFlying = true;
                    break;

                case 50://keyboard 2
                    isFlying = false;
                    break;
            }
        }

        private function onMouseClick(event:MouseEvent):void
        {
            var tweenVars:Object = {x:event.stageX,  y:event.stageY, scaleX:1, scaleY:1, rotation:0};

            if (isFlying)
            {
                tweenVars.ease = Quad.easeInOut;
                TweenMax.to(viking, .5, tweenVars);
            }
            else
            {

                tweenVars.bezierThrough = [
                    {rotation:18},
                    {rotation:-18},
                    {rotation:18},
                    {rotation:-18}
                ];
                TweenMax.to(viking, 3, tweenVars);
            }

        }
    }
}

package
{
    import com.greensock.TweenMax;
    import com.greensock.easing.Quad;

    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    import patterncraft.strategy.Fly;
    import patterncraft.strategy.Raven;
    import patterncraft.strategy.Swim;
    import patterncraft.strategy.Teleport;
    import patterncraft.strategy.Viking;
    import patterncraft.strategy.Walk;

    [SWF(backgroundColor="0xededed", frameRate="60")]
    public class StrategyPatternDemo extends Sprite
    {
        private var raven:Raven;

        public function StrategyPatternDemo()
        {
            raven = new Raven();

            raven.moveBehavior = new Fly();

            raven.x = 100;
            raven.y = 100;

            addChild(raven);

            stage.addEventListener(MouseEvent.CLICK, onMouseClick);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp)
        }

        private function onKeyUp(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case 49://keyboard 1
                    raven.moveBehavior = new Fly();
                    break;

                case 50://keyboard 2
                    raven.moveBehavior = new Walk();
                    break;

                case 51://keyboard 3
                    raven.moveBehavior = new Swim();
                    break;

                case 52://keyboard 4
                    raven.moveBehavior = new Teleport();
                    break;
            }
        }

        private function onMouseClick(event:MouseEvent):void
        {
            var tweenVars:Object = {x:event.stageX,  y:event.stageY, scaleX:1, scaleY:1, rotation:0};
            raven.move(tweenVars);
        }
    }
}

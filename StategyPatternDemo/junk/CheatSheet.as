package
{
    public class CheatSheet
    {

        public function CheatSheet()
        {
            //walk
            tweenVars.bezierThrough = [
                {rotation:18},
                {rotation:-18},
                {rotation:18},
                {rotation:-18}
            ];
            TweenMax.to(movableUnit, 3, tweenVars);

            //fly
            TweenMax.to(movableUnit, .5, tweenVars);

            //swim
            tweenVars.bezierThrough = [
                {scaleX:1.8, scaleY:1.8},
                {scaleX:1, scaleY:1},
                {scaleX:1, scaleY:1}
            ];
            TweenMax.to(movableUnit, 3, tweenVars);

            //teleport
            TweenMax.to(movableUnit, 0, tweenVars);

            //Raven
            graphics.beginFill(0xcc0000);
            graphics.drawRect(0, 0, 50, 15);
            graphics.endFill();
        }
    }
}
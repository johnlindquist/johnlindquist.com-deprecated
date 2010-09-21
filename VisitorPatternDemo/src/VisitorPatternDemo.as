package
{
    import com.greensock.TweenMax;

    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;

    import patterncraft.units.Armored;
    import patterncraft.units.IInfantry;
    import patterncraft.units.Light;
    import patterncraft.visitors.IVisitor;
    import patterncraft.visitors.SiegeTankBullet;
    import patterncraft.visitors.StatsVisitor;

    public class VisitorPatternDemo extends Sprite
    {
        private var infantry:Array = new Array();

        public function VisitorPatternDemo()
        {
            for (var i:int = 0; i < 10; i++)
            {
                var light:Light = new Light();
                light.x = Math.random() * stage.stageWidth;
                light.y = Math.random() * stage.stageHeight;

                addChild(light);

                light.addEventListener(MouseEvent.CLICK, onInfantryClick);

                infantry.push(light);

                var armored:Armored = new Armored();
                armored.x = Math.random() * stage.stageWidth;
                armored.y = Math.random() * stage.stageHeight;
                addChild(armored);

                armored.addEventListener(MouseEvent.CLICK, onInfantryClick);

                infantry.push(armored);
            }

            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp)
        }

        private function onKeyUp(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case Keyboard.SPACE:
                    //TODO: implement splash damage

                    var siegeTankBullet:SiegeTankBullet = new SiegeTankBullet();

                    for each (var infantryDude:IInfantry in infantry)
                    {
                        infantryDude.accept(siegeTankBullet);
                    }

                    break;

                case Keyboard.ENTER:
                    //TODO: implement stats report

                    var statsVisitor:StatsVisitor = new StatsVisitor();

                    for each (var infantryDude:IInfantry in infantry)
                    {
                        infantryDude.accept(statsVisitor);
                    }

                    statsVisitor.print();

                    break;
            }
        }

        private function onInfantryClick(event:MouseEvent):void
        {
            //Gratuitous tween logic for visuals
            var infantryDude:IInfantry = event.currentTarget as IInfantry;

            var bullet:SiegeTankBullet = new SiegeTankBullet();
            bullet.x = stage.stageWidth / 2;
            bullet.y = stage.stageHeight / 2;
            addChild(bullet);

            TweenMax.to(bullet, 1, {x:infantryDude.x,  y:infantryDude.y, onComplete:onInfantryHit, onCompleteParams:[infantryDude, bullet]});
        }

        private function onInfantryHit(infantryDude:IInfantry, bullet:IVisitor):void
        {
            //TODO: implement damage based on bullet type and infantry type
            infantryDude.accept(bullet);
        }
    }
}

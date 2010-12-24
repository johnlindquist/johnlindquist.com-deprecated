package
{
    import com.greensock.TweenMax;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.text.TextField;

    import patterncraft.chain.Marine;
    import patterncraft.chain.Medivac;

    [SWF(backgroundColor="0xffffff", frameRate="60", width="800", height="600")]
    public class ChainOfResposibilityDemo extends Sprite
    {
        private var marines:Array = [];
        private var chain:Medivac = new Medivac();

        private var totalMedivacs:int = 200;

        public function ChainOfResposibilityDemo()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            
            var totalMarines:int = 5000;

            var row:int = 0;
            for (var i:int = 0; i < totalMarines; i++)
            {
                var marine:Marine = new Marine();
                marine.x = i * 10 + 5 - 800 * row;
                marine.y = 10 + row * 10;
                if(marine.x + 10 > 800)
                {
                    row++;
                }
                marine.addEventListener(Event.CHANGE, onMarineHealed);
                addChild(marine);
                marines.push(marine);
                TweenMax.to(marine, 0, {colorTransform:{tint:0xff0000, tintAmount:marine.health}});
            }
            
            addChild(chain);
            for(var i:int = 0; i < totalMedivacs; i++)
            {
                var medivac:Medivac = new Medivac();
                addChild(medivac);
                chain.add(medivac);
            }
            
            for(var i:int = 0; i < totalMedivacs; i++)
            {
                var hurtMarine:Marine = getHurtMarine();
                chain.heal(hurtMarine);
            }
        }

        private function onMarineHealed(event:Event):void
        {
            var marine:Marine = getHurtMarine();
            if(marine != null)
            {
                chain.heal(marine);            
            }
        }

        private function getHurtMarine():Marine
        {
            return marines.shift();
        }
    }
}

package
{
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;

    import flash.events.MouseEvent;
    import flash.ui.Keyboard;

    import patterncraft.state.SiegeTank;

    [SWF(backgroundColor="0xededed", frameRate="60")]
    public class StatePatternDemo extends Sprite
    {
        private var siegeTank:SiegeTank;

        public function StatePatternDemo()
        {
            siegeTank = new SiegeTank();

            siegeTank.x = 100;
            siegeTank.y = 100;
            
            addChild(siegeTank);

            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
            stage.addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onClick(event:MouseEvent):void
        {
            siegeTank.move(event.stageX, event.stageY);
        }
        
        private function onKeyUp(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case Keyboard.SPACE:
                    siegeTank.attack();
                    break;
                
                case 49://keyboard 1
                    siegeTank.toTankMode();
                    break;

                case 50://keyboard 2
                    siegeTank.toSiegeMode();
                    break;
                
                case 51://keyboard 3
                    siegeTank.toSpeedMode();
                    break;
            }
        }
    }
}

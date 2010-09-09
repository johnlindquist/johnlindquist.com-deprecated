package
{
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    import patterncraft.command.AttackCommand;
    import patterncraft.command.CommandList;
    import patterncraft.command.GatherCommand;
    import patterncraft.command.MoveCommand;
    import patterncraft.command.SCV;

    [SWF(backgroundColor="0xededed", frameRate="60")]
    public class CommandPatternDemo extends Sprite
    {
        private var scv:SCV;
        private var commandList:CommandList;

        public function CommandPatternDemo()
        {
            scv = new SCV();
            addChild(scv);

            commandList = new CommandList();
            
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
            stage.addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onClick(event:MouseEvent):void
        {
            commandList.add(new MoveCommand(scv, event.stageX, event.stageY));
        }

        private function onKeyUp(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case 49://keyboard 1
                    commandList.add(new AttackCommand(scv));
                    break;

                case 50://keyboard 2
                    commandList.add(new GatherCommand(scv));
                    break;
            }
        }
    }
}

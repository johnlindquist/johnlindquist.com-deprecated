package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    import patterncraft.memento.MarineRecorder;
    import patterncraft.memento.Marine;

    [SWF(width="900", height="480", backgroundColor="#000000", frameRate="31")]
    public class MementoPatternDemo extends Sprite
    {
        private var marine:Marine;
        private var stateSaver:MarineRecorder;
        private var isRecording:Boolean;

        public function MementoPatternDemo()
        {
            marine = new Marine();
            addChild(marine);

            stateSaver = new MarineRecorder(marine);

            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
        }

        private function onEnterFrame(event:Event):void
        {
            //A little bit of x and y easing to make the demo sexier ;)
            marine.x += (mouseX - marine.x) * .3;
            marine.y += (mouseY - marine.y) * .3;
            stateSaver.record();
        }


        private function keyDownHandler(event:KeyboardEvent):void
        {
            switch (event.keyCode)
            {
                case Keyboard.SPACE:
                    if (isRecording)
                    {
                        removeEventListener(Event.ENTER_FRAME, onEnterFrame);
                        stateSaver.stop();
                    }
                    else
                    {
                        addEventListener(Event.ENTER_FRAME, onEnterFrame);
                        stateSaver.reset();
                    }
                    isRecording = !isRecording;
                    break;

                case Keyboard.RIGHT:
                    stateSaver.play();
                    break;

                case Keyboard.LEFT:
                    stateSaver.rewind();
                    break;
            }
        }
    }
}

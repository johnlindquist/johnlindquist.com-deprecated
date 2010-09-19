package
{
    import flash.display.Sprite;

    import flash.events.Event;

    import mx.messaging.AbstractConsumer;
    import mx.messaging.messages.AbstractMessage;


    public class IDEWars extends Sprite
    {
        private var abstractConsumer:AbstractConsumer = new AbstractConsumer();

        public function IDEWars()
        {
            var abstractMessage:AbstractMessage = new AbstractMessage();

            trace("something");
            
            sendMessage(abstractConsumer, abstractMessage);
        }

        private function sendMessage(abstractConsumer:AbstractConsumer, abstractMessage:AbstractMessage):void
        {
            trace(abstractConsumer.clientId, abstractMessage.messageId);
            dispatchEvent(new Event(Event.COMPLETE));
            anotherMethod("hello");
        }

        private function anotherMethod(param:*):void
        {
            param.hello = "yo";            
        }
    }
}

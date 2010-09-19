package patterncraft.memento
{
    public class MarineRecorder
	{
		private var marine:Marine;
		private var mementos:Array = [];
		private var mementoIndex:uint = 0;
		
		public function MarineRecorder(marine:Marine)
		{
			this.marine = marine;
		}
	
		public function play():void
		{
			if(mementoIndex < mementos.length - 1)
			{
				mementoIndex++;
                //TODO: get memento from array
                marine.memento = mementos[mementoIndex];
			}
		}

		public function rewind():void
		{
			if(mementoIndex > 0)
			{
				mementoIndex--;
                //TODO: get memento from array
                marine.memento = mementos[mementoIndex];
			}
		}

		public function record():void
		{
            //TODO: store memento in array
            mementos.push(marine.memento);
		}

        public function reset():void
        {
            mementos = [];
        }

        public function stop():void
        {
            mementoIndex = mementos.length;
        }
    }
}
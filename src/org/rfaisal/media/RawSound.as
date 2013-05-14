package org.rfaisal.media
{
	import flash.media.Sound;
	import flash.events.SampleDataEvent;
	import flash.utils.ByteArray;
	
	/**
	 * Construct sound from raw bytes.
	 * @author Faisal Rahman
	 */
	public class RawSound extends Sound 
	{
		/**
		 * Sample rate. Max tested is 8192.
		 */
		private const NUM_SAMPLES:int = 2048;
		protected var bytes:ByteArray;
		protected var loop:Boolean;
		/**
		 * 
		 * @param	bytes sound bytes
		 * @param	loop should loop the sound over and over again. Until stop is called.
		 */
		public function RawSound(bytes:ByteArray,loop:Boolean=false) 
		{
			this.bytes = bytes;
			this.bytes.position = 0;
			this.loop = loop;
			super();
			this.addEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData, false, 0, true);
		}
		protected function onSampleData(e:SampleDataEvent):void 
		{
			for (var i:int = 0; i < NUM_SAMPLES; i++)
			{
				if (loop && bytes.bytesAvailable < 8) 
					bytes.position = 0;
				if(bytes.bytesAvailable>=8){ // 8 = 4 bytes for each Channel
					e.data.writeFloat(bytes.readFloat());		//Left Channel
					e.data.writeFloat(bytes.readFloat());		//Right Channel
				}
			}
		}
	}

}
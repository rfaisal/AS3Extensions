package org.rfaisal.net
{
	import flash.net.NetConnection;
	/**
	 * This class is created to deal with possibe bug in the Flash Media Server.
	 * If your flash player/ sdk version can not connect to the flash media server using RTMP then use this class instead of NetConnection
	 * If the error says some problem with onBWDone or onBWCheck then use this class.
	 * @author: Faisal Rahman
	 **/ 
	public class FlashMediaServerConnection extends NetConnection
	{
		public function FlashMediaServerConnection()
		{
			super();
		}
		public function get onBWDone():Function{
			return function():void{};
		}
		public function get onBWCheck():Function{
			return function():void{};
		}
	}
}
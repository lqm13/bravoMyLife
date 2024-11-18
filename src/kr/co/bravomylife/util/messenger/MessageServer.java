package kr.co.bravomylife.util.messenger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class MessageServer {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MessageServer.class);
	
	/** Server */
	ServerSocket server		= null;
	
	/** Client */
	public Socket client	= null;
	
	public static void main(String args[]) {
		
		int port = 8080;
		
		if (args.length > 0 && args[0] != null && !args[0].equals("")) port = Integer.parseInt(args[0]);
		
		new MessageServer(port);
	}
	
	/**
	 * @param port [포트]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public MessageServer(int port) {
		try {
			server = new ServerSocket(port);
			
			logger.info("---------------------------------------------------------------------------");
			logger.info("com.bravomylife.util.messenger.MessageServer has started at " + port + " port");
			logger.info("---------------------------------------------------------------------------");
			
			while (true) {
				client = server.accept();
				logger.info("A new client has connected... " + client.getInetAddress().getHostAddress() +" at com.bravomylife.util.messenger.MessageServer");
				
				ClientHandler clientHandler = new ClientHandler(client);
				clientHandler.start();
			}
		}
		catch (IOException e) {
			logger.error("[" + this.getClass().getName() + ".MessageServer()] " + e.getMessage(), e);
		}
	}
}

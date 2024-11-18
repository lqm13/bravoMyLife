package kr.co.bravomylife.util.messenger;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class ClientHandler extends Thread {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ClientHandler.class);
	
	@SuppressWarnings("rawtypes")
	protected static Vector handler = new Vector();
	
	/** Client */
	protected Socket client;
	
	/** Input/Output Object Stream */
	protected ObjectInputStream objectInputStream;
	protected ObjectOutputStream objectOutputStream;
	
	/**
	 * @param client [클라이언트]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	public ClientHandler(Socket client) {
		this.client = client;
		
		try {
			objectOutputStream	= new ObjectOutputStream(client.getOutputStream());
			objectInputStream	= new ObjectInputStream(client.getInputStream());
		}
		catch (IOException e) {
			logger.error("[" + this.getClass().getName() + ".ClientHandler()] " + e.getMessage(), e);
		}
		handler.addElement(this);
	}
	
	/**
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public void run() {
		
		MessageObject messageObject = null;
		
		while (true) {
			
			try {
				if (objectOutputStream != null)
				messageObject = (MessageObject) objectInputStream.readObject();
			}
			catch (Exception e) {
				exit(this);
				logger.error("[" + this.getClass().getName() + ".run()] " + e.getMessage(), e);
				return;
			}
			
			if (messageObject.getControl() == -1) {
				broadcast(messageObject);
				exit(this);
				return;
			}
			else {
				broadcast(messageObject);
			}
		}
	}
	
	/**
	 * @param messageObject [메시지 객체]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public void broadcast(MessageObject messageObject) {
		int countClient = handler.size();
		
		for (int nLoop = 0; nLoop < countClient; nLoop++) {
			
			try {
				ClientHandler clientHandler = (ClientHandler) handler.elementAt(nLoop);
				clientHandler.objectOutputStream.writeObject(messageObject);
				clientHandler.objectOutputStream.flush();
				clientHandler = null;
			}
			catch (IOException e) {
				logger.error("[" + this.getClass().getName() + ".broadcast()] " + e.getMessage(), e);
			}
		}
	}
	
	/**
	 * @param clientHandler [클라이언트 핸들러]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public void exit(ClientHandler clientHandler) {
		
		int numClient = handler.indexOf(clientHandler);
		
		if (numClient >= 0) {
			handler.removeElementAt(numClient);
			
			try {
				if (clientHandler.objectOutputStream != null) clientHandler.objectOutputStream.close();
				if (clientHandler.objectInputStream != null) clientHandler.objectInputStream.close();
				if (clientHandler.client != null) clientHandler.client.close();
			}
			catch (IOException e) {
				logger.error("[" + this.getClass().getName() + ".exit()] " + e.getMessage(), e);
			}
		}
	}

}

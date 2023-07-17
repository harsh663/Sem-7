import java.net.*;
import java.io.*;
import java.util.*;
import java.lang.Math;
public class Server {
	public static void main(String[] args) throws IOException
	{
		try {
			int port = 8088;
			Scanner sc = new Scanner(System.in);
			// Server Key
			System.out.println("Enter the value of server key:- ");
			int b = sc.nextInt();

			// Client p, g, and key
			double clientP, clientG, clientA, B, Bdash;
			String Bstr;

			// Established the Connection
			ServerSocket serverSocket = new ServerSocket(port);
			System.out.println("Waiting for client on port " + serverSocket.getLocalPort() + "...");
			Socket server = serverSocket.accept();
			System.out.println("Just connected to " + server.getRemoteSocketAddress());

			// Server's Private Key
			System.out.println("From Server : Private Key = " + b);

			// Accepts the data from client
			DataInputStream in = new DataInputStream(server.getInputStream());

			clientP = Integer.parseInt(in.readUTF()); // to accept p
			System.out.println("From Client : P = " + clientP);

			clientG = Integer.parseInt(in.readUTF()); // to accept g
			System.out.println("From Client : G = " + clientG);

			clientA = Double.parseDouble(in.readUTF()); // to accept A
			System.out.println("From Client : Public Key = " + clientA);

			B = ((Math.pow(clientG, b)) % clientP); // calculation of B
			Bstr = Double.toString(B);

			// Sends data to client
			// Value of B
			OutputStream outToclient = server.getOutputStream();
			DataOutputStream out = new DataOutputStream(outToclient);

			out.writeUTF(Bstr); // Sending B

			Bdash = ((Math.pow(clientA, b)) % clientP); // calculation of Bdash

			System.out.println("Secret Key to perform Symmetric Encryption = "
							+ Bdash);
			
			double inputnumber = Double.parseDouble(in.readUTF());
			System.out.println(inputnumber);
			int number = (int)(((Math.cbrt(inputnumber))));
			int square = number*number*4;
			String n = Integer.toString(square);
			out.writeUTF(n);
			System.out.println("Sending Result Encrypted = "+ n);
			server.close();
		}

		catch (SocketTimeoutException s) {
			System.out.println("Socket timed out!");
		}
		catch (IOException e) {
		}
	}
}

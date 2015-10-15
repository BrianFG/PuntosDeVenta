package conexion;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	private String usuario;
    private String password ;
    private String[] para ;
    private String mensaje;
    private String titulo;
    private String host;
    private String port;
	public Email(String usuario, String password, String[] para,
			String mensaje, String titulo, String host, String port) {
		super();
		this.usuario = usuario;
		this.password = password;
		this.para = para;
		this.mensaje = mensaje;
		this.titulo = titulo;
		this.host = host;
		this.port = port;
	}
    
	public void send(){
		Properties props = System.getProperties();
        //String host = "mail.bpotecnologia.com" ;
        props.put("mail.smtp.starttls.enable", "false");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", usuario);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(usuario));
            InternetAddress[] toAddress = new InternetAddress[para.length];

            // To get the array of addresses
            for( int i = 0; i < para.length; i++ ) {
                toAddress[i] = new InternetAddress(para[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(titulo);
            message.setText(mensaje);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, usuario, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
	
	public static void main(String[] args) {
		String [] para = {"brianfg94@gmail.com"};
		Email email = new Email("brian.flores@bpotecnologia.com", "Mexico01", para , "holsa", "hola", "mail.bpotecnologia.com", "587");
		email.send();
	}
	

}

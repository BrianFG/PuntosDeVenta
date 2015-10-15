package conexion;

public class EmailBPO {
	
	private String[] para;
	private String mensaje;
	private String titulo;
	private static String HOST = "mail.bpotecnologia.com"; 
	private static String PORT = "587";
	private static String USER = "brian.flores@bpotecnologia.com";
	private static String PASSWORD = "Mexico01";
	private Email email;
	
	public EmailBPO(String[] para, String mensaje, String titulo) {
		super();
		this.para = para;
		this.mensaje = mensaje;
		this.titulo = titulo;
		email = new Email(USER, PASSWORD, para, mensaje, titulo, HOST, PORT);
	}
	
	public void send(){
		email.send();
	}
	
	public static void main(String[] args) {
		String[] para = {"brianfg94@gmail.com"};
		EmailBPO email = new EmailBPO(para, "holi", "holi");
		email.send();
	}
	
	
	

}

import java.time.LocalTime;
import java.io.*;

public aspect Logger{
	//after() : execution(void Bank.moneyMakeTransaction()) {			
	//Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	File file = new File("log.txt");    
	pointcut successTransaction() : call(* com.bank.Bank.moneyMakeTransaction());
    after() : successTransaction() {
    	String resultado = LocalTime.now()+" Transacci�n completada exitosamente.\n";
    	System.out.println(resultado);
    	try {
    		FileWriter fileWriter = new FileWriter(file,true);
    		fileWriter.write(resultado);
    		fileWriter.close();
    	}
    	catch(IOException e) {
    		System.out.println("Error");
    	}
    }
	pointcut successWithdrawal() : call(* com.bank.Bank.moneyWithdrawal());
	after() : successWithdrawal() {
		String resultado = LocalTime.now()+" Retiro completado exitosamente.\n";
		System.out.println(resultado);
		try {
			FileWriter fileWriter = new FileWriter(file,true);
			fileWriter.write(resultado);
			fileWriter.close();
		}
		catch(IOException e) {
			System.out.println("Error");
		}
	}
	
	pointcut success() : call(* com.bank.Bank.createUser() );
	after() : success() {
		System.out.println("**** Usuario creado ****");
	}
}


/*public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
}
*/



import java.time.LocalTime;
import java.io.*;

public aspect Logger {
	//after() : execution(void Bank.moneyMakeTransaction()) {
		FileWriter file = new FileWriter("C:\Users\Denise\workspace\GitHub\log.txt");		
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut successTransaction() : call(* com.bank.Bank.moneyMakeTransaction());
	    after() : successTransaction() {
	    
	    	String resultado = LocalTime.now()+": Transacción completada exitosamente. "
	    	
	    	System.out.println(resultado);
	    	
	    	try {
	    		file.write(resultado);
	    		flie.close();
	    	}
	    	
	    	catch(Exception e) {
		    	
				System.out.println("Error");
	    	}
	    	
	    	
	    }
	    pointcut successWithdrawal() : call(* com.bank.Bank.moneyWithdrawal());
	    after() : successWithdrawal() {
	    	System.out.println(LocalTime.now()+": Retiro completado exitosamente. ");
	    	
	    }
}


/*public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}
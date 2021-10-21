import java.io.File;
import java.time.LocalDateTime;

public aspect Logger {
	//after() : execution(void Bank.moneyMakeTransaction()){
		File file = new File("log.txt");
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut successTransaction() : call(* com.bank.Bank.moneyMakeTransaction());
	    after() : successTransaction() {
	    	System.out.println(LocalDateTime.now()+": Transacción completada exitosamente. ");
	    	
	    }	
}


/*public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}*/
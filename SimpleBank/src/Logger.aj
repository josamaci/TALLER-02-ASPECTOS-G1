import java.time.LocalTime;

import org.aspectj.lang.reflect.Pointcut;

import com.bank.Bank;

import java.io.*;

public aspect Logger{
	//after() : execution(void Bank.moneyMakeTransaction()) {			
	//Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	File file = new File("log.txt");    
	pointcut successTransaction() : call(* money*(..));
    after() : successTransaction() {
    	String name = thisJoinPoint.getSignature().getName();
    	String resultado = LocalTime.now()+ " " + name + "\n";
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

	pointcut success() : call(* create*(..) );
	after() : success() {
		System.out.println("**** User created ****");
	}
}
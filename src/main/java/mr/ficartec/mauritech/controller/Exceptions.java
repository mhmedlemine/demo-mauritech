package mr.ficartec.mauritech.controller;

import javax.mail.MessagingException;
import javax.persistence.PersistenceException;

import org.springframework.mail.MailSendException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class Exceptions {
	
	@ExceptionHandler(value= PersistenceException.class)
	public String errorHandler(){
		
		return "error";
	}
	
	@ExceptionHandler(value= MailSendException.class)
	public String errorandler(){
		
		return "errorMail";
	}

}
